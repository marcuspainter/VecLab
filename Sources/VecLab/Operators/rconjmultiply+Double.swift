//
//  rconjmultiply+Double.swift
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
public func *~ (a: ComplexDouble, b: ComplexDouble) -> ComplexDouble {
    return complexConjugateMultiply(b, a)
}

/// Right conjugate multiply
/// - Parameters:
///   - a: Real number.
///   - b: Complex number.
/// - Returns: The result of the conjugate multiplication `a * conj(b)`.
public func *~ (a: RealDouble, b: ComplexDouble) -> ComplexDouble {
    return a * conj(b) // Overloaded
}

/// Right conjugate multiply.
/// - Parameters:
///   - a: Complex array.
///   - b: Complex array.
/// - Returns: The result of the conjugate multiplication `a * conj(b)`.
public func *~ (a: ComplexDoubleArray, b: ComplexDoubleArray) -> ComplexDoubleArray {
    assertSameSize(a, b)
    let c = vectorConjugateMultiplyComplexArray(b, a)
    return c
}

/// Right conjugate multiply.
/// - Parameters:
///   - a: Complex array.
///   - b: Complex number.
/// - Returns: The result of the conjugate multiplication `a * conj(b)`.
public func *~ (a: ComplexDoubleArray, b: ComplexDouble) -> ComplexDoubleArray {
    return a * conj(b) // Overloaded
}

/// Right conjugate multiply.
/// - Parameters:
///   - a: Complex number.
///   - b: Complex array
/// - Returns: The result of the conjugate multiplication `a * conj(b)`.
public func *~ (a: ComplexDouble, b: ComplexDoubleArray) -> ComplexDoubleArray {
    return a * conj(b) // Overloaded
}

/// Right conjugate multiply.
/// - Parameters:
///   - a: Real array.
///   - b: Complex array.
/// - Returns: The result of the conjugate multiplication `a * conj(b)`.
public func *~ (a: RealDoubleArray, b: ComplexDoubleArray) -> ComplexDoubleArray {
    assertSameSize(a, b)
    return a * conj(b) // Overloaded
}

/// Right conjugate multiply.
/// - Parameters:
///   - a: Real number.
///   - b: Complex array.
/// - Returns: The result of the conjugate multiplication `a * conj(b)`.
public func *~ (a: RealDouble, b: ComplexDoubleArray) -> ComplexDoubleArray {
    return a * conj(b) // Overloaded
}

/// Right conjugate multiply.
/// - Parameters:
///   - a: Real array.
///   - b: Complex number.
/// - Returns: The result of the conjugate multiplication `a * conj(b)`.
public func *~ (a: RealDoubleArray, b: ComplexDouble) -> ComplexDoubleArray {
    return a * conj(b) // Overloaded
}

/*
 //@available(*, unavailable, message: "LHS is not complex. Check type or use *")
 public func *~(_ a: RealDouble, _ b: RealDouble) -> RealDouble {
     return a * b
 }

 //@available(*, unavailable, message: "LHS is not complex. Check type or use *")
 public func *~(a: RealDouble, b: ComplexDouble) -> ComplexDouble {
     return b * a
 }

 //@available(*, unavailable, message: "LHS is not complex. Check type or use *")
 public func *~ (a: RealDoubleArray, b: ComplexDoubleArray) -> ComplexDoubleArray {
     assertSameSize(a, b)
     return b * a
 }

 //@available(*, unavailable, message: "LHS is not complex. Check type or use *")
 public func *~ (a: RealDouble, b: ComplexDoubleArray) -> ComplexDoubleArray {
     return b * a
 }

 // No effect
 //@available(*, unavailable, message: "LHS is not complex. Check type or use *")
 public func *~ (a: RealDoubleArray, b: ComplexDouble) -> ComplexDoubleArray {
     return (a * b.0, a * b.1)
 }
  */
