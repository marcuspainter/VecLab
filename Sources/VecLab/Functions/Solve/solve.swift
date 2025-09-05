//
//  solve.swift
//  VecLab
//
//  Created by Marcus Painter on 04/09/2025.
//

import Accelerate

/// Solve A * x = b  (MATLAB A \ b).
///
/// Uses DGESV to compute the solution to a real system of linear equations
/// A * X = B,
/// where A is an N-by-N matrix and X and B are N-by-NRHS matrices.
///
/// The LU decomposition with partial pivoting and row interchanges is
/// used to factor A as
/// A = P * L * U,
/// where P is a permutation matrix, L is unit lower triangular, and U is
/// upper triangular.  The factored form of A is then used to solve the
/// system of equations A * X = B.
///
/// - Parameters:
///   - A: Row-major array of matrix (rows × cols).
///   - B: Right-hand side matrix or vector (length = rows).
///   - n: Number of rows/columns (A must be square).
///   - nrhs: Number of columns of B (right hand side).
/// - Returns: Solution vector x
public func solve(_ A: RealArray, _ B: RealArray, n: Int, nrhs: Int) -> RealArray {
    // Infer dimensions
    //let n = Int(Double(A.count).squareRoot())
    //precondition(n * n == A.count, "A must be square")
    //precondition(B.count % n == 0, "B's row count must match A")
    //let nrhs = B.count / n
    
    precondition(A.count == n * n, "A must be n×n")
    precondition(B.count == n * nrhs, "B must be n×nrhs")

    var A_col = rowMajorToColMajorX(A, rows: n, cols: n)
    var B_col = rowMajorToColMajorX(B, rows: n, cols: nrhs)
    
    var N = n
    var NRHS = nrhs
    var LDA = n
    var IPIV = [Int](repeating: 0, count: n)
    var LDB = n
    var INFO = 0

    // Computes the solution to system of linear equations A * X = B for GE matrices
    dgesv_(&N, &NRHS, &A_col, &LDA, &IPIV, &B_col, &LDB, &INFO)

    guard INFO == 0 else {
        print("Solve failed, INFO = ", INFO)
        return []
    }

    // Convert solution back to row-major
    let X_row = colMajorToRowMajorX(B_col, rows: n, cols: nrhs)
    
    return X_row
}

fileprivate func rowMajorToColMajorX(_ input: [Double], rows: Int, cols: Int) -> [Double] {
    precondition(input.count == rows * cols, "Invalid dimensions")

    var output = Array(repeating: 0.0, count: input.count)

    for row in 0..<rows {
        for col in 0..<cols {
            let rowMajorIndex = row * cols + col
            let colMajorIndex = col * rows + row
            output[colMajorIndex] = input[rowMajorIndex]
        }
    }

    return output
}

// Row and columns are row-major dimensions
fileprivate func colMajorToRowMajorX(_ input: [Double], rows: Int, cols: Int) -> [Double] {
    precondition(input.count == rows * cols, "Invalid dimensions")

    var output = Array(repeating: 0.0, count: input.count)

    for row in 0..<rows {
        for col in 0..<cols {
            let rowMajorIndex = row * cols + col
            let colMajorIndex = col * rows + row
            output[rowMajorIndex] = input[colMajorIndex]
        }
    }

    return output
}
