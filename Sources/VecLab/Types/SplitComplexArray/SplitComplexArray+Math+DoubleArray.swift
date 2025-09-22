//
//  SplitComplexArray+Math+Array.swift
//  VecLab
//
//  Created by Marcus Painter on 19/04/2025.
//

import Accelerate

/// [Double] extensions
extension SplitComplexArray {
    /// Complex addition.
    /// - Parameters:
    ///   - a: Complex array.
    ///   - b: Real array.
    /// - Returns: The result of the addition.
    public static func + (a: SplitComplexArray, b: [Double]) -> SplitComplexArray {
        validateSize(a, b)
        let real = vDSP.add(a.real, b)
        return SplitComplexArray(real, a.imag)
    }

    /// Complex addition.
    /// - Parameters:
    ///   - a: Real array.
    ///   - b: Complex array.
    /// - Returns: The result of the addition.
    public static func + (a: [Double], b: SplitComplexArray) -> SplitComplexArray {
        validateSize(a, b)
        let real = vDSP.add(b.real, a)
        return SplitComplexArray(real, b.imag)
    }

    /// Complex subtraction.
    /// - Parameters:
    ///   - a: Complex array.
    ///   - b: Real array.
    /// - Returns: The result of the SplitComplexArray, b: Double) -> SplitComplexArray {
    public static func - (a: SplitComplexArray, b: [Double]) -> SplitComplexArray {
        validateSize(a, b)
        return SplitComplexArray(a.real - b, a.imag)
    }

    /// Complex subtraction.
    /// - Parameters:
    ///   - a: Real array.
    ///   - b: Complex array.
    /// - Returns: The result of the subtraction.
    public static func - (a: [Double], b: SplitComplexArray) -> SplitComplexArray {
        validateSize(a, b)
        return b - a
    }

    /// Complex multiplication.
    /// - Parameters:
    ///   - a: Complex array.
    ///   - b: Real array.
    /// - Returns: The result of the multiplication.
    public static func * (a: SplitComplexArray, b: [Double]) -> SplitComplexArray {
        validateSize(a, b)
        return vectorMultiplySplitComplexArrayRealArray(a, b)
    }

    /// Complex multiplication.
    /// - Parameters:
    ///   - a: Real array.
    ///   - b: Complex array.
    /// - Returns: The result of the multiplication.
    public static func * (a: [Double], b: SplitComplexArray) -> SplitComplexArray {
        validateSize(a, b)
        return vectorMultiplySplitComplexArrayRealArray(b, a)
    }

    /// Complex division.
    /// - Parameters:
    ///   - a: Complex array.
    ///   - b: Real array.
    /// - Returns: The result of the division.
    public static func / (a: SplitComplexArray, b: [Double]) -> SplitComplexArray {
        validateSize(a, b)
        return vectorDivideSplitComplexArrayRealArray(a, b)
    }

    /// Complex division.
    /// - Parameters:
    ///   - a: Real array.
    ///   - b: Complex array.
    /// - Returns: The result of the division.
    public static func / (a: [Double], b: SplitComplexArray) -> SplitComplexArray {
        validateSize(a, b)
        return vectorDivideRealArraySplitComplexArray(a, b)
    }
}

private func vectorMultiplySplitComplexArrayRealArray(_ a: SplitComplexArray, _ b: RealArray) -> SplitComplexArray {
    var c = a
    SplitComplexArray.withUnsafeParameters(a, b, &c) { A, B, C, N in
        vDSP_zrvmulD(A, 1, B, 1, C, 1, N)
    }
    return c
}

private func vectorDivideSplitComplexArrayRealArray(_ a: SplitComplexArray, _ b: RealArray) -> SplitComplexArray {
    var c = a
    SplitComplexArray.withUnsafeParameters(a, b, &c) { A, B, C, N in
        vDSP_zrvdivD(A, 1, B, 1, C, 1, N)
    }
    return c
}

private func vectorDivideRealArraySplitComplexArray(_ a: RealArray, _ b: SplitComplexArray) -> SplitComplexArray {
    var c = b
    let a1 = [Double](repeating: 0.0, count: a.count)
    let aa = SplitComplexArray(a, a1)
    SplitComplexArray.withUnsafeParameters(aa, b, &c) { A, B, C, N in
        vDSP_zvdivD(B, 1, A, 1, C, 1, N)
    }
    return c
}
