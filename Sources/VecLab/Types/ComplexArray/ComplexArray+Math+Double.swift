//
//  ComplexArray+Math+Double.swift
//  VecLab
//
//  Created by Marcus Painter on 19/04/2025.
//

import Accelerate

/// Double extensions
extension ComplexArray {
    /// Complex addition.
    /// - Parameters:
    ///   - a: Complex array.
    ///   - b: Real number.
    /// - Returns: The result of the addition.
    @inlinable
    public static func + (a: ComplexArray, b: Double) -> ComplexArray {
        validateSize(a)
        let real = vDSP.add(b, a.real)
        return ComplexArray(real, a.imag)
    }

    /// Complex addition.
    /// - Parameters:
    ///   - a: Real number.
    ///   - b: Complex array.
    /// - Returns: The result of the addition.
    public static func + (a: Double, b: ComplexArray) -> ComplexArray {
        validateSize(b)
        let real = vDSP.add(a, b.real)
        return ComplexArray(real, b.imag)
    }

    /// Complex subtraction.
    /// - Parameters:
    ///   - a: Complex array.
    ///   - b: Real number.
    /// - Returns: The result of the ComplexArray, b: Double) -> ComplexArray {
    public static func - (a: ComplexArray, b: Double) -> ComplexArray {
        validateSize(a)
        return ComplexArray(a.real - b, a.imag)
    }

    /// Complex subtraction.
    /// - Parameters:
    ///   - a: Real number.
    ///   - b: Complex array.
    /// - Returns: The result of the subtraction.
    public static func - (a: Double, b: ComplexArray) -> ComplexArray {
        validateSize(b)
        return ComplexArray(a - b.real, -b.imag)
    }

    /// Complex multiplication.
    /// - Parameters:
    ///   - a: Complex array.
    ///   - b: Real number.
    /// - Returns: The result of the multiplication.
    public static func * (a: ComplexArray, b: Double) -> ComplexArray {
        validateSize(a)
        let real = vDSP.multiply(b, a.real)
        let imag = vDSP.multiply(b, a.imag)
        return ComplexArray(real, imag)
    }

    /// Complex multiplication.
    /// - Parameters:
    ///   - a: Real number.
    ///   - b: Complex array.
    /// - Returns: The result of the multiplication.
    public static func * (a: Double, b: ComplexArray) -> ComplexArray {
        let real = vDSP.multiply(a, b.real)
        let imag = vDSP.multiply(a, b.imag)
        return ComplexArray(real, imag)
    }

    /// Complex division.
    /// - Parameters:
    ///   - a: Complex array.
    ///   - b: Real number.
    /// - Returns: The result of the division.
    public static func / (a: ComplexArray, b: Double) -> ComplexArray {
        validateSize(a)
        return vectorDivideComplexArrayReal(a, b)
    }

    /// Complex division.
    /// - Parameters:
    ///   - a: Real number.
    ///   - b: Complex array.
    /// - Returns: The result of the division.
    public static func / (a: Double, b: ComplexArray) -> ComplexArray {
        validateSize(b)
        return vectorDivideRealComplexArray(a, b)
    }
}
