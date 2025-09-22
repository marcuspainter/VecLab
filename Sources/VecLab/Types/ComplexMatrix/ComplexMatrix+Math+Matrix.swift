//
//  ComplexMatrix+Matrix.swift
//  VecLab
//
//  Created by Marcus Painter on 09/09/2025.
//

extension ComplexMatrix {

    public static func + (_ a: ComplexMatrix, _ b: Matrix) -> ComplexMatrix {
        return a + ComplexMatrix(b)
    }

    public static func + (_ a: Matrix, _ b: ComplexMatrix) -> ComplexMatrix {
        return ComplexMatrix(a) + b
    }

    public static func - (_ a: ComplexMatrix, _ b: Matrix) -> ComplexMatrix {
        return a - ComplexMatrix(b)
    }

    public static func - (_ a: Matrix, _ b: ComplexMatrix) -> ComplexMatrix {
        return ComplexMatrix(a) - b
    }

    static func * (_ a: ComplexMatrix, _ b: Matrix) -> ComplexMatrix {
        return a * ComplexMatrix(b)
    }

    // Element-wise
    static func .* (_ a: ComplexMatrix, _ b: Matrix) -> ComplexMatrix {
        validateSize(a, b)
        let c = a.data * b.data
        return ComplexMatrix(like: a, data: c)
    }

    static func * (_ a: Matrix, _ b: ComplexMatrix) -> ComplexMatrix {
        return ComplexMatrix(a) * b
    }

    // Element-wise
    static func .* (_ a: Matrix, _ b: ComplexMatrix) -> ComplexMatrix {
        validateSize(a, b)
        let c = a.data * b.data
        return ComplexMatrix(like: b, data: c)
    }

    @available(*, unavailable, message: "Division by a matrix is not supported. Use ./ for element-wise division.")
    public static func / (_ a: ComplexMatrix, _ b: Matrix) -> ComplexMatrix {
        return ComplexMatrix()
    }

    // Element-wise
    public static func ./ (_ a: ComplexMatrix, _ b: Matrix) -> ComplexMatrix {
        let c = a.data / b.data
        return ComplexMatrix(like: a, data: c)
    }

    @available(*, unavailable, message: "Division by a matrix is not supported. Use ./ for element-wise division.")
    public static func / (_ a: Matrix, _ b: ComplexMatrix) -> ComplexMatrix {
        return ComplexMatrix()
    }

    // Element-wise
    public static func ./ (_ a: Matrix, _ b: ComplexMatrix) -> ComplexMatrix {
        let c = a.data / b.data
        return ComplexMatrix(like: b, data: c)
    }
}
