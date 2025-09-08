//
//  ComplexArray+Math+Complex.swift
//  VecLab
//
//  Created by Marcus Painter on 19/04/2025.
//

import Accelerate

/// Complex  extensions
extension ComplexArray {
    /// Complex addition.
    /// - Parameters:
    ///   - a: Complex array.
    ///   - b: Complex number.
    /// - Returns: The result of the addition.
    public static func + (a: ComplexArray, b: Complex) -> ComplexArray {
        validateSize(a)
        let real = vDSP.add(b.real, a.real)
        let imag = vDSP.add(b.imag, a.imag)

        return ComplexArray(real, imag)
    }

    /// Complex addition.
    /// - Parameters:
    ///   - a: Complex number.
    ///   - b: Complex array.
    /// - Returns: The result of the addition.
    public static func + (a: Complex, b: ComplexArray) -> ComplexArray {
        validateSize(b)
        let real = vDSP.add(a.real, b.real)
        let imag = vDSP.add(a.imag, b.imag)
        return ComplexArray(real, imag)
    }

    /// Complex subtraction.
    /// - Parameters:
    ///   - a: Complex array.
    ///   - b: Complex number.
    /// - Returns: The result of the ComplexArray, b: Double) -> ComplexArray {
    public static func - (a: ComplexArray, b: Complex) -> ComplexArray {
        validateSize(a)
        return ComplexArray(a.real - b.real, a.imag - b.imag)
    }

    /// Complex subtraction.
    /// - Parameters:
    ///   - a: Complex number.
    ///   - b: Complex array.
    /// - Returns: The result of the subtraction.
    public static func - (a: Complex, b: ComplexArray) -> ComplexArray {
        validateSize(b)
        return b - a
    }

    /// Complex multiplication.
    /// - Parameters:
    ///   - a: Complex array.
    ///   - b: Complex number.
    /// - Returns: The result of the multiplication.
    public static func * (a: ComplexArray, b: Complex) -> ComplexArray {
        validateSize(a)
        return vectorMultiplyComplexArrayComplex(a, b)
    }

    /// Complex multiplication.
    /// - Parameters:
    ///   - a: Complex number.
    ///   - b: Complex array.
    /// - Returns: The result of the multiplication.
    public static func * (a: Complex, b: ComplexArray) -> ComplexArray {
        validateSize(b)
        return vectorMultiplyComplexComplexArray(a, b)
    }

    /// Complex division.
    /// - Parameters:
    ///   - a: Complex array.
    ///   - b: Complex number.
    /// - Returns: The result of the division.
    public static func / (a: ComplexArray, b: Complex) -> ComplexArray {
        validateSize(a)
        return vectorDivideComplexArrayComplex(a, b)
    }

    /// Complex division.
    /// - Parameters:
    ///   - a: Complex number.
    ///   - b: Complex array.
    /// - Returns: The result of the division.
    public static func / (a: Complex, b: ComplexArray) -> ComplexArray {
        validateSize(b)
        return vectorDivideComplexComplexArray(a, b)
    }
}
