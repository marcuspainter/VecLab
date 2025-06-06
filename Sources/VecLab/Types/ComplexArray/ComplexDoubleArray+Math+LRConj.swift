//
//  ComplexDoubleArray+LRConj.swift
//  VecLab
//
//  Created by Marcus Painter on 19/04/2025.
//

import Accelerate

/// Complex left conjugate multiply
extension ComplexDoubleArray {
    /// Left conjugate multiply.
    /// - Parameters:
    ///   - a: Complex array.
    ///   - b: Complex  array.
    /// - Returns: The result of the conjugate multiplication `conj(a) * b`.
    public static func ~* (a: ComplexArray, b: ComplexArray) -> ComplexArray {
        validateSize(a, b)
        return vectorConjugateMultiplyComplexArray(a, b)
    }

    /// Left conjugate multiply.
    /// - Parameters:
    ///   - a: Complex array.
    ///   - b: Complex number.
    /// - Returns: The result of the conjugate multiplication `conj(a) * b`.
    public static func ~* (a: ComplexArray, b: Complex) -> ComplexArray {
        validateSize(a)
        return conj(a) * b
    }

    /// Left conjugate multiply.
    /// - Parameters:
    ///   - a: Complex number.
    ///   - b: Complex array.
    /// - Returns: The result of the conjugate multiplication `conj(a) * b`.
    public static func ~* (a: Complex, b: ComplexArray) -> ComplexArray {
        validateSize(b)
        return conj(a) * b
    }

    /// Left conjugate multiply.
    /// - Parameters:
    ///   - a: Complex array.
    ///   - b: Real  number.
    /// - Returns: The result of the conjugate multiplication `conj(a) * b`.
    public static func ~* (a: ComplexArray, b: Real) -> ComplexArray {
        validateSize(a)
        return conj(a) * b
    }

    /// Left conjugate multiply.
    /// - Parameters:
    ///   - a: Complex array.
    ///   - b: Real  array.
    /// - Returns: The result of the conjugate multiplication `conj(a) * b`.
    public static func ~* (a: ComplexArray, b: RealArray) -> ComplexArray {
        validateSize(a, b)
        return conj(a) * b
    }
}

/// Complex right conjugate multiply
extension ComplexDoubleArray {
    /// Right conjugate multiply.
    /// - Parameters:
    ///   - a: Complex array.
    ///   - b: Complex array.
    /// - Returns: The result of the conjugate multiplication `a * conj(b)`.
    public static func *~ (a: ComplexArray, b: ComplexArray) -> ComplexArray {
        validateSize(a, b)
        let c = vectorConjugateMultiplyComplexArray(b, a)
        return c
    }

    /// Right conjugate multiply.
    /// - Parameters:
    ///   - a: Complex array.
    ///   - b: Complex number.
    /// - Returns: The result of the conjugate multiplication `a * conj(b)`.
    public static func *~ (a: ComplexArray, b: Complex) -> ComplexArray {
        validateSize(a)
        return a * conj(b) // Overloaded
    }

    /// Right conjugate multiply.
    /// - Parameters:
    ///   - a: Complex number.
    ///   - b: Complex array
    /// - Returns: The result of the conjugate multiplication `a * conj(b)`.
    public static func *~ (a: Complex, b: ComplexArray) -> ComplexArray {
        validateSize(b)
        return a * conj(b) // Overloaded
    }

    /// Right conjugate multiply.
    /// - Parameters:
    ///   - a: Real array.
    ///   - b: Complex array.
    /// - Returns: The result of the conjugate multiplication `a * conj(b)`.
    public static func *~ (a: RealArray, b: ComplexArray) -> ComplexArray {
        validateSize(a, b)
        return a * conj(b) // Overloaded
    }

    /// Right conjugate multiply.
    /// - Parameters:
    ///   - a: Real number.
    ///   - b: Complex array.
    /// - Returns: The result of the conjugate multiplication `a * conj(b)`.
    public static func *~ (a: Real, b: ComplexArray) -> ComplexArray {
        validateSize(b)
        return a * conj(b) // Overloaded
    }
}
