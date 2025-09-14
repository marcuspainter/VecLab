//
//  SplitComplexArray+Math.swift
//  VecLab
//
//  Created by Marcus Painter on 19/04/2025.
//

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
