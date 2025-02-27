//
//  power.swift
//
//
//  Created by Marcus Painter on 06/09/2023.
//

import Accelerate
import Foundation

precedencegroup PowerPrecedence {
    higherThan: MultiplicationPrecedence
    associativity: left // Uses Matlab convention: 2**2**3 Matlab = 64, Python = 256
}

infix operator **: PowerPrecedence

// MARK: Int

/// Power.
/// - Parameters:
///   - a: Integer number.
///   - b: Integer number.
/// - Returns: Raises `a` to the power of `b`.
@inlinable
public func ** (_ a: Int, _ b: Int) -> Real {
    return pow(a, b)
}

/// Power.
/// - Parameters:
///   - a: Integer number.
///   - b: Real number.
/// - Returns: Raises `a` to the power of `b`.
@inlinable
public func ** (_ a: Int, _ b: Real) -> Real {
    return pow(a, b)
}
/// Power.
/// - Parameters:
///   - a: Real number.
///   - b: Integer number.
/// - Returns: Raises `a` to the power of `b`.
@inlinable
public func ** (_ a: Real, _ b: Int) -> Real {
    return pow(a, b)
}

/// Power.
/// - Parameters:
///   - a: Real number.
///   - b: Integer.
/// - Returns: Raises `a` to the power of `b`.
@inlinable
public func ** (_ a: RealArray, _ b: Int) -> RealArray {
    return pow(a, b)
}

/// Power.
/// - Parameters:
///   - a: Complex number.
///   - b: Integer.
/// - Returns: Raises `a` to the power of `b`.
@inlinable
public func ** (_ a: Complex, _ b: Int) -> Complex {
    return pow(a, b)
}

/*
 /// Power.
 /// - Parameters:
 ///   - a: Complex array.
 ///   - b: Integer.
 /// - Returns: Raises `a` to the power of `b`.
 @inlinable
 public func ** (_ a: ComplexArray, _ b: Int) -> ComplexArray {
     return pow(a, b)
 }
 */

// MARK: Real

/// Power.
/// - Parameters:
///   - a: Real number.
///   - b: Real number.
/// - Returns: Raises `a` to the power of `b`.
@inlinable
public func ** (_ a: Real, _ b: Real) -> Real {
    return pow(a, b)
}

// MARK: Real Array

/// Power.
/// - Parameters:
///   - a: Real array.
///   - b: Real array.
/// - Returns: Raises `a` to the power of `b`.
@inlinable
public func ** (_ a: RealArray, _ b: RealArray) -> RealArray {
    return pow(a, b)
}

/// Power.
/// - Parameters:
///   - a: Real array.
///   - b: Real number.
/// - Returns: Raises `a` to the power of `b`.
@inlinable
public func ** (_ a: RealArray, _ b: Real) -> RealArray {
    return pow(a, b)
}

/// Power.
/// - Parameters:
///   - a: Real number.
///   - b: Real array.
/// - Returns: Raises `a` to the power of `b`.
@inlinable
public func ** (_ a: Real, _ b: RealArray) -> RealArray {
    return pow(a, b)
}

// MARK: Complex

/// Power.
/// - Parameters:
///   - a: Complex number.
///   - b: Real number.
/// - Returns: Raises `a` to the power of `b`.
@inlinable
public func ** (_ a: Complex, _ b: Real) -> Complex {
    return pow(a, b)
}

/// Power.
/// - Parameters:
///   - a: Real number.
///   - b: Complex number.
/// - Returns: Raises `a` to the power of 'b'
@inlinable
public func ** (_ a: Real, _ b: Complex) -> Complex {
    return pow(a, b)
}

// MARK: Complex Array

/*
 /// Power
 /// - Parameters:
 ///   - a: Complex array
 ///   - b: Complex array
 /// - Returns: Raises `a` to the power of 'b'
 @available(*, unavailable, message: "Not implemented")
 public func ** (_ a: ComplexArray, _ b: ComplexArray) -> ComplexArray {
     return ([], [])
 }
 */

/// Power.
/// - Parameters:
///   - a: Complex array.
///   - b: Real array.
/// - Returns: Raises `a` to the power of `b`.
@inlinable
public func ** (_ a: ComplexArray, _ b: RealArray) -> ComplexArray {
    return pow(a, b)
}

/// Power.
/// - Parameters:
///   - a: Real array.
///   - b: Complex array.
/// - Returns: Raises `a` to the power of `b`.
@inlinable
public func ** (_ a: RealArray, _ b: ComplexArray) -> ComplexArray {
    return pow(a, b)
}

/// Power.
/// - Parameters:
///   - a: Real array.
///   - b: Complex number.
/// - Returns: Raises `a` to the power of `b`.
@inlinable
public func ** (_ a: RealArray, _ b: Complex) -> ComplexArray {
    return pow(a, b)
}

/// Power.
/// - Parameters:
///   - a: Complex number.
///   - b: Real array.
/// - Returns: Raises `a` to the power of `b`.
@inlinable
public func ** (_ a: Complex, _ b: RealArray) -> ComplexArray {
    return pow(a, b)
}

/// Power.
/// - Parameters:
///   - a: Complex array.
///   - b: Real number.
/// - Returns: Raises `a` to the power of `b`.
@inlinable
public func ** (_ a: ComplexArray, _ b: Real) -> ComplexArray {
    return pow(a, b)
}

/// Power.
/// - Parameters:
///   - a: Real number.
///   - b: Complex array.
/// - Returns: Raises `a` to the power of `b`.
@inlinable
public func ** (_ a: Real, _ b: ComplexArray) -> ComplexArray {
    return pow(a, b)
}
