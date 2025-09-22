//
//  Matrix+Math+Double.swift
//  VecLab
//
//  Created by Marcus Painter on 14/09/2025.
//

extension Matrix {

    public static func + (_ a: Matrix, _ b: Double) -> Matrix {
        return CoreMatrix.add(a, b)
    }

    public static func + (_ a: Double, _ b: Matrix) -> Matrix {
        return CoreMatrix.add(a, b)
    }

    public static func - (_ a: Matrix, _ b: Double) -> Matrix {
        return CoreMatrix.subtract(a, b)
    }

    public static func - (_ a: Double, _ b: Matrix) -> Matrix {
        return CoreMatrix.subtract(a, b)
    }

    public static func * (_ a: Matrix, _ b: Double) -> Matrix {
        return CoreMatrix.multiply(a, b)
    }

    public static func * (_ a: Double, _ b: Matrix) -> Matrix {
        return CoreMatrix.multiply(a, b)
    }

    public static func / (_ a: Matrix, _ b: Double) -> Matrix {
        return CoreMatrix.divide(a, b)
    }

    public static func / (_ a: Double, _ b: Matrix) -> Matrix {
        return CoreMatrix.divide(a, b)
    }
}
