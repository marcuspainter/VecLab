//
//  zeros.swift
//  VecLab
//
//  Created by Marcus Painter on 09/09/2025.
//

public func zeros(_ rows: Int, _ cols: Int) -> Matrix
{
    return Matrix(rows, cols)
}

public func ones(_ rows: Int, _ cols: Int) -> Matrix
{
    let grid = [Double](repeating: 1.0, count: rows * cols)
    return Matrix(grid, rows, cols)
}
