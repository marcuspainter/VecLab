//
//  CoreComplexComplexMatrix.swift
//  VecLab
//
//  Created by Marcus Painter on 20/09/2025.
//

import Accelerate

enum CoreComplexMatrix {
    
    // MARK: add

    static func add(_ a: ComplexMatrix, _ b: ComplexMatrix) -> ComplexMatrix {
        return ComplexMatrix(rows: a.rows, cols: b.cols, data: CoreComplexVector.add(a.data, b.data))
    }
    
    static func add(_ a: ComplexMatrix, _ b: Double) -> ComplexMatrix {
        return ComplexMatrix(rows: a.rows, cols: a.cols, data: CoreComplexVector.add(a.data, b))
    }
    
    static func add(_ a: Double, _ b: ComplexMatrix) -> ComplexMatrix {
        return ComplexMatrix(rows: b.rows, cols: b.cols, data: CoreComplexVector.add(a, b.data))
    }
    
    // MARK: subtract
    
    static func subtract(_ a: ComplexMatrix, _ b: ComplexMatrix) -> ComplexMatrix {
        return ComplexMatrix(rows: a.rows, cols: b.cols, data: CoreComplexVector.subtract(a.data, b.data))
    }
    
    static func subtract(_ a: ComplexMatrix, _ b: Double) -> ComplexMatrix {
        return ComplexMatrix(rows: a.rows, cols: a.cols, data: CoreComplexVector.subtract(a.data, b))
    }
    
    static func subtract(_ a: Double, _ b: ComplexMatrix) -> ComplexMatrix {
        return ComplexMatrix(rows: b.rows, cols: b.cols, data: CoreComplexVector.subtract(a, b.data))
    }
    
    // MARK: multiply

    static func multiplySwift(_ a: ComplexMatrix, _ b: ComplexMatrix) -> ComplexMatrix {
        var c = ComplexMatrix(a.rows, b.cols)
        // ComplexMatrix multiplication: C = A * B
        // Assumes column-major storage for `data` arrays.
        // A: (m x k), B: (k x n), C: (m x n)
        let m = a.rows
        let k = a.cols
        let n = b.cols

        // Optional: you may want to assert dimensions in debug builds
        assert(a.cols == b.rows, "Incompatible dimensions for ComplexMatrix multiplication")
        assert(c.rows == m && c.cols == n, "Output ComplexMatrix has incorrect dimensions")

        // Zero C
        //for idx in 0..<c.data.count {
        //    c[idx] = 0.0
        //}

        // Column-major friendly loops
        // Iterate over columns of B (and C), then over the shared dimension k,
        // and finally over rows of A (and C)
        for j in 0..<n {  // column of C / B
            let bjColOffset = j * b.rows  // start index for column j in B
            let cjColOffset = j * c.rows  // start index for column j in C

            for p in 0..<k {  // over A's columns / B's rows
                let aColOffset = p * a.rows  // start index for column p in A
                let b_pj = b[bjColOffset + p]  // element B[p, j]

                // Accumulate outer product of A[:, p] and B[p, j] into C[:, j]
                // C[i, j] += A[i, p] * B[p, j]
                for i in 0..<m {
                    c[cjColOffset + i] += a[aColOffset + i] * b_pj
                }
            }
        }
        return c
    }
    
    static func multiply(_ a: ComplexMatrix, _ b: ComplexMatrix) -> ComplexMatrix {
        let m = a.rows
        let n = b.cols
        let k = a.cols
        let l = m * n
        let data = [Complex](unsafeUninitializedCapacity: l) { result, initializedCount in
            // Alpha = 1.0, Beta = 0.0
            let alpha: [Double] = [1.0, 0.0]
            let beta: [Double] = [0.0, 0.0]
            
            a.data.withUnsafeBufferPointer { aPtr in
                b.data.withUnsafeBufferPointer { bPtr in
                    alpha.withUnsafeBufferPointer { alphaPtr in
                        beta.withUnsafeBufferPointer { betaPtr in
                            result.withUnsafeMutableBufferPointer { resultPtr in
                                
                                cblas_zgemm(
                                    CblasColMajor,                        // ORDER: Row-major storage
                                    CblasNoTrans,                         // TRANSA: Don't transpose A
                                    CblasNoTrans,                         // TRANSB: Don't transpose B
                                    m,                                    // M: Rows of A and C
                                    n,                                    // N: Columns of B and C
                                    k,                                    // K: Columns of A, rows of B
                                    OpaquePointer(alphaPtr.baseAddress!),  // ALPHA: Scaling factor for A*B
                                    OpaquePointer(aPtr.baseAddress),      // A: Matrix A
                                    k,                                    // LDA: Leading dimension of A
                                    OpaquePointer(bPtr.baseAddress),      // B: Matrix B
                                    n,                                    // LDB: Leading dimension of B
                                    OpaquePointer(betaPtr.baseAddress!),   // BETA: Scaling factor for C
                                    OpaquePointer(resultPtr.baseAddress), // C: Result matrix C
                                    n                                     // LDC: Leading dimension of C
                                )
                            }
                        }
                    }
                }
                initializedCount = l
            }
        }
        return ComplexMatrix(rows: a.rows, cols: b.cols, data: data)
    }

    static func multiply(_ a: ComplexMatrix, _ b: Double) -> ComplexMatrix {
        return ComplexMatrix(rows: a.rows, cols: a.cols, data: CoreComplexVector.multiply(a.data, b))
    }

    static func elementMultiply(_ a: ComplexMatrix, _ b: ComplexMatrix) -> ComplexMatrix {
        return ComplexMatrix(rows: a.rows, cols: a.cols, data: CoreComplexVector.multiply(a.data, b.data))
    }

    // MARK: divide
    
    static func divide(_ a: ComplexMatrix, _ b: Double) -> ComplexMatrix {
        return ComplexMatrix(rows: a.rows, cols: a.cols, data: CoreComplexVector.divide(a.data, b))
    }

    static func divide(_ a: Double, _ b: ComplexMatrix) -> ComplexMatrix {
        return ComplexMatrix(rows: b.rows, cols: b.cols, data: CoreComplexVector.divide(a, b.data))
    }

    static func elementDivide(_ a: ComplexMatrix, _ b: ComplexMatrix) -> ComplexMatrix {
        return ComplexMatrix(rows: b.rows, cols: b.cols, data: CoreComplexVector.divide(a.data, b.data))
    }
    
    // MARK: Unary

    static func unaryMinus(_ a: ComplexMatrix) -> ComplexMatrix  {
        return ComplexMatrix(rows: a.rows, cols: a.cols, data: CoreComplexVector.unaryMinus(a.data))
    }
    
    static func conjugate(_ a: ComplexMatrix) -> ComplexMatrix  {
        return ComplexMatrix(rows: a.rows, cols: a.cols, data: CoreComplexVector.conjugate(a.data))
    }
}

private func multiplyComplexMatrix() {
    
}

private func transposeComplexMatrix(
    _ src: [Complex],
    rows M: Int,
    cols N: Int,
    result dst: inout [Complex]
) {
    precondition(src.count == M * N)
    precondition(dst.count == M * N)

    // Safety checks: Complex must be exactly two Doubles, tightly packed
    precondition(MemoryLayout<Complex>.stride == MemoryLayout<Double>.stride * 2,
                 "Complex must be two Doubles with no padding")
    precondition(MemoryLayout<Complex>.size == MemoryLayout<Double>.stride * 2,
                 "Complex must be exactly 16 bytes")
    precondition(MemoryLayout<Complex>.alignment == MemoryLayout<Double>.alignment,
                 "Complex must have same alignment as Double")

    src.withUnsafeBufferPointer { sPtr in
        dst.withUnsafeMutableBufferPointer { dPtr in
            let sBase = UnsafeRawPointer(sPtr.baseAddress!).assumingMemoryBound(to: Double.self)
            let dBase = UnsafeMutableRawPointer(dPtr.baseAddress!).assumingMemoryBound(to: Double.self)

            // Transpose real parts
            vDSP_mtransD(
                sBase, 2,
                dBase, 2,
                vDSP_Length(N),
                vDSP_Length(M)
            )

            // Transpose imaginary parts
            vDSP_mtransD(
                sBase + 1, 2,
                dBase + 1, 2,
                vDSP_Length(N),
                vDSP_Length(M)
            )
        }
    }
}
