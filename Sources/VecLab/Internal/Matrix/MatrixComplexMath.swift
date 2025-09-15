//
//  ComplexMatrixMath.swift
//  VecLab
//
//  Created by Marcus Painter on 08/09/2025.
//

import Accelerate

func matrixDivide(_ a: [Complex], _ b: [Complex], m: Int, k: Int, n: Int) -> [Complex] {
    // This computes A / B as A * B^(-1) by solving B * X = A for X
    // Where A is m×k, B is k×k (must be square), result X is m×k
    
    var result = a // Copy A as initial value
    var bCopy = b  // Copy B since LAPACK will modify it
    var ipiv = [Int](repeating: 0, count: k) // Pivot indices
    var info: Int = 0
    var kk = k
    
    result.withUnsafeMutableBufferPointer { resultPtr in
        bCopy.withUnsafeMutableBufferPointer { bPtr in
            ipiv.withUnsafeMutableBufferPointer { ipivPtr in
                // Step 1: Factor B using LU decomposition
                zgetrf_(&kk,                            // M: Number of rows of B
                       &kk,                             // N: Number of columns of B
                       OpaquePointer(bPtr.baseAddress), // A: Matrix B (will be overwritten with LU)
                       &kk,                             // LDA: Leading dimension of B
                       ipivPtr.baseAddress,             // IPIV: Pivot indices
                       &info)                           // INFO: Success/error code
                
                guard info == 0 else {
                    fatalError("Matrix factorization failed with info = \(info)")
                }
                
                // Step 2: Solve B * X = A using the LU factorization
                zgetrs_("N",                            // TRANS: 'N' for no transpose
                       &kk,                             // N: Order of matrix B
                       &kk,                             // NRHS: Number of right-hand sides (columns of A)
                       OpaquePointer(bPtr.baseAddress), // A: LU factorization of B
                       &kk,                             // LDA: Leading dimension of B
                       ipivPtr.baseAddress,             // IPIV: Pivot indices from factorization
                       OpaquePointer(resultPtr.baseAddress), // B: Right-hand side A, overwritten with solution X
                       &kk,                             // LDB: Leading dimension of result
                       &info)                           // INFO: Success/error code
                
                guard info == 0 else {
                    fatalError("Matrix solve failed with info = \(info)")
                }
            }
        }
    }
    
    return result
}

public func matrixTranspose(_ matrix: [Complex], rows: Int, cols: Int) -> [Complex] {
    var result = [Complex](repeating: .zero, count: rows * cols)
    
    for i in 0..<rows {
        for j in 0..<cols {
            result[i * cols + j] = matrix[j * rows + i]  // Row-major indexing
        }
    }
    return result
}

public func matrixConjugateTranspose(_ matrix: [Complex], rows: Int, cols: Int) -> [Complex] {
    var result = [Complex](repeating: .zero, count: rows * cols)
    
    for i in 0..<rows {
        for j in 0..<cols {
            let x = i * cols + j
            let y = j * rows + i
            result[x].real = matrix[y].real  // Row-major indexing
            result[x].imag = -matrix[y].imag
        }
    }
    return result
}

func matrixMultiply(_ a: [Complex], _ b: [Complex], m: Int, k: Int, n: Int) -> [Complex] {
    var result = [Complex](repeating: Complex(0, 0), count: m * n)
    
    // Alpha = 1+0i, Beta = 0+0i
    var alpha: (Double, Double) = (1.0, 0.0)
    var beta: (Double, Double) = (0.0, 0.0)
    
    a.withUnsafeBufferPointer { aPtr in
        b.withUnsafeBufferPointer { bPtr in
            result.withUnsafeMutableBufferPointer { resultPtr in
                withUnsafePointer(to: &alpha) { alphaPtr in
                    withUnsafePointer(to: &beta) { betaPtr in
                        cblas_zgemm(
                            CblasColMajor,                        // ORDER: Row-major storage
                            CblasNoTrans,                         // TRANSA: Don't transpose A
                            CblasNoTrans,                         // TRANSB: Don't transpose B
                            m,                                    // M: Rows of A and C
                            n,                                    // N: Columns of B and C
                            k,                                    // K: Columns of A, rows of B
                            OpaquePointer(alphaPtr),              // ALPHA: Scaling factor for A*B
                            OpaquePointer(aPtr.baseAddress),      // A: Matrix A
                            k,                                    // LDA: Leading dimension of A
                            OpaquePointer(bPtr.baseAddress),      // B: Matrix B
                            n,                                    // LDB: Leading dimension of B
                            OpaquePointer(betaPtr),               // BETA: Scaling factor for C
                            OpaquePointer(resultPtr.baseAddress), // C: Result matrix C
                            n                                     // LDC: Leading dimension of C
                        )
                    }
                }
            }
        }
    }
    
    return result
}

func matrixVectorMultiply(_ matrix: [Complex], _ vector: [Complex], m: Int, n: Int) -> [Complex] {
    // Matrix-vector multiplication: y = A * x
    // Where A is m×n matrix, x is n-length vector, result y is m-length vector
    
    guard matrix.count == m * n else {
        fatalError("Matrix dimensions don't match: expected \(m * n), got \(matrix.count)")
    }
    
    guard vector.count == n else {
        fatalError("Vector dimension doesn't match matrix columns: expected \(n), got \(vector.count)")
    }
    
    var result = [Complex](repeating: Complex(0, 0), count: m)
    
    // Alpha = 1+0i, Beta = 0+0i
    var alpha: (Double, Double) = (1.0, 0.0)
    var beta: (Double, Double) = (0.0, 0.0)
    
    matrix.withUnsafeBufferPointer { matrixPtr in
        vector.withUnsafeBufferPointer { vectorPtr in
            result.withUnsafeMutableBufferPointer { resultPtr in
                withUnsafePointer(to: &alpha) { alphaPtr in
                    withUnsafePointer(to: &beta) { betaPtr in
                        cblas_zgemv(
                            CblasColMajor,                        // ORDER: Row-major storage
                            CblasNoTrans,                         // TRANS: No transpose of matrix
                            m,                                    // M: Number of rows of matrix
                            n,                                    // N: Number of columns of matrix
                            OpaquePointer(alphaPtr),              // ALPHA: Scaling factor
                            OpaquePointer(matrixPtr.baseAddress), // A: Input matrix
                            n,                                    // LDA: Leading dimension of A
                            OpaquePointer(vectorPtr.baseAddress), // X: Input vector
                            1,                                    // INCX: Stride of vector x
                            OpaquePointer(betaPtr),               // BETA: Scaling factor for y
                            OpaquePointer(resultPtr.baseAddress), // Y: Result vector
                            1                                     // INCY: Stride of result vector
                        )
                    }
                }
            }
        }
    }
    
    return result
}
