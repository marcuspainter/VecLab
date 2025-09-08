//
//  ComplexArray+Math+Array.swift
//  VecLab
//
//  Created by Marcus Painter on 19/04/2025.
//

import Accelerate

/// [Double] extensions
extension ComplexArray {
    /// Complex addition.
    /// - Parameters:
    ///   - a: Complex array.
    ///   - b: Real array.
    /// - Returns: The result of the addition.
    public static func + (a: ComplexArray, b: [Double]) -> ComplexArray {
        validateSize(a, b)
        let real = vDSP.add(a.real, b)
        return ComplexArray(real, a.imag)
    }

    /// Complex addition.
    /// - Parameters:
    ///   - a: Real array.
    ///   - b: Complex array.
    /// - Returns: The result of the addition.
    public static func + (a: [Double], b: ComplexArray) -> ComplexArray {
        validateSize(a, b)
        let real = vDSP.add(b.real, a)
        return ComplexArray(real, b.imag)
    }

    /// Complex subtraction.
    /// - Parameters:
    ///   - a: Complex array.
    ///   - b: Real array.
    /// - Returns: The result of the ComplexArray, b: Double) -> ComplexArray {
    public static func - (a: ComplexArray, b: [Double]) -> ComplexArray {
        validateSize(a, b)
        return ComplexArray(a.real - b, a.imag)
    }

    /// Complex subtraction.
    /// - Parameters:
    ///   - a: Real array.
    ///   - b: Complex array.
    /// - Returns: The result of the subtraction.
    public static func - (a: [Double], b: ComplexArray) -> ComplexArray {
        validateSize(a, b)
        return b - a
    }

    /// Complex multiplication.
    /// - Parameters:
    ///   - a: Complex array.
    ///   - b: Real array.
    /// - Returns: The result of the multiplication.
    public static func * (a: ComplexArray, b: [Double]) -> ComplexArray {
        validateSize(a, b)
        return vectorMultiplyComplexArrayRealArray(a, b)
    }

    /// Complex multiplication.
    /// - Parameters:
    ///   - a: Real array.
    ///   - b: Complex array.
    /// - Returns: The result of the multiplication.
    public static func * (a: [Double], b: ComplexArray) -> ComplexArray {
        validateSize(a, b)
        return vectorMultiplyComplexArrayRealArray(b, a)
    }

    /// Complex division.
    /// - Parameters:
    ///   - a: Complex array.
    ///   - b: Real array.
    /// - Returns: The result of the division.
    public static func / (a: ComplexArray, b: [Double]) -> ComplexArray {
        validateSize(a, b)
        return vectorDivideComplexArrayRealArray(a, b)
    }

    /// Complex division.
    /// - Parameters:
    ///   - a: Real array.
    ///   - b: Complex array.
    /// - Returns: The result of the division.
    public static func / (a: [Double], b: ComplexArray) -> ComplexArray {
        validateSize(a, b)
        return vectorDivideRealArrayComplexArray(a, b)
    }
}
