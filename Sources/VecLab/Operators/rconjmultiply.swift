//
//  rconjmultiply.swift
//
//
//  Created by Marcus Painter on 08/09/2023.
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
public func *~ (a: Complex, b: Complex) -> Complex {
    return complexConjugateMultiply(b, a)
}

/// Right conjugate multiply
/// - Parameters:
///   - a: Real number.
///   - b: Complex number.
/// - Returns: The result of the conjugate multiplication `a * conj(b)`.
public func *~ (a: Real, b: Complex) -> Complex {
    return a * conj(b) // Overloaded
}

/// Right conjugate multiply.
/// - Parameters:
///   - a: Complex array.
///   - b: Complex array.
/// - Returns: The result of the conjugate multiplication `a * conj(b)`.
public func *~ (a: ComplexArray, b: ComplexArray) -> ComplexArray {
    assertSameSize(a, b)
    var c = createComplexArray(count: a.0.count)
    c = vectorConjugateMultiplyComplexArray(b, a)
    return c
}

/// Right conjugate multiply.
/// - Parameters:
///   - a: Complex array.
///   - b: Complex number.
/// - Returns: The result of the conjugate multiplication `a * conj(b)`.
public func *~ (a: ComplexArray, b: Complex) -> ComplexArray {
    assertSameSize(a)
    return a * conj(b) // Overloaded
}

/// Right conjugate multiply.
/// - Parameters:
///   - a: Complex number.
///   - b: Complex array
/// - Returns: The result of the conjugate multiplication `a * conj(b)`.
public func *~ (a: Complex, b: ComplexArray) -> ComplexArray {
    assertSameSize(b)
    return a * conj(b) // Overloaded
}

/// Right conjugate multiply.
/// - Parameters:
///   - a: Real array.
///   - b: Complex array.
/// - Returns: The result of the conjugate multiplication `a * conj(b)`.
public func *~ (a: RealArray, b: ComplexArray) -> ComplexArray {
    assertSameSize(a, b)
    return a * conj(b) // Overloaded
}

/// Right conjugate multiply.
/// - Parameters:
///   - a: Real number.
///   - b: Complex array.
/// - Returns: The result of the conjugate multiplication `a * conj(b)`.
public func *~ (a: Real, b: ComplexArray) -> ComplexArray {
    assertSameSize(b)
    return a * conj(b) // Overloaded
}

/// Right conjugate multiply.
/// - Parameters:
///   - a: Real array.
///   - b: Complex number.
/// - Returns: The result of the conjugate multiplication `a * conj(b)`.
public func *~ (a: RealArray, b: Complex) -> ComplexArray {
    return a * conj(b) // Overloaded
}

/*
 //@available(*, unavailable, message: "LHS is not complex. Check type or use *")
 public func *~(_ a: Real, _ b: Real) -> Real {
     return a * b
 }

 //@available(*, unavailable, message: "LHS is not complex. Check type or use *")
 public func *~(a: Real, b: Complex) -> Complex {
     return b * a
 }

 //@available(*, unavailable, message: "LHS is not complex. Check type or use *")
 public func *~ (a: RealArray, b: ComplexArray) -> ComplexArray {
     assertSameSize(a, b)
     return b * a
 }

 //@available(*, unavailable, message: "LHS is not complex. Check type or use *")
 public func *~ (a: Real, b: ComplexArray) -> ComplexArray {
     return b * a
 }

 // No effect
 //@available(*, unavailable, message: "LHS is not complex. Check type or use *")
 public func *~ (a: RealArray, b: Complex) -> ComplexArray {
     return (a * b.0, a * b.1)
 }
  */
