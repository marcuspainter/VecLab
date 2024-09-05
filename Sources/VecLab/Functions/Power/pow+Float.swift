//
//  pow+Float.swift
//
//
//  Created by Marcus Painter on 04/09/2024.
//

import Accelerate
import Foundation

/// Power.
/// - Parameters:
///   - a: Integer number.
///   - b: Integer number.
/// - Returns: Raises `a` to the power of `b`.
public func pow(_ a: Int, _ b: Int) -> RealFloat {
    return Darwin.pow(RealFloat(a), RealFloat(b))
}

/// Power.
/// - Parameters:
///   - a: Integer number.
///   - b: Real number.
/// - Returns: Raises `a` to the power of `b`.
public func pow(_ a: Int, _ b: RealFloat) -> RealFloat {
    return Darwin.pow(RealFloat(a), b)
}

/// Power.
/// - Parameters:
///   - a: Real number.
///   - b: Real number.
/// - Returns: Raises `a` to the power of `b`.
public func pow(_ a: RealFloat, _ b: Int) -> RealFloat {
    return Darwin.pow(a, RealFloat(b))
}

/// Power.
/// - Parameters:
///   - a: Real array.
///   - b: Real array.
/// - Returns: Raises `a` to the power of `b`.
public func pow(_ a: RealFloatArray, _ b: Int) -> RealFloatArray {
    return pow(a, RealFloat(b))
}

/// Power.
/// - Parameters:
///   - a: Complex number.
///   - b: Integer.
/// - Returns: Raises `a` to the power of `b`.
public func pow(_ a: ComplexFloat, _ b: Int) -> ComplexFloat {
    return pow(a, RealFloat(b))
}

/*
/// Power.
/// - Parameters:
///   - a: Complex array.
///   - b: Complex array.
/// - Returns: Raises `a` to the power of `b`
public func pow(_ a: ComplexFloatArray, _ b: Int) -> ComplexFloatArray {
    return pow(a, RealFloat(b))
}
*/

// MARK: Real Array

/// Power.
/// - Parameters:
///   - a: Real array.
///   - b: Real array.
/// - Returns: Raises `a` to the power of `b`
public func pow(_ a: RealFloatArray, _ b: RealFloatArray) -> RealFloatArray {
    return vectorPowReal(a, b)
}

/// Power.
/// - Parameters:
///   - a: Real array.
///   - b: Real number.
/// - Returns: Raises `a` to the power of `b`.
public func pow(_ a: RealFloatArray, _ b: RealFloat) -> RealFloatArray {
    return vectorPowReal(a, b)
}

/// Power.
/// - Parameters:
///   - a: Real number.
///   - b: Real array.
/// - Returns: Raises `a` to the power of `b`.
public func pow(_ a: RealFloat, _ b: RealFloatArray) -> RealFloatArray {
    return vectorPowReal(a, b)
}

// MARK: Complex

/// Power.
/// - Parameters:
///   - a: Complex number.
///   - b: Real number.
/// - Returns: Raises `a` to the power of `b`.
public func pow(_ a: ComplexFloat, _ b: RealFloat) -> ComplexFloat {
    return complexComplexRealPow(a, b)
}

/// Power.
/// - Parameters:
///   - a: Real number.
///   - b: Complex number.
/// - Returns: Raises `a` to the power of `b`
public func pow(_ a: RealFloat, _ b: ComplexFloat) -> ComplexFloat {
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
public func pow(_ a: ComplexFloatArray, _ b: RealFloatArray) -> ComplexFloatArray {
    assertSameSize(a, b)
    var r = RealFloatArray(repeating: 0, count: a.0.count)
    var i = RealFloatArray(repeating: 0, count: a.1.count)
    for k in 0 ..< a.0.count {
        (r[k], i[k]) = pow(ComplexFloat(a.0[k], a.1[k]), b[k])
    }
    return (r, i)
}

/// Power.
/// - Parameters:
///   - a: Real array.
///   - b: Complex array.
/// - Returns: Raises `a` to the power of `b`
public func pow(_ a: RealFloatArray, _ b: ComplexFloatArray) -> ComplexFloatArray {
    assertSameSize(a, b)
    var r = RealFloatArray(repeating: 0, count: b.0.count)
    var i = RealFloatArray(repeating: 0, count: b.1.count)
    for k in 0 ..< b.0.count {
        (r[k], i[k]) = pow(a[k], ComplexFloat(b.0[k], b.1[k]))
    }
    return (r, i)
}

/// Power.
/// - Parameters:
///   - a: Real array.
///   - b: Complex number.
/// - Returns: Raises `a` to the power of `b`
public func pow(_ a: RealFloatArray, _ b: ComplexFloat) -> ComplexFloatArray {
    var r = RealFloatArray(repeating: 0, count: a.count)
    var i = RealFloatArray(repeating: 0, count: a.count)
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
public func pow(_ a: ComplexFloat, _ b: RealFloatArray) -> ComplexFloatArray {
    var r = RealFloatArray(repeating: 0, count: b.count)
    var i = RealFloatArray(repeating: 0, count: b.count)
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
public func pow(_ a: ComplexFloatArray, _ b: RealFloat) -> ComplexFloatArray {
    var r = RealFloatArray(repeating: 0, count: a.0.count)
    var i = RealFloatArray(repeating: 0, count: a.1.count)
    for k in 0 ..< a.0.count {
        (r[k], i[k]) = pow(ComplexFloat(a.0[k], a.1[k]), b)
    }
    return (r, i)
}

/// Power.
/// - Parameters:
///   - a: Real number.
///   - b: Complex array.
/// - Returns: Raises `a` to the power of `b`
public func pow(_ a: RealFloat, _ b: ComplexFloatArray) -> ComplexFloatArray {
    var r = RealFloatArray(repeating: 0, count: b.0.count)
    var i = RealFloatArray(repeating: 0, count: b.1.count)
    for k in 0 ..< b.0.count {
        (r[k], i[k]) = pow(a, ComplexFloat(b.0[k], b.1[k]))
    }
    return (r, i)
}

