//
//  lconjmultiply+Double.swift
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
public func ~* (a: ComplexDouble, b: ComplexDouble) -> ComplexDouble {
    return complexConjugateMultiply(b, a)
}

/// Left conjugate multiply.
/// - Parameters:
///   - a: Complex number.
///   - b: Real number.
/// - Returns: The result of the conjugate multiplication `conj(a) * b`.
public func ~* (a: ComplexDouble, b: RealDouble) -> ComplexDouble {
    return conj(a) * b
}

/// Left conjugate multiply.
/// - Parameters:
///   - a: Complex array.
///   - b: Real array.
/// - Returns: The result of the conjugate multiplication `conj(a) * b`.
public func ~* (a: ComplexDoubleArray, b: ComplexDoubleArray) -> ComplexDoubleArray {
    assertSameSize(a, b)
    return vectorConjugateMultiplyComplexArray(a, b)
}

/// Left conjugate multiply.
/// - Parameters:
///   - a: Complex array.
///   - b: Real number.
/// - Returns: The result of the conjugate multiplication `conj(a) * b`.
public func ~* (a: ComplexDoubleArray, b: ComplexDouble) -> ComplexDoubleArray {
    return conj(a) * b
}

/// Left conjugate multiply.
/// - Parameters:
///   - a: Complex number.
///   - b: Complex array.
/// - Returns: The result of the conjugate multiplication `conj(a) * b`.
public func ~* (a: ComplexDouble, b: ComplexDoubleArray) -> ComplexDoubleArray {
    return conj(a) * b
}

/// Left conjugate multiply.
/// - Parameters:
///   - a: Complex array.
///   - b: Real  array.
/// - Returns: The result of the conjugate multiplication `conj(a) * b`.
public func ~* (a: ComplexDoubleArray, b: RealDoubleArray) -> ComplexDoubleArray {
    assertSameSize(a, b)
    return conj(a) * b
}

/// Left conjugate multiply.
/// - Parameters:
///   - a: Complex array.
///   - b: Real  number.
/// - Returns: The result of the conjugate multiplication `conj(a) * b`.
public func ~* (a: ComplexDoubleArray, b: RealDouble) -> ComplexDoubleArray {
    return conj(a) * b
}

/// Left conjugate multiply.
/// - Parameters:
///   - a: Complex number.
///   - b: Real  array.
/// - Returns: The result of the conjugate multiplication `conj(a) * b`.
public func ~* (a: ComplexDouble, b: RealDoubleArray) -> ComplexDoubleArray {
    return conj(a) * b
}

/*
 //@available(*, unavailable, message: "LHS is not complex. Check type or use *")
 public func ~*(_ a: RealDouble, _ b: RealDouble) -> RealDouble {
     return a * b
 }

 //@available(*, unavailable, message: "LHS is not complex. Check type or use *")
 public func ~*(a: RealDouble, b: ComplexDouble) -> ComplexDouble {
     return b * a
 }

 //@available(*, unavailable, message: "LHS is not complex. Check type or use *")
 public func ~* (a: RealDoubleArray, b: ComplexDoubleArray) -> ComplexDoubleArray {
     assertSameSize(a, b)
     return b * a
 }

 //@available(*, unavailable, message: "LHS is not complex. Check type or use *")
 public func ~* (a: RealDouble, b: ComplexDoubleArray) -> ComplexDoubleArray {
     return b * a
 }

 // No effect
 //@available(*, unavailable, message: "LHS is not complex. Check type or use *")
 public func ~* (a: RealDoubleArray, b: ComplexDouble) -> ComplexDoubleArray {
     return (a * b.0, a * b.1)
 }
  */
