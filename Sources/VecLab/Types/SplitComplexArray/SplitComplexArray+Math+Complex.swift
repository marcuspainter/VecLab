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

// MARK: Private

private func vectorMultiplySplitComplexArrayComplex(_ a: SplitComplexArray, _ b: Complex) -> SplitComplexArray {
    var c = a
    let bb = SplitComplexArray(repeating: b, count: a.count)
    SplitComplexArray.withUnsafeParameters(a, bb, &c) { A, B, C, N in
        let conjugateFlag = Int32(1) // No conjugate multiply: 1
        vDSP_zvmulD(A, 1, B, 1, C, 1, N, conjugateFlag)
    }
    return c
}

private func vectorMultiplyComplexSplitComplexArray(_ a: Complex, _ b: SplitComplexArray) -> SplitComplexArray {
    var c = b
    let aa = SplitComplexArray(repeating: a, count: b.count)
    SplitComplexArray.withUnsafeParameters(aa, b, &c) { A, B, C, N in
        let conjugateFlag = Int32(1) // No conjugate multiply: 1
        vDSP_zvmulD(A, 1, B, 1, C, 1, N, conjugateFlag)
    }
    return c
}

private func vectorDivideSplitComplexArrayComplex(_ a: SplitComplexArray, _ b: Complex) -> SplitComplexArray {
    var c = a
    let b0 = [Double](repeating: b.real, count: a.count)
    let b1 = [Double](repeating: b.imag, count: a.count)
    let bb = SplitComplexArray(b0, b1)
    SplitComplexArray.withUnsafeParameters(a, bb, &c) { A, B, C, N in
        vDSP_zvdivD(B, 1, A, 1, C, 1, N)
    }
    return c
}

private func vectorDivideComplexSplitComplexArray(_ a: Complex, _ b: SplitComplexArray) -> SplitComplexArray {
    var c = b
    let a0 = [Double](repeating: a.real, count: b.count)
    let a1 = [Double](repeating: a.imag, count: b.count)
    let aa = SplitComplexArray(a0, a1)
    SplitComplexArray.withUnsafeParameters(aa, b, &c) { A, B, C, N in
        vDSP_zvdivD(B, 1, A, 1, C, 1, N)
    }
    return c
}
