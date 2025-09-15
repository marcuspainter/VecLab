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

public func rand(_ rows: Int, _ cols: Int) -> Matrix
{
    let grid = rand(count: cols * rows)
    return Matrix(grid, rows, cols)
}

public func randn(_ rows: Int, _ cols: Int) -> Matrix
{
    let grid = randn(count: cols * rows)
    return Matrix(grid, rows, cols)
}

enum xxx {
    public static func zzz(_ a: some Numeric) -> some Numeric {
        let b = a + 1
        return b
    }
}

func qqq() {
    
    let a = Complex(1,2)
    let c = xxx.zzz(a)
}
