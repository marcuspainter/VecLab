//
//  Matrix+Math+Power.swift
//  VecLab
//
//  Created by Marcus Painter on 08/09/2025.
//

extension Matrix {

    // Element-wise
    public static func .** (_ a: Matrix, _ b: Matrix) -> Matrix {
        validateSize(a, b)
        let c = a.data ** b.data
        return Matrix(like: a, data: c)
    }

    // Element-wise
    public static func .** (_ a: Matrix, _ b: Double) -> Matrix {
        let c = a.data ** b
        return Matrix(like: a, data: c)
    }

    // Element-wise
    public static func .** (_ a: Double, _ b: Matrix) -> Matrix {
        let c = a ** b.data
        return Matrix(like: b, data: c)
    }

    // MARK: Not implemented

    @available(
        *,
        unavailable,
        renamed: ".**",
        message: "Matrices cannot be raised to the power of a matrix. Did you mean .**"
    )
    public static func ** (_ a: Matrix, _ b: Matrix) -> Matrix {
        return Matrix()
    }

    @available(*, unavailable, message: "Double cannot be raised to the power of a matrix")
    public static func ** (_ a: Double, _ b: Matrix) -> Matrix {
        return Matrix()
    }

}
