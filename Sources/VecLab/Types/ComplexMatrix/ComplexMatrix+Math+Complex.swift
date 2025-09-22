//
//  MatricComplex+Math+Complex.swift
//  VecLab
//
//  Created by Marcus Painter on 09/09/2025.
//

extension ComplexMatrix {

    public static func + (_ a: ComplexMatrix, _ b: Complex) -> ComplexMatrix {
        return CoreComplexMatrix.add(a, b)
    }

    public static func + (_ a: Complex, _ b: ComplexMatrix) -> ComplexMatrix {
        return CoreComplexMatrix.add(a, b)
    }

    public static func - (_ a: ComplexMatrix, _ b: Complex) -> ComplexMatrix {
        return CoreComplexMatrix.subtract(a, b)
    }

    public static func - (_ a: Complex, _ b: ComplexMatrix) -> ComplexMatrix {
        return CoreComplexMatrix.subtract(a, b)
    }

    public static func * (_ a: ComplexMatrix, _ b: Complex) -> ComplexMatrix {
        return CoreComplexMatrix.multiply(a, b)
    }

    public static func * (_ a: Complex, _ b: ComplexMatrix) -> ComplexMatrix {
        return CoreComplexMatrix.multiply(a, b)
    }

    public static func / (_ a: ComplexMatrix, _ b: Complex) -> ComplexMatrix {
        return CoreComplexMatrix.divide(a, b)
    }

    public static func / (_ a: Complex, _ b: ComplexMatrix) -> ComplexMatrix {
        return CoreComplexMatrix.divide(a, b)
    }
}
