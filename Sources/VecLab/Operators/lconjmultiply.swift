//
//  lconjmultiply.swift
//
//
//  Created by Marcus Painter on 08/09/2023.
//

import Accelerate
import Foundation

// NOT VECTORIZED !!!!

// MARK: Conjugate Multiply conj(a) * b, left hand side conjugate

infix operator ~*: MultiplicationPrecedence

/// Left conjugate multiply.
/// - Parameters:
///   - a: Complex number.
///   - b: Complex number.
/// - Returns: The result of the conjugate multiplication `conj(a) * b`.
public func ~* (a: Complex, b: Complex) -> Complex {
    return complexConjugateMultiply(b, a)
}

/// Left conjugate multiply.
/// - Parameters:
///   - a: Complex number.
///   - b: Real number.
/// - Returns: The result of the conjugate multiplication `conj(a) * b`.
public func ~* (a: Complex, b: Real) -> Complex {
    return conj(a) * b
}

/// Left conjugate multiply.
/// - Parameters:
///   - a: Complex array.
///   - b: Real array.
/// - Returns: The result of the conjugate multiplication `conj(a) * b`.
public func ~* (a: ComplexArray, b: ComplexArray) -> ComplexArray {
    assertSameSize(a, b)
    return vectorConjugateMultiplyComplexArray(a, b)
}

/// Left conjugate multiply.
/// - Parameters:
///   - a: Complex array.
///   - b: Real number.
/// - Returns: The result of the conjugate multiplication `conj(a) * b`.
public func ~* (a: ComplexArray, b: Complex) -> ComplexArray {
    return conj(a) * b
}

/// Left conjugate multiply.
/// - Parameters:
///   - a: Complex number.
///   - b: Complex array.
/// - Returns: The result of the conjugate multiplication `conj(a) * b`.
public func ~* (a: Complex, b: ComplexArray) -> ComplexArray {
    return conj(a) * b
}

/// Left conjugate multiply.
/// - Parameters:
///   - a: Complex array.
///   - b: Real  array.
/// - Returns: The result of the conjugate multiplication `conj(a) * b`.
public func ~* (a: ComplexArray, b: RealArray) -> ComplexArray {
    assertSameSize(a, b)
    return conj(a) * b
}

/// Left conjugate multiply.
/// - Parameters:
///   - a: Complex array.
///   - b: Real  number.
/// - Returns: The result of the conjugate multiplication `conj(a) * b`.
public func ~* (a: ComplexArray, b: Real) -> ComplexArray {
    return conj(a) * b
}

/// Left conjugate multiply.
/// - Parameters:
///   - a: Complex number.
///   - b: Real  array.
/// - Returns: The result of the conjugate multiplication `conj(a) * b`.
public func ~* (a: Complex, b: RealArray) -> ComplexArray {
    return conj(a) * b
}

/*
 //@available(*, unavailable, message: "LHS is not complex. Check type or use *")
 public func ~*(_ a: Real, _ b: Real) -> Real {
     return a * b
 }

 //@available(*, unavailable, message: "LHS is not complex. Check type or use *")
 public func ~*(a: Real, b: Complex) -> Complex {
     return b * a
 }

 //@available(*, unavailable, message: "LHS is not complex. Check type or use *")
 public func ~* (a: RealArray, b: ComplexArray) -> ComplexArray {
     assertSameSize(a, b)
     return b * a
 }

 //@available(*, unavailable, message: "LHS is not complex. Check type or use *")
 public func ~* (a: Real, b: ComplexArray) -> ComplexArray {
     return b * a
 }

 // No effect
 //@available(*, unavailable, message: "LHS is not complex. Check type or use *")
 public func ~* (a: RealArray, b: Complex) -> ComplexArray {
     return (a * b.0, a * b.1)
 }
  */
