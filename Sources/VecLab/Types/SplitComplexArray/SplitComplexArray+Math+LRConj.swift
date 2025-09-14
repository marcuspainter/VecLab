//
//  SplitComplexArray+LRConj.swift
//  VecLab
//
//  Created by Marcus Painter on 19/04/2025.
//

import Accelerate

/// Complex left conjugate multiply
extension SplitComplexArray {
    /// Left conjugate multiply.
    /// - Parameters:
    ///   - a: Complex array.
    ///   - b: Complex  array.
    /// - Returns: The result of the conjugate multiplication `conj(a) * b`.
    public static func ~* (a: SplitComplexArray, b: SplitComplexArray) -> SplitComplexArray {
        validateSize(a, b)
        return vectorConjugateMultiplySplitComplexArray(a, b)
    }

    /// Left conjugate multiply.
    /// - Parameters:
    ///   - a: Complex array.
    ///   - b: Complex number.
    /// - Returns: The result of the conjugate multiplication `conj(a) * b`.
    public static func ~* (a: SplitComplexArray, b: Complex) -> SplitComplexArray {
        validateSize(a)
        return conj(a) * b
    }

    /// Left conjugate multiply.
    /// - Parameters:
    ///   - a: Complex number.
    ///   - b: Complex array.
    /// - Returns: The result of the conjugate multiplication `conj(a) * b`.
    public static func ~* (a: Complex, b: SplitComplexArray) -> SplitComplexArray {
        validateSize(b)
        return conj(a) * b
    }

    /// Left conjugate multiply.
    /// - Parameters:
    ///   - a: Complex array.
    ///   - b: Real  number.
    /// - Returns: The result of the conjugate multiplication `conj(a) * b`.
    public static func ~* (a: SplitComplexArray, b: Real) -> SplitComplexArray {
        validateSize(a)
        return conj(a) * b
    }

    /// Left conjugate multiply.
    /// - Parameters:
    ///   - a: Complex array.
    ///   - b: Real  array.
    /// - Returns: The result of the conjugate multiplication `conj(a) * b`.
    public static func ~* (a: SplitComplexArray, b: RealArray) -> SplitComplexArray {
        validateSize(a, b)
        return conj(a) * b
    }
}

/// Complex right conjugate multiply
extension SplitComplexArray {
    /// Right conjugate multiply.
    /// - Parameters:
    ///   - a: Complex array.
    ///   - b: Complex array.
    /// - Returns: The result of the conjugate multiplication `a * conj(b)`.
    public static func *~ (a: SplitComplexArray, b: SplitComplexArray) -> SplitComplexArray {
        validateSize(a, b)
        let c = vectorConjugateMultiplySplitComplexArray(b, a)
        return c
    }

    /// Right conjugate multiply.
    /// - Parameters:
    ///   - a: Complex array.
    ///   - b: Complex number.
    /// - Returns: The result of the conjugate multiplication `a * conj(b)`.
    public static func *~ (a: SplitComplexArray, b: Complex) -> SplitComplexArray {
        validateSize(a)
        return a * conj(b)  // Overloaded
    }

    /// Right conjugate multiply.
    /// - Parameters:
    ///   - a: Complex number.
    ///   - b: Complex array
    /// - Returns: The result of the conjugate multiplication `a * conj(b)`.
    public static func *~ (a: Complex, b: SplitComplexArray) -> SplitComplexArray {
        validateSize(b)
        return a * conj(b)  // Overloaded
    }

    /// Right conjugate multiply.
    /// - Parameters:
    ///   - a: Real array.
    ///   - b: Complex array.
    /// - Returns: The result of the conjugate multiplication `a * conj(b)`.
    public static func *~ (a: RealArray, b: SplitComplexArray) -> SplitComplexArray {
        validateSize(a, b)
        return a * conj(b)  // Overloaded
    }

    /// Right conjugate multiply.
    /// - Parameters:
    ///   - a: Real number.
    ///   - b: Complex array.
    /// - Returns: The result of the conjugate multiplication `a * conj(b)`.
    public static func *~ (a: Real, b: SplitComplexArray) -> SplitComplexArray {
        validateSize(b)
        return a * conj(b)  // Overloaded
    }
}
