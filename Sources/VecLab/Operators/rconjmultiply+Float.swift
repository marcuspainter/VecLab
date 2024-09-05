//
//  lconjmultiply+Float.swift
//
//
//  Created by Marcus Painter on 04/09/2024.
//


import Accelerate
import Foundation

// MARK: Conjugate Multiply a * conj(b), right hand side conjugate

infix operator *~: MultiplicationPrecedence

/// Right conjugate multiply.
/// - Parameters:
///   - a: Complex number.
///   - b: Complex number.
/// - Returns: The result of the conjugate multiplication `a * conj(b)`.
public func *~ (a: ComplexFloat, b: ComplexFloat) -> ComplexFloat {
    return complexConjugateMultiply(b, a)
}

/// Right conjugate multiply
/// - Parameters:
///   - a: Real number.
///   - b: Complex number.
/// - Returns: The result of the conjugate multiplication `a * conj(b)`.
public func *~ (a: RealFloat, b: ComplexFloat) -> ComplexFloat {
    return a * conj(b) // Overloaded
}

/// Right conjugate multiply.
/// - Parameters:
///   - a: Complex array.
///   - b: Complex array.
/// - Returns: The result of the conjugate multiplication `a * conj(b)`.
public func *~ (a: ComplexFloatArray, b: ComplexFloatArray) -> ComplexFloatArray {
    assertSameSize(a, b)
    let c = vectorConjugateMultiplyComplexArray(b, a)
    return c
}

/// Right conjugate multiply.
/// - Parameters:
///   - a: Complex array.
///   - b: Complex number.
/// - Returns: The result of the conjugate multiplication `a * conj(b)`.
public func *~ (a: ComplexFloatArray, b: ComplexFloat) -> ComplexFloatArray {
    return a * conj(b) // Overloaded
}

/// Right conjugate multiply.
/// - Parameters:
///   - a: Complex number.
///   - b: Complex array
/// - Returns: The result of the conjugate multiplication `a * conj(b)`.
public func *~ (a: ComplexFloat, b: ComplexFloatArray) -> ComplexFloatArray {
    return a * conj(b) // Overloaded
}

/// Right conjugate multiply.
/// - Parameters:
///   - a: Real array.
///   - b: Complex array.
/// - Returns: The result of the conjugate multiplication `a * conj(b)`.
public func *~ (a: RealFloatArray, b: ComplexFloatArray) -> ComplexFloatArray {
    assertSameSize(a, b)
    return a * conj(b) // Overloaded
}

/// Right conjugate multiply.
/// - Parameters:
///   - a: Real number.
///   - b: Complex array.
/// - Returns: The result of the conjugate multiplication `a * conj(b)`.
public func *~ (a: RealFloat, b: ComplexFloatArray) -> ComplexFloatArray {
    return a * conj(b) // Overloaded
}

/// Right conjugate multiply.
/// - Parameters:
///   - a: Real array.
///   - b: Complex number.
/// - Returns: The result of the conjugate multiplication `a * conj(b)`.
public func *~ (a: RealFloatArray, b: ComplexFloat) -> ComplexFloatArray {
    return a * conj(b) // Overloaded
}

/*
 //@available(*, unavailable, message: "LHS is not complex. Check type or use *")
 public func *~(_ a: RealFloat, _ b: RealFloat) -> RealFloat {
     return a * b
 }

 //@available(*, unavailable, message: "LHS is not complex. Check type or use *")
 public func *~(a: RealFloat, b: ComplexFloat) -> ComplexFloat {
     return b * a
 }

 //@available(*, unavailable, message: "LHS is not complex. Check type or use *")
 public func *~ (a: RealFloatArray, b: ComplexFloatArray) -> ComplexFloatArray {
     assertSameSize(a, b)
     return b * a
 }

 //@available(*, unavailable, message: "LHS is not complex. Check type or use *")
 public func *~ (a: RealFloat, b: ComplexFloatArray) -> ComplexFloatArray {
     return b * a
 }

 // No effect
 //@available(*, unavailable, message: "LHS is not complex. Check type or use *")
 public func *~ (a: RealFloatArray, b: ComplexFloat) -> ComplexFloatArray {
     return (a * b.0, a * b.1)
 }
  */

