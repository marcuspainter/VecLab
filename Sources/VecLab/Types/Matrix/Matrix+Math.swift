//
//  Matrix+Math.swift
//  VecLab
//
//  Created by Marcus Painter on 14/09/2025.
//

import Accelerate

extension Matrix {

    public static func + (_ a: Matrix, _ b: Matrix) -> Matrix {
        validateSize(a, b)
        return CoreMatrix.add(a, b)
    }

    public static func - (_ a: Matrix, _ b: Matrix) -> Matrix {
        validateSize(a, b)
        return CoreMatrix.subtract(a, b)
    }

    public static func * (_ a: Matrix, _ b: Matrix) -> Matrix {
        validateCompatible(a, b)
        return CoreMatrix.multiply(a, b)
    }

    public static func .* (_ a: Matrix, _ b: Matrix) -> Matrix {
        validateSize(a, b)
        return CoreMatrix.elementMultiply(a, b)
    }

    @available(*, unavailable, message: "Use ./")
    public static func / (_ a: Matrix, _ b: Matrix) -> Matrix {
        return Matrix()
    }

    // Element-wise
    public static func ./ (_ a: Matrix, _ b: Matrix) -> Matrix {
        return CoreMatrix.elementDivide(a, b)
    }

}
