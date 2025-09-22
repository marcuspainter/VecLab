//
//  ComplexMatrix+Math.swift
//  VecLab
//
//  Created by Marcus Painter on 09/09/2025.
//

extension ComplexMatrix {

    public static func + (_ a: ComplexMatrix, _ b: ComplexMatrix) -> ComplexMatrix {
        return CoreComplexMatrix.add(a, b)
    }

    public static func - (_ a: ComplexMatrix, _ b: ComplexMatrix) -> ComplexMatrix {
        return CoreComplexMatrix.subtract(a, b)
    }

    public static func * (_ a: ComplexMatrix, _ b: ComplexMatrix) -> ComplexMatrix {
        validateCompatible(a, b)
        return CoreComplexMatrix.multiply(a, b)
    }

    // Element-wise
    public static func .* (_ a: ComplexMatrix, _ b: ComplexMatrix) -> ComplexMatrix {
        return CoreComplexMatrix.elementMultiply(a, b)
    }

    @available(*, unavailable, message: "Matrix division is not supported. Use ./ for element-wise division.")
    public static func / (_ a: ComplexMatrix, _ b: ComplexMatrix) -> ComplexMatrix {
        return ComplexMatrix()
        // return CoreComplexMatrix.divide(a, b)
    }

    // Element-wise
    public static func ./ (_ a: ComplexMatrix, _ b: ComplexMatrix) -> ComplexMatrix {
        return CoreComplexMatrix.elementDivide(a, b)
    }

}
