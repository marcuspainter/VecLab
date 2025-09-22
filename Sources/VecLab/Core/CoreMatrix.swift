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
        return Matrix(like: a, data: CoreVector.add(a.data, b.data))
    }

    static func add(_ a: Matrix, _ b: Double) -> Matrix {
        return Matrix(like: a, data: CoreVector.add(a.data, b))
    }

    static func add(_ a: Double, _ b: Matrix) -> Matrix {
        return Matrix(like: b, data: CoreVector.add(a, b.data))
    }

    // MARK: Subtract

    static func subtract(_ a: Matrix, _ b: Matrix) -> Matrix {
        return Matrix(like: a, data: CoreVector.subtract(a.data, b.data))
    }

    static func subtract(_ a: Matrix, _ b: Double) -> Matrix {
        return Matrix(like: a, data: CoreVector.subtract(a.data, b))
    }

    static func subtract(_ a: Double, _ b: Matrix) -> Matrix {
        return Matrix(like: b, data: CoreVector.subtract(a, b.data))
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
        return Matrix(like: a, data: CoreVector.multiply(a.data, b))
    }

    static func multiply(_ a: Double, _ b: Matrix) -> Matrix {
        return Matrix(like: b, data: CoreVector.multiply(a, b.data))
    }

    static func elementMultiply(_ a: Matrix, _ b: Matrix) -> Matrix {
        return Matrix(like: a, data: CoreVector.multiply(a.data, b.data))
    }

    // MARK: Divide

    static func divide(_ a: Matrix, _ b: Double) -> Matrix {
        return Matrix(like: a, data: CoreVector.divide(a.data, b))
    }

    static func divide(_ a: Double, _ b: Matrix) -> Matrix {
        return Matrix(like: b, data: CoreVector.divide(a, b.data))
    }

    static func elementDivide(_ a: Matrix, _ b: Matrix) -> Matrix {
        return Matrix(like: a, data: CoreVector.divide(a.data, b.data))
    }

    // MARK: Unary

    static func unaryMinus(_ a: Matrix) -> Matrix {
        return Matrix(like: a, data: CoreVector.unaryMinus(a.data))
    }

    static func transpose(_ a: Matrix) -> Matrix {
        let data = MatrixOp.matrixTranspose(a.data, rows: a.rows, columns: a.cols)
        // Swap
        return Matrix(rows: a.cols, cols: a.rows, data: data)
    }

}

private func matrixDivide(_ a: [Double], _ b: [Double], m: Int, k: Int, n: Int) -> [Double] {
    // This computes A / B as A * B^(-1) by solving B * X = A for X
    // Where A is m×k, B is k×k (must be square), result X is m×k

    var result = a  // Copy A as initial value
    var bCopy = b  // Copy B since LAPACK will modify it
    var ipiv = [Int](repeating: 0, count: k)  // Pivot indices
    var info: Int = 0
    var kk = k

    result.withUnsafeMutableBufferPointer { resultPtr in
        bCopy.withUnsafeMutableBufferPointer { bPtr in
            ipiv.withUnsafeMutableBufferPointer { ipivPtr in
                // Step 1: Factor B using LU decomposition
                dgetrf_(
                    &kk,  // M: Number of rows of B
                    &kk,  // N: Number of columns of B
                    bPtr.baseAddress,  // A: Matrix B (will be overwritten with LU)
                    &kk,  // LDA: Leading dimension of B
                    ipivPtr.baseAddress,  // IPIV: Pivot indices
                    &info
                )  // INFO: Success/error code

                guard info == 0 else {
                    fatalError("Matrix factorization failed with info = \(info)")
                }

                // Step 2: Solve B * X = A using the LU factorization
                dgetrs_(
                    "N",  // TRANS: 'N' for no transpose
                    &kk,  // N: Order of matrix B
                    &kk,  // NRHS: Number of right-hand sides (columns of A)
                    bPtr.baseAddress,  // A: LU factorization of B
                    &kk,  // LDA: Leading dimension of B
                    ipivPtr.baseAddress,  // IPIV: Pivot indices from factorization
                    resultPtr.baseAddress,  // B: Right-hand side A, overwritten with solution X
                    &kk,  // LDB: Leading dimension of result
                    &info
                )  // INFO: Success/error code

                guard info == 0 else {
                    fatalError("Matrix solve failed with info = \(info)")
                }
            }
        }
    }

    return result
}
