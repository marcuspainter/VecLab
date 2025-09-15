//
//  Matrix+Math.swift
//  VecLab
//
//  Created by Marcus Painter on 14/09/2025.
//

import Accelerate

extension Matrix {

    public static func + (_ a: Matrix, _ b: Matrix) -> Matrix {
        validateSize(a, b)
        let c = a.grid + b.grid
        return Matrix(a, grid: c)
    }

    public static func - (_ a: Matrix, _ b: Matrix) -> Matrix {
        validateSize(a, b)
        let c = a.grid - b.grid
        return Matrix(a, grid: c)
    }

    public static func * (_ a: Matrix, _ b: Matrix) -> Matrix {
        validateCompatible(a, b)
        let c = matrixMultiply(a.grid, b.grid, m: a.rows, k: a.cols, n: b.rows)
        return Matrix(rows: a.rows, cols: b.cols, grid: c)
    }

    public static func .* (_ a: Matrix, _ b: Matrix) -> Matrix {
        validateSize(a, b)
        let c = a.grid * b.grid
        return Matrix(a, grid: c)
    }

    @available(*, unavailable, message: "Use ./")
    public static func / (_ a: Matrix, _ b: Matrix) -> Matrix {
        return Matrix()
    }

    // Element-wise
    public static func ./ (_ a: Matrix, _ b: Matrix) -> Matrix {
        validateSize(a, b)
        let c = a.grid / b.grid
        return Matrix(a, grid: c)
    }

}

func matrixDivide(_ a: [Double], _ b: [Double], m: Int, k: Int, n: Int) -> [Double] {
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
