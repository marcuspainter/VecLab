//
//  pow+Float.swift
//
//
//  Created by Marcus Painter on 04/09/2024.
//

import Accelerate
import Foundation

// MARK: Int

/// Power.
/// - Parameters:
///   - a: Integer number.
///   - b: Real number.
/// - Returns: Raises `a` to the power of `b`.
@inlinable
public func ** (_ a: Int, _ b: RealFloat) -> RealFloat {
    return pow(a, b)
}
/// Power.
/// - Parameters:
///   - a: Real number.
///   - b: Integer number.
/// - Returns: Raises `a` to the power of `b`.
@inlinable
public func ** (_ a: RealFloat, _ b: Int) -> RealFloat {
    return pow(a, b)
}

/// Power.
/// - Parameters:
///   - a: Real number.
///   - b: Integer.
/// - Returns: Raises `a` to the power of `b`.
@inlinable
public func ** (_ a: RealFloatArray, _ b: Int) -> RealFloatArray {
    return pow(a, b)
}

/// Power.
/// - Parameters:
///   - a: Complex number.
///   - b: Integer.
/// - Returns: Raises `a` to the power of `b`.
@inlinable
public func ** (_ a: ComplexFloat, _ b: Int) -> ComplexFloat {
    return pow(a, b)
}

/*
 /// Power.
 /// - Parameters:
 ///   - a: Complex array.
 ///   - b: Integer.
 /// - Returns: Raises `a` to the power of `b`.
 @inlinable
 public func ** (_ a: ComplexFloatArray, _ b: Int) -> ComplexFloatArray {
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
public func ** (_ a: RealFloat, _ b: RealFloat) -> RealFloat {
    return pow(a, b)
}

// MARK: Real Array

/// Power.
/// - Parameters:
///   - a: Real array.
///   - b: Real array.
/// - Returns: Raises `a` to the power of `b`.
@inlinable
public func ** (_ a: RealFloatArray, _ b: RealFloatArray) -> RealFloatArray {
    return pow(a, b)
}

/// Power.
/// - Parameters:
///   - a: Real array.
///   - b: Real number.
/// - Returns: Raises `a` to the power of `b`.
@inlinable
public func ** (_ a: RealFloatArray, _ b: RealFloat) -> RealFloatArray {
    return pow(a, b)
}

/// Power.
/// - Parameters:
///   - a: Real number.
///   - b: Real array.
/// - Returns: Raises `a` to the power of `b`.
@inlinable
public func ** (_ a: RealFloat, _ b: RealFloatArray) -> RealFloatArray {
    return pow(a, b)
}

// MARK: Complex

/// Power.
/// - Parameters:
///   - a: Complex number.
///   - b: Real number.
/// - Returns: Raises `a` to the power of `b`.
@inlinable
public func ** (_ a: ComplexFloat, _ b: RealFloat) -> ComplexFloat {
    return pow(a, b)
}

/// Power.
/// - Parameters:
///   - a: Real number.
///   - b: Complex number.
/// - Returns: Raises `a` to the power of 'b'
@inlinable
public func ** (_ a: RealFloat, _ b: ComplexFloat) -> ComplexFloat {
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
 public func ** (_ a: ComplexFloatArray, _ b: ComplexFloatArray) -> ComplexFloatArray {
     return ([], [])
 }
 */

/// Power.
/// - Parameters:
///   - a: Complex array.
///   - b: Real array.
/// - Returns: Raises `a` to the power of `b`.
@inlinable
public func ** (_ a: ComplexFloatArray, _ b: RealFloatArray) -> ComplexFloatArray {
    return pow(a, b)
}

/// Power.
/// - Parameters:
///   - a: Real array.
///   - b: Complex array.
/// - Returns: Raises `a` to the power of `b`.
@inlinable
public func ** (_ a: RealFloatArray, _ b: ComplexFloatArray) -> ComplexFloatArray {
    return pow(a, b)
}

/// Power.
/// - Parameters:
///   - a: Real array.
///   - b: Complex number.
/// - Returns: Raises `a` to the power of `b`.
@inlinable
public func ** (_ a: RealFloatArray, _ b: ComplexFloat) -> ComplexFloatArray {
    return pow(a, b)
}

/// Power.
/// - Parameters:
///   - a: Complex number.
///   - b: Real array.
/// - Returns: Raises `a` to the power of `b`.
@inlinable
public func ** (_ a: ComplexFloat, _ b: RealFloatArray) -> ComplexFloatArray {
    return pow(a, b)
}

/// Power.
/// - Parameters:
///   - a: Complex array.
///   - b: Real number.
/// - Returns: Raises `a` to the power of `b`.
@inlinable
public func ** (_ a: ComplexFloatArray, _ b: RealFloat) -> ComplexFloatArray {
    return pow(a, b)
}

/// Power.
/// - Parameters:
///   - a: Real number.
///   - b: Complex array.
/// - Returns: Raises `a` to the power of `b`.
@inlinable
public func ** (_ a: RealFloat, _ b: ComplexFloatArray) -> ComplexFloatArray {
    return pow(a, b)
}
