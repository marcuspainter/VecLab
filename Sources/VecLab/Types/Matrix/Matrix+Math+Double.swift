//
//  Matrix+Math+Double.swift
//  VecLab
//
//  Created by Marcus Painter on 14/09/2025.
//

extension Matrix {

    public static func + (_ a: Matrix, _ b: Double) -> Matrix {
        let c = a.grid + b
        return Matrix(a, grid: c)
    }

    public static func + (_ a: Double, _ b: Matrix) -> Matrix {
        let c = a + b.grid
        return Matrix(b, grid: c)
    }

    public static func - (_ a: Matrix, _ b: Double) -> Matrix {
        let c = a.grid - b
        return Matrix(a, grid: c)
    }

    public static func - (_ a: Double, _ b: Matrix) -> Matrix {
        let c = a - b.grid
        return Matrix(b, grid: c)
    }

    public static func * (_ a: Matrix, _ b: Double) -> Matrix {
        let c = a.grid * b
        return Matrix(a, grid: c)
    }

    public static func * (_ a: Double, _ b: Matrix) -> Matrix {
        let c = a * b.grid
        return Matrix(b, grid: c)
    }

    public static func / (_ a: Matrix, _ b: Double) -> Matrix {
        let c = a.grid / b
        return Matrix(a, grid: c)
    }

    public static func / (_ a: Double, _ b: Matrix) -> Matrix {
        let c = a / b.grid
        return Matrix(b, grid: c)
    }

}
