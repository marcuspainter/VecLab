//
//  lconjmultiply+Float.swift
//
//
//  Created by Marcus Painter on 04/09/2024.
//

import Accelerate
import Foundation

// MARK: Conjugate Multiply conj(a) * b, left hand side conjugate

infix operator ~*: MultiplicationPrecedence

/// Left conjugate multiply.
/// - Parameters:
///   - a: Complex number.
///   - b: Complex number.
/// - Returns: The result of the conjugate multiplication `conj(a) * b`.
public func ~* (a: ComplexFloat, b: ComplexFloat) -> ComplexFloat {
    return complexConjugateMultiply(b, a)
}

/// Left conjugate multiply.
/// - Parameters:
///   - a: Complex number.
///   - b: Real number.
/// - Returns: The result of the conjugate multiplication `conj(a) * b`.
public func ~* (a: ComplexFloat, b: RealFloat) -> ComplexFloat {
    return conj(a) * b
}

/// Left conjugate multiply.
/// - Parameters:
///   - a: Complex array.
///   - b: Real array.
/// - Returns: The result of the conjugate multiplication `conj(a) * b`.
public func ~* (a: ComplexFloatArray, b: ComplexFloatArray) -> ComplexFloatArray {
    assertSameSize(a, b)
    return vectorConjugateMultiplyComplexArray(a, b)
}

/// Left conjugate multiply.
/// - Parameters:
///   - a: Complex array.
///   - b: Real number.
/// - Returns: The result of the conjugate multiplication `conj(a) * b`.
public func ~* (a: ComplexFloatArray, b: ComplexFloat) -> ComplexFloatArray {
    return conj(a) * b
}

/// Left conjugate multiply.
/// - Parameters:
///   - a: Complex number.
///   - b: Complex array.
/// - Returns: The result of the conjugate multiplication `conj(a) * b`.
public func ~* (a: ComplexFloat, b: ComplexFloatArray) -> ComplexFloatArray {
    return conj(a) * b
}

/// Left conjugate multiply.
/// - Parameters:
///   - a: Complex array.
///   - b: Real  array.
/// - Returns: The result of the conjugate multiplication `conj(a) * b`.
public func ~* (a: ComplexFloatArray, b: RealFloatArray) -> ComplexFloatArray {
    assertSameSize(a, b)
    return conj(a) * b
}

/// Left conjugate multiply.
/// - Parameters:
///   - a: Complex array.
///   - b: Real  number.
/// - Returns: The result of the conjugate multiplication `conj(a) * b`.
public func ~* (a: ComplexFloatArray, b: RealFloat) -> ComplexFloatArray {
    return conj(a) * b
}

/// Left conjugate multiply.
/// - Parameters:
///   - a: Complex number.
///   - b: Real  array.
/// - Returns: The result of the conjugate multiplication `conj(a) * b`.
public func ~* (a: ComplexFloat, b: RealFloatArray) -> ComplexFloatArray {
    return conj(a) * b
}

/*
 //@available(*, unavailable, message: "LHS is not complex. Check type or use *")
 public func ~*(_ a: RealFloat, _ b: RealFloat) -> RealFloat {
     return a * b
 }

 //@available(*, unavailable, message: "LHS is not complex. Check type or use *")
 public func ~*(a: RealFloat, b: ComplexFloat) -> ComplexFloat {
     return b * a
 }

 //@available(*, unavailable, message: "LHS is not complex. Check type or use *")
 public func ~* (a: RealFloatArray, b: ComplexFloatArray) -> ComplexFloatArray {
     assertSameSize(a, b)
     return b * a
 }

 //@available(*, unavailable, message: "LHS is not complex. Check type or use *")
 public func ~* (a: RealFloat, b: ComplexFloatArray) -> ComplexFloatArray {
     return b * a
 }

 // No effect
 //@available(*, unavailable, message: "LHS is not complex. Check type or use *")
 public func ~* (a: RealFloatArray, b: ComplexFloat) -> ComplexFloatArray {
     return (a * b.0, a * b.1)
 }
  */
