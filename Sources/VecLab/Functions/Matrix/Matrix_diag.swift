//
//  Matrix_diag.swift
//  VecLab
//
//  Created by Marcus Painter on 14/09/2025.
//

/// Diagonal of matrix.
/// - Parameter a: Input matrix.
/// - Returns: The diagonal elements as a column vector.
public func diag(_ a: Matrix) -> Matrix {
    let n = min(a.rows, a.cols)
    var d = Matrix(n, 1)
    
    for i in 0..<n {
        d[i] = a[i, i]
    }
    
    return d
}
