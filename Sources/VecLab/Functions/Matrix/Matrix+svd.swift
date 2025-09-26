//
//  Matrix+svd.swift
//  VecLab
//
//  Created by Marcus Painter on 25/09/2025.
//

/// SVD of matrix.
/// - Parameter a: Matrix.
/// - Returns: U, S, V.T as a tuple.
public func svd(_ a: Matrix) -> (u: Matrix, s: Matrix, vt: Matrix) {
    
    let (u, s, vt) = MatrixOp.svd(a: a.data, rows: a.rows, columns: a.cols)
    
    let m = a.rows
    let n = a.cols
    let U = Matrix(rows: m, cols: m, data: u)
    let S = Matrix(rows: s.count, cols: 1, data: s)
    let VT = Matrix(rows: n, cols: n, data: vt)
    
    return (U, S, VT)
}

