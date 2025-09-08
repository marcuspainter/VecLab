//
//  Matrix+Unary.swift
//  VecLab
//
//  Created by Marcus Painter on 08/09/2025.
//

extension Matrix {
    
    static prefix func - (_ a: Matrix) -> Matrix {
        return Matrix(a, grid: -a.grid)
    }
}
