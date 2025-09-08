//
//  Matrix+Divide.swift
//  VecLab
//
//  Created by Marcus Painter on 08/09/2025.
//

import Accelerate

extension Matrix {
    
    @available(*, unavailable, message: "Use ./")
    static func / (_ a: Matrix, _ b: Matrix) -> Matrix {
        return Matrix()
    }
    
    // Element-wise
    static func ./ (_ a: Matrix, _ b: Matrix) -> Matrix {
        let c = a.grid / b.grid
        return Matrix(a, grid: c)
    }
    
    static func / (_ a: Matrix, _ b: Double) -> Matrix {
        let c = a.grid / b
        return Matrix(a, grid: c)
    }
    
    static func / (_ a: Double, _ b: Matrix) -> Matrix {
        let c = a / b.grid
        return Matrix(b, grid: c)
    }
    
}

func matrixDivide(_ a: [Double], _ b: [Double], m: Int, k: Int, n: Int) -> [Double] {
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
                dgetrf_(&kk,                               // M: Number of rows of B
                       &kk,                               // N: Number of columns of B
                       bPtr.baseAddress,                // A: Matrix B (will be overwritten with LU)
                       &kk,                               // LDA: Leading dimension of B
                       ipivPtr.baseAddress,             // IPIV: Pivot indices
                       &info)                           // INFO: Success/error code
                
                guard info == 0 else {
                    fatalError("Matrix factorization failed with info = \(info)")
                }
                
                // Step 2: Solve B * X = A using the LU factorization
                dgetrs_("N",                            // TRANS: 'N' for no transpose
                       &kk,                             // N: Order of matrix B
                       &kk,                             // NRHS: Number of right-hand sides (columns of A)
                       bPtr.baseAddress,                // A: LU factorization of B
                       &kk,                             // LDA: Leading dimension of B
                       ipivPtr.baseAddress,             // IPIV: Pivot indices from factorization
                       resultPtr.baseAddress,           // B: Right-hand side A, overwritten with solution X
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

public func rightDivision(_ A: RealArray, _ B: RealArray, m: Int, n: Int) -> RealArray {
    // A/B: solve X*B = A
    // Equivalent to: B^T * X^T = A^T
    
    precondition(A.count == m * n, "A must be m×n")
    precondition(B.count == n * n, "B must be n×n (square)")
    
    // Transpose A and B
    let AT = transposeMatrix(A, rows: m, cols: n)  // n×m
    let BT = transposeMatrix(B, rows: n, cols: n)  // n×n
    
    // Solve B^T * X^T = A^T
    let XT = solve(BT, AT, n: n, nrhs: m)
    
    // Transpose result back
    return transposeMatrix(XT, rows: n, cols: m)  // m×n
}

public func transposeMatrix(_ matrix: RealArray, rows: Int, cols: Int) -> RealArray {
    var result = RealArray(repeating: 0.0, count: rows * cols)
    
    for i in 0..<rows {
        for j in 0..<cols {
            result[i * cols + j] = matrix[j * rows + i]  // Row-major indexing
        }
    }
    
    return result
}
