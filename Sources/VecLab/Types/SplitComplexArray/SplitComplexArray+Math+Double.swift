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

// MARK: Private

private func vectorDivideSplitComplexArrayReal(_ a: SplitComplexArray, _ b: Real) -> SplitComplexArray {
    let real = vDSP.divide(a.real, b)
    let imag = vDSP.divide(a.imag, b)
    return SplitComplexArray(real, imag)
}

private func vectorDivideRealSplitComplexArray(_ a: Real, _ b: SplitComplexArray) -> SplitComplexArray {
    var c = b
    let a0 = [Double](repeating: a, count: b.count)
    let a1 = [Double](repeating: 0.0, count: b.count)
    let aa = SplitComplexArray(a0, a1)
    SplitComplexArray.withUnsafeParameters(aa, b, &c) { A, B, C, N in
        vDSP_zvdivD(B, 1, A, 1, C, 1, N)
    }
    return c
}
