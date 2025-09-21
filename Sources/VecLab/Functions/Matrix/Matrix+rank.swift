//
//  Matrix+rank.swift
//  VecLab
//
//  Created by Marcus Painter on 17/09/2025.
//

public func rank(_ a: Matrix) -> Int {
    let (u, s, v) = svd(a: a.data, rows: a.rows, columns: a.cols)
    return s.count
}
