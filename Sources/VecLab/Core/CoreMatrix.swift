//
//  CoreMatrix.swift
//  VecLab
//
//  Created by Marcus Painter on 17/09/2025.
//

import Accelerate

enum CoreMatrix {

    // MARK: Add

    static func add(_ a: Matrix, _ b: Matrix) -> Matrix {
        return Matrix(like: a, data: CoreArray.add(a.data, b.data))
    }

    static func add(_ a: Matrix, _ b: Double) -> Matrix {
        return Matrix(like: a, data: CoreArray.add(a.data, b))
    }

    static func add(_ a: Double, _ b: Matrix) -> Matrix {
        return Matrix(like: b, data: CoreArray.add(a, b.data))
    }

    // MARK: Subtract

    static func subtract(_ a: Matrix, _ b: Matrix) -> Matrix {
        return Matrix(like: a, data: CoreArray.subtract(a.data, b.data))
    }

    static func subtract(_ a: Matrix, _ b: Double) -> Matrix {
        return Matrix(like: a, data: CoreArray.subtract(a.data, b))
    }

    static func subtract(_ a: Double, _ b: Matrix) -> Matrix {
        return Matrix(like: b, data: CoreArray.subtract(a, b.data))
    }

    // MARK: Multiply

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
        // for idx in 0..<c.data.count {
        //    c[idx] = 0.0
        // }

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
        let data = MatrixOp.matrixMultiply(a.data, b.data, m: a.rows, k: a.cols, n: b.cols)
        return Matrix(rows: a.rows, cols: b.cols, data: data)
    }

    static func multiply(_ a: Matrix, _ b: Double) -> Matrix {
        return Matrix(like: a, data: CoreArray.multiply(a.data, b))
    }

    static func multiply(_ a: Double, _ b: Matrix) -> Matrix {
        return Matrix(like: b, data: CoreArray.multiply(a, b.data))
    }

    static func elementMultiply(_ a: Matrix, _ b: Matrix) -> Matrix {
        return Matrix(like: a, data: CoreArray.multiply(a.data, b.data))
    }

    // MARK: Divide

    static func divide(_ a: Matrix, _ b: Double) -> Matrix {
        return Matrix(like: a, data: CoreArray.divide(a.data, b))
    }

    static func divide(_ a: Double, _ b: Matrix) -> Matrix {
        return Matrix(like: b, data: CoreArray.divide(a, b.data))
    }

    static func elementDivide(_ a: Matrix, _ b: Matrix) -> Matrix {
        return Matrix(like: a, data: CoreArray.divide(a.data, b.data))
    }

    // MARK: Unary

    static func unaryMinus(_ a: Matrix) -> Matrix {
        return Matrix(like: a, data: CoreArray.unaryMinus(a.data))
    }

    static func transpose(_ a: Matrix) -> Matrix {
        let data = MatrixOp.matrixTranspose(a.data, rows: a.rows, columns: a.cols)
        // Swap
        return Matrix(rows: a.cols, cols: a.rows, data: data)
    }

}

