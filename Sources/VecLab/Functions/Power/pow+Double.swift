//
//  pow+Double.swift
//
//
//  Created by Marcus Painter on 09/09/2023.
//

import Accelerate
import Foundation



/// Power.
/// - Parameters:
///   - a: Integer number.
///   - b: Real number.
/// - Returns: Raises `a` to the power of `b`.
public func pow(_ a: Int, _ b: RealDouble) -> RealDouble {
    return Darwin.pow(RealDouble(a), b)
}

/// Power.
/// - Parameters:
///   - a: Real number.
///   - b: Real number.
/// - Returns: Raises `a` to the power of `b`.
public func pow(_ a: RealDouble, _ b: Int) -> RealDouble {
    return Darwin.pow(a, RealDouble(b))
}

/// Power.
/// - Parameters:
///   - a: Real array.
///   - b: Real array.
/// - Returns: Raises `a` to the power of `b`.
public func pow(_ a: RealDoubleArray, _ b: Int) -> RealDoubleArray {
    return pow(a, RealDouble(b))
}

/// Power.
/// - Parameters:
///   - a: Complex number.
///   - b: Integer.
/// - Returns: Raises `a` to the power of `b`.
public func pow(_ a: ComplexDouble, _ b: Int) -> ComplexDouble {
    return pow(a, RealDouble(b))
}

/*
/// Power.
/// - Parameters:
///   - a: Complex array.
///   - b: Complex array.
/// - Returns: Raises `a` to the power of `b`
public func pow(_ a: ComplexDoubleArray, _ b: Int) -> ComplexDoubleArray {
    return pow(a, RealDouble(b))
}
*/

// MARK: Real Array

/// Power.
/// - Parameters:
///   - a: Real array.
///   - b: Real array.
/// - Returns: Raises `a` to the power of `b`
public func pow(_ a: RealDoubleArray, _ b: RealDoubleArray) -> RealDoubleArray {
    return vectorPowReal(a, b)
}

/// Power.
/// - Parameters:
///   - a: Real array.
///   - b: Real number.
/// - Returns: Raises `a` to the power of `b`.
public func pow(_ a: RealDoubleArray, _ b: RealDouble) -> RealDoubleArray {
    return vectorPowReal(a, b)
}

/// Power.
/// - Parameters:
///   - a: Real number.
///   - b: Real array.
/// - Returns: Raises `a` to the power of `b`.
public func pow(_ a: RealDouble, _ b: RealDoubleArray) -> RealDoubleArray {
    return vectorPowReal(a, b)
}

// MARK: Complex

/// Power.
/// - Parameters:
///   - a: Complex number.
///   - b: Real number.
/// - Returns: Raises `a` to the power of `b`.
public func pow(_ a: ComplexDouble, _ b: RealDouble) -> ComplexDouble {
    return complexComplexRealPow(a, b)
}

/// Power.
/// - Parameters:
///   - a: Real number.
///   - b: Complex number.
/// - Returns: Raises `a` to the power of `b`
public func pow(_ a: RealDouble, _ b: ComplexDouble) -> ComplexDouble {
    return complexRealComplexPow(a, b)
}

// MARK: Complex Array

/*
/// Power
/// - Parameters:
///   - a: Complex array
///   - b: Complex array
/// - Returns: Raises `a` to the power of `b`
public func pow(_ a: ComplexArray, _ b: ComplexArray) -> ComplexArray {
    return ([], [])
}
*/

/// Power.
/// - Parameters:
///   - a: Complex array.
///   - b: Real array.
/// - Returns: Raises `a` to the power of `b`
public func pow(_ a: ComplexDoubleArray, _ b: RealDoubleArray) -> ComplexDoubleArray {
    assertSameSize(a, b)
    var r = RealDoubleArray(repeating: 0, count: a.0.count)
    var i = RealDoubleArray(repeating: 0, count: a.1.count)
    for k in 0 ..< a.0.count {
        (r[k], i[k]) = pow(ComplexDouble(a.0[k], a.1[k]), b[k])
    }
    return (r, i)
}

/// Power.
/// - Parameters:
///   - a: Real array.
///   - b: Complex array.
/// - Returns: Raises `a` to the power of `b`
public func pow(_ a: RealDoubleArray, _ b: ComplexDoubleArray) -> ComplexDoubleArray {
    assertSameSize(a, b)
    var r = RealDoubleArray(repeating: 0, count: b.0.count)
    var i = RealDoubleArray(repeating: 0, count: b.1.count)
    for k in 0 ..< b.0.count {
        (r[k], i[k]) = pow(a[k], ComplexDouble(b.0[k], b.1[k]))
    }
    return (r, i)
}

/// Power.
/// - Parameters:
///   - a: Real array.
///   - b: Complex number.
/// - Returns: Raises `a` to the power of `b`
public func pow(_ a: RealDoubleArray, _ b: ComplexDouble) -> ComplexDoubleArray {
    var r = RealDoubleArray(repeating: 0, count: a.count)
    var i = RealDoubleArray(repeating: 0, count: a.count)
    for k in 0 ..< a.count {
        (r[k], i[k]) = pow(a[k], b)
    }
    return (r, i)
}

/// Power.
/// - Parameters:
///   - a: Complex number.
///   - b: Real array.
/// - Returns: Raises `a` to the power of `b`
public func pow(_ a: ComplexDouble, _ b: RealDoubleArray) -> ComplexDoubleArray {
    var r = RealDoubleArray(repeating: 0, count: b.count)
    var i = RealDoubleArray(repeating: 0, count: b.count)
    for k in 0 ..< b.count {
        (r[k], i[k]) = pow(a, b[k])
    }
    return (r, i)
}

/// Power.
/// - Parameters:
///   - a: Complex array.
///   - b: Real number.
/// - Returns: Raises `a` to the power of `b`
public func pow(_ a: ComplexDoubleArray, _ b: RealDouble) -> ComplexDoubleArray {
    var r = RealDoubleArray(repeating: 0, count: a.0.count)
    var i = RealDoubleArray(repeating: 0, count: a.1.count)
    for k in 0 ..< a.0.count {
        (r[k], i[k]) = pow(ComplexDouble(a.0[k], a.1[k]), b)
    }
    return (r, i)
}

/// Power.
/// - Parameters:
///   - a: Real number.
///   - b: Complex array.
/// - Returns: Raises `a` to the power of `b`
public func pow(_ a: RealDouble, _ b: ComplexDoubleArray) -> ComplexDoubleArray {
    var r = RealDoubleArray(repeating: 0, count: b.0.count)
    var i = RealDoubleArray(repeating: 0, count: b.1.count)
    for k in 0 ..< b.0.count {
        (r[k], i[k]) = pow(a, ComplexDouble(b.0[k], b.1[k]))
    }
    return (r, i)
}

