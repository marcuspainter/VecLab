//
//  ComplexDoubleArray+Math.swift
//  VecLab
//
//  Created by Marcus Painter on 19/04/2025.
//

import Accelerate

extension ComplexDoubleArray {
    /// Complex array addition.
    /// - Parameters:
    ///   - a: Complex array.
    ///   - b: Complex array.
    /// - Returns: The result of the addition.
    public static func + (a: ComplexDoubleArray, b: ComplexDoubleArray) -> ComplexDoubleArray {
        validateSize(a, b)
        let result = vectorAddComplexArray(a, b)
        return result
    }

    /// Complex array subtraction.
    /// - Parameters:
    ///   - a: Complex array.
    ///   - b: Complex array.
    /// - Returns: The result of the subtraction.
    public static func - (a: ComplexDoubleArray, b: ComplexDoubleArray) -> ComplexDoubleArray {
        validateSize(a, b)
        return vectorSubtractComplexArray(a, b)
    }

    /// Complex array multiplication.
    /// - Parameters:
    ///   - a: Complex array.
    ///   - b: Complex array.
    /// - Returns: The result of the multiplication.
    public static func * (a: ComplexDoubleArray, b: ComplexDoubleArray) -> ComplexDoubleArray {
        validateSize(a, b)
        return vectorMultiplyComplexArray(a, b)
    }

    /// Complex array division.
    /// - Parameters:
    ///   - a: Complex array..
    ///   - b: Complex array.
    /// - Returns: The result of the division.
    public static func / (a: ComplexDoubleArray, b: ComplexDoubleArray) -> ComplexDoubleArray {
        validateSize(a, b)
        return vectorDivideComplexArray(a, b)
    }
}
