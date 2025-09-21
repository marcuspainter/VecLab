//
//  Matrix+Math+Double.swift
//  VecLab
//
//  Created by Marcus Painter on 14/09/2025.
//

extension Matrix {

    public static func + (_ a: Matrix, _ b: Double) -> Matrix {
        let c = a.data + b
        return Matrix(like: a, data: c)
    }

    public static func + (_ a: Double, _ b: Matrix) -> Matrix {
        let c = a + b.data
        return Matrix(like: b, data: c)
    }

    public static func - (_ a: Matrix, _ b: Double) -> Matrix {
        let c = a.data - b
        return Matrix(like: a, data: c)
    }

    public static func - (_ a: Double, _ b: Matrix) -> Matrix {
        let c = a - b.data
        return Matrix(like: b, data: c)
    }

    public static func * (_ a: Matrix, _ b: Double) -> Matrix {
        let c = a.data * b
        return Matrix(like: a, data: c)
    }

    public static func * (_ a: Double, _ b: Matrix) -> Matrix {
        let c = a * b.data
        return Matrix(like: b, data: c)
    }

    public static func / (_ a: Matrix, _ b: Double) -> Matrix {
        let c = a.data / b
        return Matrix(like: a, data: c)
    }

    public static func / (_ a: Double, _ b: Matrix) -> Matrix {
        let c = a / b.data
        return Matrix(like: b, data: c)
    }
}
