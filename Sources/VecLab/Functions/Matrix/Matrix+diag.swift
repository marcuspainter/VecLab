//
//  Matrix+diag.swift
//  VecLab
//
//  Created by Marcus Painter on 21/09/2025.
//

public func diag(_ a: Matrix) -> Matrix {
    precondition(a.rows == a.cols, "Matrix must be square")
    let n = min(a.rows, a.cols)
    var d = [Double](repeating: 0.0, count: n)
    for i in 0..<n {
        d[i] = a[i, i]
    }
    return Matrix(rows: n, cols: 1, data: d)
}
