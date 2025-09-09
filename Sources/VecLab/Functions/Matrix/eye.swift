//
//  eye.swift
//  VecLab
//
//  Created by Marcus Painter on 09/09/2025.
//

public func eye(_ n: Int) -> Matrix {
    let grid = gridEye(n)
    return Matrix(grid, n, n)
}

func gridEye(_ n: Int) -> RealArray {
    var grid = RealArray(count: n * n)
    for row in 0..<n {
        grid[row * n + row]  = 1
    }
    return grid
}
