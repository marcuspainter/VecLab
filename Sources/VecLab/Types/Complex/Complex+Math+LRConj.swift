//
//  Complex+Math+Lconj.swift
//  VecLab
//
//  Created by Marcus Painter on 19/04/2025.
//

//
// Complex left and right conjugate multiply
//

// MARK: Complex left conjugate multiply

extension Complex {

    /// Left conjugate multiply.
    /// - Parameters:
    ///   - a: Complex number.
    ///   - b: Complex number.
    /// - Returns: The result of the conjugate multiplication `conj(a) * b`.
    @inlinable
    public static func ~* (a: Complex, b: Complex) -> Complex {
        return conj(a) * b
    }

    /// Left conjugate multiply.
    /// - Parameters:
    ///   - a: Complex number.
    ///   - b: Real number.
    /// - Returns: The result of the conjugate multiplication `conj(a) * b`.
    @inlinable
    public static func ~* (a: Complex, b: Real) -> Complex {
        return conj(a) * b
    }
}

// MARK: Complex right conjugate multiply

extension Complex {

    /// Right conjugate multiply.
    /// - Parameters:
    ///   - a: Complex number.
    ///   - b: Complex number.
    /// - Returns: The result of the conjugate multiplication `a * conj(b)`.
    public static func *~ (a: Complex, b: Complex) -> Complex {
        return a * conj(b)  // Overloaded
    }

    /// Right conjugate multiply
    /// - Parameters:
    ///   - a: Real number.
    ///   - b: Complex number.
    /// - Returns: The result of the conjugate multiplication `a * conj(b)`.
    @inlinable
    public static func *~ (a: Real, b: Complex) -> Complex {
        return a * conj(b)  // Overloaded
    }
}
