//
//  SplitComplexArray+Math.swift
//  VecLab
//
//  Created by Marcus Painter on 19/04/2025.
//

import Accelerate

extension SplitComplexArray {
    /// Complex array addition.
    /// - Parameters:
    ///   - a: Complex array.
    ///   - b: Complex array.
    /// - Returns: The result of the addition.
    public static func + (a: SplitComplexArray, b: SplitComplexArray) -> SplitComplexArray {
        validateSize(a, b)
        let result = vectorAddSplitComplexArray(a, b)
        return result
    }

    /// Complex array subtraction.
    /// - Parameters:
    ///   - a: Complex array.
    ///   - b: Complex array.
    /// - Returns: The result of the subtraction.
    public static func - (a: SplitComplexArray, b: SplitComplexArray) -> SplitComplexArray {
        validateSize(a, b)
        return vectorSubtractSplitComplexArray(a, b)
    }

    /// Complex array multiplication.
    /// - Parameters:
    ///   - a: Complex array.
    ///   - b: Complex array.
    /// - Returns: The result of the multiplication.
    public static func * (a: SplitComplexArray, b: SplitComplexArray) -> SplitComplexArray {
        validateSize(a, b)
        return vectorMultiplySplitComplexArray(a, b)
    }

    /// Complex array division.
    /// - Parameters:
    ///   - a: Complex array.
    ///   - b: Complex array.
    /// - Returns: The result of the division.
    public static func / (a: SplitComplexArray, b: SplitComplexArray) -> SplitComplexArray {
        validateSize(a, b)
        return vectorDivideSplitComplexArray(a, b)
    }
}

fileprivate func vectorAddSplitComplexArray(_ a: SplitComplexArray, _ b: SplitComplexArray) -> SplitComplexArray {
    var c = a
    SplitComplexArray.withUnsafeParameters(a, b, &c) { A, B, C, N in
        vDSP_zvaddD(A, 1, B, 1, C, 1, N)
    }
    return c
}

fileprivate func vectorSubtractSplitComplexArray(_ a: SplitComplexArray, _ b: SplitComplexArray) -> SplitComplexArray {
    var c = a
    SplitComplexArray.withUnsafeParameters(a, b, &c) { A, B, C, N in
        vDSP_zvsubD(A, 1, B, 1, C, 1, N)
    }
    return c
}

fileprivate func vectorMultiplySplitComplexArray(_ a: SplitComplexArray, _ b: SplitComplexArray) -> SplitComplexArray {
    var c = a
    SplitComplexArray.withUnsafeParameters(a, b, &c) { A, B, C, N in
        let conjugateFlag = Int32(1) // No conjugate multiply
        vDSP_zvmulD(A, 1, B, 1, C, 1, N, conjugateFlag)
    }
    return c
}

fileprivate func vectorDivideSplitComplexArray(_ a: SplitComplexArray, _ b: SplitComplexArray) -> SplitComplexArray {
    var c = a
    SplitComplexArray.withUnsafeParameters(a, b, &c) { A, B, C, N in
        vDSP_zvdivD(B, 1, A, 1, C, 1, N)
    }
    return c
}
