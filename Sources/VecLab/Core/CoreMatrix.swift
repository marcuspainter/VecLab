//
//  CoreMatrix.swift
//  VecLab
//
//  Created by Marcus Painter on 17/09/2025.
//

import Accelerate

enum CoreMatrix {
    
    // MARK: add
    
    static func add(_ a: Matrix, _ b: Matrix) -> Matrix {
        return Matrix(like: a, data: CoreVector.add(a.data, b.data))
    }
    
    static func add(_ a: Matrix, _ b: Double) -> Matrix {
        return Matrix(like: a, data: CoreVector.add(a.data, b))
    }
    
    static func add(_ a: Double, _ b: Matrix) -> Matrix {
        return Matrix(like: b, data: CoreVector.add(a, b.data))
    }
    
    // MARK: subtract
    
    static func subtract(_ a: Matrix, _ b: Matrix) -> Matrix {
        return Matrix(like: a,  data: CoreVector.subtract(a.data, b.data))
    }
    
    static func subtract(_ a: Matrix, _ b: Double) -> Matrix {
        return Matrix(like: a, data: CoreVector.subtract(a.data, b))
    }
    
    static func subtract(_ a: Double, _ b: Matrix) -> Matrix {
        return Matrix(like: b, data: CoreVector.subtract(a, b.data))
    }
    
    // MARK: multiply
    
    static func multiplySwift(_ a: Matrix, _ b: Matrix) -> Matrix {
        var c = Matrix(a.rows, b.cols)
        // Matrix multiplication: C = A * B
        // Assumes column-major storage for `data` arrays.
        // A: (m x k), B: (k x n), C: (m x n)
        let m = a.rows
        let k = a.cols
        let n = b.cols
        
        // Optional: you may want to assert dimensions in debug builds
        assert(a.cols == b.rows, "Incompatible dimensions for matrix multiplication")
        assert(c.rows == m && c.cols == n, "Output matrix has incorrect dimensions")
        
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
    
    static func multiply(_ a: Matrix, _ b: Matrix) -> Matrix {
        let data = matrixMultiply(a.data, b.data, m: a.rows, k: a.cols, n: b.cols)
        return Matrix(rows: a.rows, cols: b.cols, data: data)
    }
    
    static func multiply(_ a: Matrix, _ b: Double) -> Matrix {
        return Matrix(rows: a.rows, cols: a.cols, data: CoreVector.multiply(a.data, b))
    }
    
    static func elementMultiply(_ a: Matrix, _ b: Matrix) -> Matrix {
        return Matrix(rows: a.rows, cols: a.cols, data: CoreVector.multiply(a.data, b.data))
    }
    
    // MARK: divide
    
    static func divide(_ a: Matrix, _ b: Double) -> Matrix {
        return Matrix(rows: a.rows, cols: a.cols, data: CoreVector.divide(a.data, b))
    }
    
    static func divide(_ a: Double, _ b: Matrix) -> Matrix {
        return Matrix(rows: b.rows, cols: b.cols, data: CoreVector.divide(a, b.data))
    }
    
    static func elementDivide(_ a: Matrix, _ b: Matrix) -> Matrix {
        return Matrix(rows: b.rows, cols: b.cols, data: CoreVector.divide(a.data, b.data))
    }
    
    static func unaryMinus(_ a: Matrix) -> Matrix  {
        return Matrix(rows: a.rows, cols: a.cols, data: CoreVector.unaryMinus(a.data))
    }
    
    fileprivate static func matrixMultiply(_ a: [Double], _ b: [Double], m: Int, k: Int, n: Int) -> [Double] {
        let l = m * k
        let data = [Double](unsafeUninitializedCapacity: l) { result, initializedCount in
            
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
        }
        return data
    }
    
}
