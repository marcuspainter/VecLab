//
//  Matrix+Math+Add.swift
//  VecLab
//
//  Created by Marcus Painter on 07/09/2025.
//

extension Matrix {

    public static func + (_ a: Matrix, _ b: Matrix) -> Matrix {
        validateSize(a, b)
        let c = a.grid + b.grid
        return Matrix(a, grid: c)
    }

    public static func + (_ a: Matrix, _ b: Double) -> Matrix {
        let c = a.grid + b
        return Matrix(a, grid: c)
    }

    public static func + (_ a: Double, _ b: Matrix) -> Matrix {
        let c = a + b.grid
        return Matrix(b, grid: c)
    }
}
