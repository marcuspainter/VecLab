//
//  Matrix_diag.swift
//  VecLab
//
//  Created by Marcus Painter on 14/09/2025.
//

/// Diagonal of matrix.
/// - Parameter a:Input matrix.
/// - Returns: The diagonal elements as a column vector.
public func diag(_ a: Matrix) -> Matrix {
    let n = min(a.rows, a.cols)
    var data = [Double](repeating: 0, count: n)

    // Column-major
    for i in 0..<n {
        data[i] = a.data[i * n + i]
    }

    return Matrix(rows: n, cols: 1, data: data)
}
