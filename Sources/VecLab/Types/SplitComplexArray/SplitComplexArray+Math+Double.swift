//
//  SplitComplexArray+Math+Double.swift
//  VecLab
//
//  Created by Marcus Painter on 19/04/2025.
//

import Accelerate

/// Double extensions
extension SplitComplexArray {
    /// Complex addition.
    /// - Parameters:
    ///   - a: Complex array.
    ///   - b: Real number.
    /// - Returns: The result of the addition.
    @inlinable
    public static func + (a: SplitComplexArray, b: Double) -> SplitComplexArray {
        validateSize(a)
        let real = vDSP.add(b, a.real)
        return SplitComplexArray(real, a.imag)
    }

    /// Complex addition.
    /// - Parameters:
    ///   - a: Real number.
    ///   - b: Complex array.
    /// - Returns: The result of the addition.
    public static func + (a: Double, b: SplitComplexArray) -> SplitComplexArray {
        validateSize(b)
        let real = vDSP.add(a, b.real)
        return SplitComplexArray(real, b.imag)
    }

    /// Complex subtraction.
    /// - Parameters:
    ///   - a: Complex array.
    ///   - b: Real number.
    /// - Returns: The result of the SplitComplexArray, b: Double) -> SplitComplexArray {
    public static func - (a: SplitComplexArray, b: Double) -> SplitComplexArray {
        validateSize(a)
        return SplitComplexArray(a.real - b, a.imag)
    }

    /// Complex subtraction.
    /// - Parameters:
    ///   - a: Real number.
    ///   - b: Complex array.
    /// - Returns: The result of the subtraction.
    public static func - (a: Double, b: SplitComplexArray) -> SplitComplexArray {
        validateSize(b)
        return SplitComplexArray(a - b.real, -b.imag)
    }

    /// Complex multiplication.
    /// - Parameters:
    ///   - a: Complex array.
    ///   - b: Real number.
    /// - Returns: The result of the multiplication.
    public static func * (a: SplitComplexArray, b: Double) -> SplitComplexArray {
        validateSize(a)
        let real = vDSP.multiply(b, a.real)
        let imag = vDSP.multiply(b, a.imag)
        return SplitComplexArray(real, imag)
    }

    /// Complex multiplication.
    /// - Parameters:
    ///   - a: Real number.
    ///   - b: Complex array.
    /// - Returns: The result of the multiplication.
    public static func * (a: Double, b: SplitComplexArray) -> SplitComplexArray {
        let real = vDSP.multiply(a, b.real)
        let imag = vDSP.multiply(a, b.imag)
        return SplitComplexArray(real, imag)
    }

    /// Complex division.
    /// - Parameters:
    ///   - a: Complex array.
    ///   - b: Real number.
    /// - Returns: The result of the division.
    public static func / (a: SplitComplexArray, b: Double) -> SplitComplexArray {
        validateSize(a)
        return vectorDivideSplitComplexArrayReal(a, b)
    }

    /// Complex division.
    /// - Parameters:
    ///   - a: Real number.
    ///   - b: Complex array.
    /// - Returns: The result of the division.
    public static func / (a: Double, b: SplitComplexArray) -> SplitComplexArray {
        validateSize(b)
        return vectorDivideRealSplitComplexArray(a, b)
    }
}
