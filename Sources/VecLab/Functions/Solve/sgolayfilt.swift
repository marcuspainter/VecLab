//
//  sol.swift
//  VecLab
//
//  Created by Marcus Painter on 04/09/2025.
//

import Accelerate

public func sgolayfilt(x: RealArray, order: Int = 3, framelen: Int = 11) -> RealArray {

    // --- Coefficients ---
    let hfl = (framelen - 1) / 2
    let coeffs_center = compute_sg_coeffs(order, framelen);// 1×framelen
    
    return []
}

// --- Helpers ---
func compute_sg_coeffs(_ order: Int, _ framelen: Int) {
    let hfl = (framelen - 1) / 2;
    let t = vector(-hfl ... hfl)
    // V = zeros(framelen, order+1);
    let V = zeros(framelen * (order+1))
    
    //for j = 0:order
    //    V(:,j+1) = t.^j;
    //end
    // pinvV = (V' * V) \ V';
    
    // V =  framelen x (order+1)
    // VT = (order+1) x framelen
    
    let VT = matrixTranpose(V)
    let VTV = matrixMultiply(VT, V, m: framelen, n: order+1, k: framelen)
    //let pinvV = solve(VTV, VT)
    
   // let pinvV = matrixSolve(VTV, VT)
    
    //coeffs = [1, zeros(1,order)] * pinvV; // 1×framelen
    //return coeffs
}

public func matrixTranpose(_ A: [Double]) -> [Double] {
    // Convert A to column-major for LAPACK
    let n = A.count
    var Acol = [Double](repeating: 0, count: A.count)
    vDSP_mtransD(A, 1, &Acol, 1, vDSP_Length(n), vDSP_Length(n))
    return Acol
}

public func matrixMultiply(_ A: [Double], _ B: [Double], m: Int, n: Int, k: Int) -> [Double] {
    precondition(A.count == m * k, "A must be m × k")
    precondition(B.count == k * n, "B must be k × n")

    var C = [Double](repeating: 0.0, count: m * n)

    // CBLAS row-major multiplication
    cblas_dgemm(
        CblasRowMajor,   // Row-major storage
        CblasNoTrans,    // A is not transposed
        CblasNoTrans,    // B is not transposed
        m,              // Rows of A
        n,              // Columns of B
        k,              // Shared dimension
        1.0,             // Alpha
        A, k,           // A, leading dimension = k
        B, n,           // B, leading dimension = n
        0.0,             // Beta
        &C, n)          // C, leading dimension = n

    return C
}

public func matrixSolve(_ A_row: [Double], _ B_row: [Double], n: Int, nrhs: Int) -> [Double]? {
    // Infer dimensions
    precondition(A_row.count == n * n, "A must be n×n")
    precondition(B_row.count == n * nrhs, "B must be n×nrhs")

    var A_col = rowMajorToColMajor(A_row, rows: n, cols: n)
    var B_col = rowMajorToColMajor(B_row, rows: n, cols: nrhs)
    
    var N = n
    var NRHS = nrhs
    var LDA = n
    var IPIV = [Int](repeating: 0, count: n)
    var LDB = n
    var INFO = 0

    dgesv_(&N, &NRHS, &A_col, &LDA, &IPIV, &B_col, &LDB, &INFO)

    guard INFO == 0 else {
        print("Solve failed, INFO =", INFO)
        return nil
    }

    // Convert solution back to row-major
    var X_row = [Double](repeating: 0, count: B_col.count)
    X_row = colMajorToRowMajor(B_col, rows: n, cols: nrhs)
    
    return X_row
}

func rowMajorToColMajor(_ input: [Double], rows: Int, cols: Int) -> [Double] {
    precondition(input.count == rows * cols, "Invalid dimensions")

    var output = Array(repeating: 0.0, count: input.count)

    for row in 0..<rows {
        for col in 0..<cols {
            let rowMajorIndex = row * cols + col
            let colMajorIndex = col * rows + row
            output[colMajorIndex] = input[rowMajorIndex]
        }
    }

    return output
}

// Row and columns are row-major dimensions
func colMajorToRowMajor(_ input: [Double], rows: Int, cols: Int) -> [Double] {
    precondition(input.count == rows * cols, "Invalid dimensions")

    var output = Array(repeating: 0.0, count: input.count)

    for row in 0..<rows {
        for col in 0..<cols {
            let rowMajorIndex = row * cols + col
            let colMajorIndex = col * rows + row
            output[rowMajorIndex] = input[colMajorIndex]
        }
    }

    return output
}


func rowMajorToColMajor2(_ input: [Double], rows: Int, cols: Int) -> [Double] {
    precondition(input.count == rows * cols, "Invalid dimensions")
    var output = Array(repeating: 0.0, count: input.count)
    vDSP_mtransD(input, 1, &output, 1, vDSP_Length(cols), vDSP_Length(rows))
    return output
}

import Accelerate
import simd

public func matrixSolveSIMDUnsafeWhile(_ A_row: [Double], _ B_row: [Double], n: Int, nrhs: Int) -> [Double]? {
    precondition(A_row.count == n * n, "A must be n×n")
    precondition(B_row.count == n * nrhs, "B must be n×nrhs")

    let simdWidth = 4
    let simdColsA = n - (n % simdWidth)
    let simdColsB = nrhs - (nrhs % simdWidth)

    // Allocate column-major arrays without zeroing
    var A_col = [Double](unsafeUninitializedCapacity: A_row.count) { buf, cnt in cnt = A_row.count }
    var B_col = [Double](unsafeUninitializedCapacity: B_row.count) { buf, cnt in cnt = B_row.count }

    // Row-major → column-major conversion for A
    A_row.withUnsafeBufferPointer { inA in
        A_col.withUnsafeMutableBufferPointer { outA in
            let aPtr = inA.baseAddress!
            let oPtr = outA.baseAddress!
            var row = 0
            while row < n {
                let rowBase = row * n
                var col = 0
                while col <= simdColsA - simdWidth {
                    let v = SIMD4<Double>(
                        aPtr[rowBase + col + 0],
                        aPtr[rowBase + col + 1],
                        aPtr[rowBase + col + 2],
                        aPtr[rowBase + col + 3]
                    )
                    var i = 0
                    while i < simdWidth {
                        oPtr[(col + i) * n + row] = v[i]
                        i += 1
                    }
                    col += simdWidth
                }
                while col < n {
                    oPtr[col * n + row] = aPtr[rowBase + col]
                    col += 1
                }
                row += 1
            }
        }
    }

    // Row-major → column-major conversion for B
    B_row.withUnsafeBufferPointer { inB in
        B_col.withUnsafeMutableBufferPointer { outB in
            let bPtr = inB.baseAddress!
            let oPtr = outB.baseAddress!
            var row = 0
            while row < n {
                let rowBase = row * nrhs
                var col = 0
                while col <= simdColsB - simdWidth {
                    let v = SIMD4<Double>(
                        bPtr[rowBase + col + 0],
                        bPtr[rowBase + col + 1],
                        bPtr[rowBase + col + 2],
                        bPtr[rowBase + col + 3]
                    )
                    var i = 0
                    while i < simdWidth {
                        oPtr[(col + i) * n + row] = v[i]
                        i += 1
                    }
                    col += simdWidth
                }
                while col < nrhs {
                    oPtr[col * n + row] = bPtr[rowBase + col]
                    col += 1
                }
                row += 1
            }
        }
    }

    // Solve with LAPACK
    var N = n
    var NRHS = nrhs
    var LDA = n
    var LDB = n
    var INFO = 0
    var IPIV = [Int](repeating: 0, count: n)

    dgesv_(&N, &NRHS, &A_col, &LDA, &IPIV, &B_col, &LDB, &INFO)
    guard INFO == 0 else {
        print("Solve failed, INFO =", INFO)
        return nil
    }

    // Column-major → row-major conversion for solution
    let X_row: [Double] = .init(unsafeUninitializedCapacity: B_col.count) { buffer, initializedCount in
        initializedCount = B_col.count
        B_col.withUnsafeBufferPointer { inB in
            let bPtr = inB.baseAddress!
            let xPtr = buffer.baseAddress!
            var row = 0
            while row < n {
                var col = 0
                while col <= simdColsB - simdWidth {
                    let v = SIMD4<Double>(
                        bPtr[col * n + row],
                        bPtr[(col + 1) * n + row],
                        bPtr[(col + 2) * n + row],
                        bPtr[(col + 3) * n + row]
                    )
                    var i = 0
                    while i < simdWidth {
                        xPtr[row * nrhs + col + i] = v[i]
                        i += 1
                    }
                    col += simdWidth
                }
                while col < nrhs {
                    xPtr[row * nrhs + col] = bPtr[col * n + row]
                    col += 1
                }
                row += 1
            }
        }
    }

    return X_row
}
