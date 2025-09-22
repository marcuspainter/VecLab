//
//  MatrixRealMath.swift
//  VecLab
//
//  Created by Marcus Painter on 08/09/2025.
//

import Accelerate

public func matrixTranspose(_ matrix: RealArray, rows: Int, cols: Int) -> RealArray {
    var result = RealArray(repeating: 0.0, count: rows * cols)
    
    for i in 0..<rows {
        for j in 0..<cols {
            result[i * cols + j] = matrix[j * rows + i]  // Row-major indexing
        }
    }
        
    return result
}

func matrixMultiply(_ a: [Double], _ b: [Double], m: Int, k: Int, n: Int) -> [Double] {
    var result = [Double](repeating: 0.0, count: m * n)
    
    // Alpha = 1.0, Beta = 0.0
    let alpha: Double = 1.0
    let beta: Double = 0.0
    
    a.withUnsafeBufferPointer { aPtr in
        b.withUnsafeBufferPointer { bPtr in
            result.withUnsafeMutableBufferPointer { resultPtr in
                cblas_dgemm(
                    CblasColMajor,                        // ORDER: Row-major storage
                    CblasNoTrans,                         // TRANSA: Don't transpose A
                    CblasNoTrans,                         // TRANSB: Don't transpose B
                    m,                                    // M: Rows of A and C
                    n,                                    // N: Columns of B and C
                    k,                                    // K: Columns of A, rows of B
                    alpha,                                // ALPHA: Scaling factor for A*B
                    aPtr.baseAddress,                     // A: Matrix A
                    k,                                    // LDA: Leading dimension of A
                    bPtr.baseAddress,                     // B: Matrix B
                    n,                                    // LDB: Leading dimension of B
                    beta,                                 // BETA: Scaling factor for C
                    resultPtr.baseAddress,                // C: Result matrix C
                    n                                     // LDC: Leading dimension of C
                )
            }
        }
    }
    
    return result
}

func matrixVectorMultiply(_ matrix: [Double], _ vector: [Double], m: Int, n: Int) -> [Double] {
    // Matrix-vector multiplication: y = A * x
    // Where A is m×n matrix, x is n-length vector, result y is m-length vector
    
    guard matrix.count == m * n else {
        fatalError("Matrix dimensions don't match: expected \(m * n), got \(matrix.count)")
    }
    
    guard vector.count == n else {
        fatalError("Vector dimension doesn't match matrix columns: expected \(n), got \(vector.count)")
    }
    
    var result = [Double](repeating: 0.0, count: m)
    
    // Alpha = 1.0, Beta = 0.0
    let alpha: Double = 1.0
    let beta: Double = 0.0
    
    matrix.withUnsafeBufferPointer { matrixPtr in
        vector.withUnsafeBufferPointer { vectorPtr in
            result.withUnsafeMutableBufferPointer { resultPtr in
                cblas_dgemv(
                    CblasColMajor,                        // ORDER: Row-major storage
                    CblasNoTrans,                         // TRANS: No transpose of matrix
                    m,                                    // M: Number of rows of matrix
                    n,                                    // N: Number of columns of matrix
                    alpha,                                // ALPHA: Scaling factor
                    matrixPtr.baseAddress,                // A: Input matrix
                    n,                                    // LDA: Leading dimension of A
                    vectorPtr.baseAddress,                // X: Input vector
                    1,                                    // INCX: Stride of vector x
                    beta,                                 // BETA: Scaling factor for y
                    resultPtr.baseAddress,                // Y: Result vector
                    1                                     // INCY: Stride of result vector
                )
            }
        }
    }
    
    return result
}

public func rightDivision(_ A: [Double], _ B: [Double], m: Int, n: Int) -> [Double] {
    // A/B: solve X*B = A
    // Equivalent to: B^T * X^T = A^T
    
    precondition(A.count == m * n, "A must be m×n")
    precondition(B.count == n * n, "B must be n×n (square)")
    
    // Transpose A and B
    let AT = matrixTranspose(A, rows: m, cols: n)  // n×m
    let BT = matrixTranspose(B, rows: n, cols: n)  // n×n
    
    // Solve B^T * X^T = A^T
    let XT = solveRowMajor(BT, AT, n: n, nrhs: m)
    
    // Transpose result back
    return matrixTranspose(XT, rows: n, cols: m)  // m×n
}

func matrixInverse(_ matrix: inout [Double], _ n: Int) {
    // Step 1: LU factorization
    var m = n
    var lda = n
    var ipiv = Array<Int>(repeating: 0, count: n)
    var info = 0
    
    dgetrf_(&m, &m, &matrix, &lda, &ipiv, &info)
    
    if info != 0 {
        print("DGETRF error: \(info)")
        return
    }
    
    // Step 2: Compute inverse
    var lwork = -1
    var workQuery = 0.0
    
    dgetri_(&m, &matrix, &lda, &ipiv, &workQuery, &lwork, &info)
    
    lwork = Int(workQuery)
    var work = Array<Double>(repeating: 0.0, count: lwork)
    
    dgetri_(&m, &matrix, &lda, &ipiv, &work, &lwork, &info)
    
    if info != 0 {
        print("DGETRI error: \(info)")
    }
}

