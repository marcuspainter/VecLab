//
//  Matrix+zeros.swift
//  VecLab
//
//  Created by Marcus Painter on 09/09/2025.
//

public func zeros(_ rows: Int, _ cols: Int) -> Matrix {
    return Matrix(rows, cols)
}

public func ones(_ rows: Int, _ cols: Int) -> Matrix {
    let data = [Double](repeating: 1.0, count: rows * cols)
    return Matrix(data, rows, cols)
}

public func rand(_ rows: Int, _ cols: Int) -> Matrix {
    let data = rand(count: cols * rows)
    return Matrix(data, rows, cols)
}

public func randn(_ rows: Int, _ cols: Int) -> Matrix {
    let data = randn(count: cols * rows)
    return Matrix(data, rows, cols)
}
