//
//  Matrix*Multiply.swift
//  VecLab
//
//  Created by Marcus Painter on 07/09/2025.
//

import Foundation
import Accelerate

extension Matrix {
    
    static func * (_ a: Matrix, _ b: Matrix) -> Matrix {
        validateCompatible(a, b)
        let c = matrixMultiply(a.grid, b.grid, m: a.rows, k: a.cols, n: b.rows)
        return Matrix(c, rows: a.rows, cols: b.cols)
    }
    
    static func .* (_ a: Matrix, _ b: Matrix) -> Matrix {
        validateSize(a, b)
        let c = a.grid * b.grid
        return Matrix(a, grid: c)
    }
    
    static func * (_ a: Matrix, _ b: Double) -> Matrix {
        let c = a.grid * b
        return Matrix(a, grid: c)
    }
    
    static func * (_ a: Double, _ b: Matrix) -> Matrix {
        let c = a * b.grid
        return Matrix(b, grid: c)
    }
    
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
                    CblasRowMajor,                        // ORDER: Row-major storage
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

import Accelerate

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
                    CblasRowMajor,                        // ORDER: Row-major storage
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

