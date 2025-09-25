//
//  Matrix+svd.swift
//  VecLab
//
//  Created by Marcus Painter on 25/09/2025.
//

/// SVD of matrix.
/// - Parameter a: Matrix.<#a description#>
/// - Returns: <#description#>
public func svd(_ a: Matrix) -> (u: Matrix, s: Matrix, vt: Matrix) {
    
    let (u, s, vt) = MatrixOp.svd(a: a.data, rows: a.rows, columns: a.cols)
    
    let m = a.rows
    let n = a.cols
    let U = Matrix(rows: m, cols: m, data: u)
    let S = Matrix(rows: n, cols: 1, data: s)
    let VT = Matrix(rows: n, cols: n, data: vt)
    
    return (U, S, VT)
}
/*
 
 all
 vT
 none
 econ
 
 */
