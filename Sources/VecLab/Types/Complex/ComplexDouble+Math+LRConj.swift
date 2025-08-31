//
//  ComplexDouble+Math+Lconj.swift
//  VecLab
//
//  Created by Marcus Painter on 19/04/2025.
//

//
// Complex left and right conjugate multiply
//

extension ComplexDouble {

    // MARK: Complex left conjugate multiply

    /// Left conjugate multiply.
    /// - Parameters:
    ///   - a: Complex number.
    ///   - b: Complex number.
    /// - Returns: The result of the conjugate multiplication `conj(a) * b`.
    public static func ~* (a: Complex, b: Complex) -> Complex {
        return complexConjugateMultiply(b, a)
    }

    /// Left conjugate multiply.
    /// - Parameters:
    ///   - a: Complex number.
    ///   - b: Real number.
    /// - Returns: The result of the conjugate multiplication `conj(a) * b`.
    public static func ~* (a: Complex, b: Real) -> Complex {
        return conj(a) * b
    }

    /// Left conjugate multiply.
    /// - Parameters:
    ///   - a: Complex number.
    ///   - b: Real  array.
    /// - Returns: The result of the conjugate multiplication `conj(a) * b`.
    public static func ~* (a: Complex, b: RealArray) -> ComplexArray {
        return conj(a) * b
    }

}

extension ComplexDouble {

    // MARK: Complex right conjugate multiply

    /// Right conjugate multiply.
    /// - Parameters:
    ///   - a: Complex number.
    ///   - b: Complex number.
    /// - Returns: The result of the conjugate multiplication `a * conj(b)`.
    public static func *~ (a: Complex, b: Complex) -> Complex {
        return complexConjugateMultiply(b, a)
    }

    /// Right conjugate multiply
    /// - Parameters:
    ///   - a: Real number.
    ///   - b: Complex number.
    /// - Returns: The result of the conjugate multiplication `a * conj(b)`.
    public static func *~ (a: Real, b: Complex) -> Complex {
        return a * conj(b) // Overloaded
    }

    /// Right conjugate multiply.
    /// - Parameters:
    ///   - a: Real array.
    ///   - b: Complex number.
    /// - Returns: The result of the conjugate multiplication `a * conj(b)`.
    public static func *~ (a: RealArray, b: Complex) -> ComplexArray {
        return a * conj(b) // Overloaded
    }

}
