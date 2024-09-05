//
//  power+Double.swift
//
//
//  Created by Marcus Painter on 06/09/2023.
//

import Accelerate
import Foundation

/// Power.
/// - Parameters:
///   - a: Integer number.
///   - b: Real number.
/// - Returns: Raises `a` to the power of `b`.
@inlinable
public func ** (_ a: Int, _ b: RealDouble) -> RealDouble {
    return pow(a, b)
}
/// Power.
/// - Parameters:
///   - a: Real number.
///   - b: Integer number.
/// - Returns: Raises `a` to the power of `b`.
@inlinable
public func ** (_ a: RealDouble, _ b: Int) -> RealDouble {
    return pow(a, b)
}

/// Power.
/// - Parameters:
///   - a: Real number.
///   - b: Integer.
/// - Returns: Raises `a` to the power of `b`.
@inlinable
public func ** (_ a: RealDoubleArray, _ b: Int) -> RealDoubleArray {
    return pow(a, b)
}

/// Power.
/// - Parameters:
///   - a: Complex number.
///   - b: Integer.
/// - Returns: Raises `a` to the power of `b`.
@inlinable
public func ** (_ a: ComplexDouble, _ b: Int) -> ComplexDouble {
    return pow(a, b)
}

/*
 /// Power.
 /// - Parameters:
 ///   - a: Complex array.
 ///   - b: Integer.
 /// - Returns: Raises `a` to the power of `b`.
 @inlinable
 public func ** (_ a: ComplexDoubleArray, _ b: Int) -> ComplexDoubleArray {
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
public func ** (_ a: RealDouble, _ b: RealDouble) -> RealDouble {
    return pow(a, b)
}

// MARK: Real Array

/// Power.
/// - Parameters:
///   - a: Real array.
///   - b: Real array.
/// - Returns: Raises `a` to the power of `b`.
@inlinable
public func ** (_ a: RealDoubleArray, _ b: RealDoubleArray) -> RealDoubleArray {
    return pow(a, b)
}

/// Power.
/// - Parameters:
///   - a: Real array.
///   - b: Real number.
/// - Returns: Raises `a` to the power of `b`.
@inlinable
public func ** (_ a: RealDoubleArray, _ b: RealDouble) -> RealDoubleArray {
    return pow(a, b)
}

/// Power.
/// - Parameters:
///   - a: Real number.
///   - b: Real array.
/// - Returns: Raises `a` to the power of `b`.
@inlinable
public func ** (_ a: RealDouble, _ b: RealDoubleArray) -> RealDoubleArray {
    return pow(a, b)
}

// MARK: Complex

/// Power.
/// - Parameters:
///   - a: Complex number.
///   - b: Real number.
/// - Returns: Raises `a` to the power of `b`.
@inlinable
public func ** (_ a: ComplexDouble, _ b: RealDouble) -> ComplexDouble {
    return pow(a, b)
}

/// Power.
/// - Parameters:
///   - a: Real number.
///   - b: Complex number.
/// - Returns: Raises `a` to the power of 'b'
@inlinable
public func ** (_ a: RealDouble, _ b: ComplexDouble) -> ComplexDouble {
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
 public func ** (_ a: ComplexDoubleArray, _ b: ComplexDoubleArray) -> ComplexDoubleArray {
     return ([], [])
 }
 */

/// Power.
/// - Parameters:
///   - a: Complex array.
///   - b: Real array.
/// - Returns: Raises `a` to the power of `b`.
@inlinable
public func ** (_ a: ComplexDoubleArray, _ b: RealDoubleArray) -> ComplexDoubleArray {
    return pow(a, b)
}

/// Power.
/// - Parameters:
///   - a: Real array.
///   - b: Complex array.
/// - Returns: Raises `a` to the power of `b`.
@inlinable
public func ** (_ a: RealDoubleArray, _ b: ComplexDoubleArray) -> ComplexDoubleArray {
    return pow(a, b)
}

/// Power.
/// - Parameters:
///   - a: Real array.
///   - b: Complex number.
/// - Returns: Raises `a` to the power of `b`.
@inlinable
public func ** (_ a: RealDoubleArray, _ b: ComplexDouble) -> ComplexDoubleArray {
    return pow(a, b)
}

/// Power.
/// - Parameters:
///   - a: Complex number.
///   - b: Real array.
/// - Returns: Raises `a` to the power of `b`.
@inlinable
public func ** (_ a: ComplexDouble, _ b: RealDoubleArray) -> ComplexDoubleArray {
    return pow(a, b)
}

/// Power.
/// - Parameters:
///   - a: Complex array.
///   - b: Real number.
/// - Returns: Raises `a` to the power of `b`.
@inlinable
public func ** (_ a: ComplexDoubleArray, _ b: RealDouble) -> ComplexDoubleArray {
    return pow(a, b)
}

/// Power.
/// - Parameters:
///   - a: Real number.
///   - b: Complex array.
/// - Returns: Raises `a` to the power of `b`.
@inlinable
public func ** (_ a: RealDouble, _ b: ComplexDoubleArray) -> ComplexDoubleArray {
    return pow(a, b)
}
