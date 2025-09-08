//
//  MatrixComplex*Multiply.swift
//  VecLab
//
//  Created by Marcus Painter on 08/09/2025.
//

import Accelerate

extension MatrixComplex {
    
    static func * (_ a: MatrixComplex, _ b: MatrixComplex) -> MatrixComplex {
        let c = matrixMultiply(a.grid, b.grid, m: a.rows, k: a.cols, n: b.rows)
        return MatrixComplex(c, rows: a.rows, cols: b.cols)
    }
    
    // Element-wise
    static func .* (_ a: MatrixComplex, _ b: MatrixComplex) -> MatrixComplex {
        let c = a.grid * b.grid
        return MatrixComplex(a, grid: c)
    }
    
    static func * (_ a: MatrixComplex, _ b: Double) -> MatrixComplex {
        let c = a.grid * b
        return MatrixComplex(a, grid: c)
    }
    
    static func * (_ a: Double, _ b: MatrixComplex) -> MatrixComplex {
        let c = a * b.grid
        return MatrixComplex(b, grid: c)
    }
    
    static func * (_ a: MatrixComplex, _ b: Matrix) -> MatrixComplex {
        return a * MatrixComplex(b)
    }
    
    // Element-wise
    static func .* (_ a: MatrixComplex, _ b: Matrix) -> MatrixComplex {
        let c = a.grid * b.grid
        return MatrixComplex(a, grid: c)
    }
    
    static func * (_ a: Matrix, _ b: MatrixComplex) -> MatrixComplex {
        return MatrixComplex(a) * b
    }
    
    // Element-wise
    static func .* (_ a: Matrix, _ b: MatrixComplex) -> MatrixComplex {
        let c = a.grid * b.grid
        return MatrixComplex(b, grid: c)
    }
    
    static func * (_ a: MatrixComplex, _ b: ComplexDouble) -> MatrixComplex {
        let c = a.grid * b
        return MatrixComplex(a, grid: c)
    }
    
    static func * (_ a: ComplexDouble, _ b: MatrixComplex) -> MatrixComplex {
        let c = a * b.grid
        return MatrixComplex(b, grid: c)
    }
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
                            CblasRowMajor,                        // ORDER: Row-major storage
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
                            CblasRowMajor,                        // ORDER: Row-major storage
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
