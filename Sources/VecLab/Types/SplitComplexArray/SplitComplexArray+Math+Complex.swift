//
//  SplitComplexArray+Math+Complex.swift
//  VecLab
//
//  Created by Marcus Painter on 19/04/2025.
//

import Accelerate

/// Complex  extensions
extension SplitComplexArray {
    /// Complex addition.
    /// - Parameters:
    ///   - a: Complex array.
    ///   - b: Complex number.
    /// - Returns: The result of the addition.
    public static func + (a: SplitComplexArray, b: Complex) -> SplitComplexArray {
        validateSize(a)
        let real = vDSP.add(b.real, a.real)
        let imag = vDSP.add(b.imag, a.imag)

        return SplitComplexArray(real, imag)
    }

    /// Complex addition.
    /// - Parameters:
    ///   - a: Complex number.
    ///   - b: Complex array.
    /// - Returns: The result of the addition.
    public static func + (a: Complex, b: SplitComplexArray) -> SplitComplexArray {
        validateSize(b)
        let real = vDSP.add(a.real, b.real)
        let imag = vDSP.add(a.imag, b.imag)
        return SplitComplexArray(real, imag)
    }

    /// Complex subtraction.
    /// - Parameters:
    ///   - a: Complex array.
    ///   - b: Complex number.
    /// - Returns: The result of the SplitComplexArray, b: Double) -> SplitComplexArray {
    public static func - (a: SplitComplexArray, b: Complex) -> SplitComplexArray {
        validateSize(a)
        return SplitComplexArray(a.real - b.real, a.imag - b.imag)
    }

    /// Complex subtraction.
    /// - Parameters:
    ///   - a: Complex number.
    ///   - b: Complex array.
    /// - Returns: The result of the subtraction.
    public static func - (a: Complex, b: SplitComplexArray) -> SplitComplexArray {
        validateSize(b)
        return b - a
    }

    /// Complex multiplication.
    /// - Parameters:
    ///   - a: Complex array.
    ///   - b: Complex number.
    /// - Returns: The result of the multiplication.
    public static func * (a: SplitComplexArray, b: Complex) -> SplitComplexArray {
        validateSize(a)
        return vectorMultiplySplitComplexArrayComplex(a, b)
    }

    /// Complex multiplication.
    /// - Parameters:
    ///   - a: Complex number.
    ///   - b: Complex array.
    /// - Returns: The result of the multiplication.
    public static func * (a: Complex, b: SplitComplexArray) -> SplitComplexArray {
        validateSize(b)
        return vectorMultiplyComplexSplitComplexArray(a, b)
    }

    /// Complex division.
    /// - Parameters:
    ///   - a: Complex array.
    ///   - b: Complex number.
    /// - Returns: The result of the division.
    public static func / (a: SplitComplexArray, b: Complex) -> SplitComplexArray {
        validateSize(a)
        return vectorDivideSplitComplexArrayComplex(a, b)
    }

    /// Complex division.
    /// - Parameters:
    ///   - a: Complex number.
    ///   - b: Complex array.
    /// - Returns: The result of the division.
    public static func / (a: Complex, b: SplitComplexArray) -> SplitComplexArray {
        validateSize(b)
        return vectorDivideComplexSplitComplexArray(a, b)
    }
}
