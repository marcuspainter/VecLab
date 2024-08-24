//
//  pow.swift
//
//
//  Created by Marcus Painter on 09/09/2023.
//

import Accelerate
import Foundation

// NOT VECTORIZED !!!!

/// Power.
/// - Parameters:
///   - a: Real number.
///   - b: Real number.
/// - Returns: Raises `a` to the power of `b`.
public func pow(_ a: Real, _ b: Int) -> Real {
    return Darwin.pow(a, Real(b))
}

/// Power.
/// - Parameters:
///   - a: Real array.
///   - b: Real array.
/// - Returns: Raises `a` to the power of `b`.
public func pow(_ a: RealArray, _ b: Int) -> RealArray {
    return pow(a, Real(b))
}

/// Power.
/// - Parameters:
///   - a: Complex number.
///   - b: Integer.
/// - Returns: Raises `a` to the power of `b`.
public func pow(_ a: Complex, _ b: Int) -> Complex {
    return pow(a, Real(b))
}

/*
/// Power.
/// - Parameters:
///   - a: Complex array.
///   - b: Complex array.
/// - Returns: Raises `a` to the power of `b`
public func pow(_ a: ComplexArray, _ b: Int) -> ComplexArray {
    return pow(a, Real(b))
}
*/

// MARK: Real Array

/// Power.
/// - Parameters:
///   - a: Real array.
///   - b: Real array.
/// - Returns: Raises `a` to the power of `b`
public func pow(_ a: RealArray, _ b: RealArray) -> RealArray {
    return vectorPowReal(a, b)
}

/// Power.
/// - Parameters:
///   - a: Real array.
///   - b: Real number.
/// - Returns: Raises `a` to the power of `b`.
public func pow(_ a: RealArray, _ b: Real) -> RealArray {
    return vectorPowReal(a, b)
}

/// Power.
/// - Parameters:
///   - a: Real number.
///   - b: Real array.
/// - Returns: Raises `a` to the power of `b`.
public func pow(_ a: Real, _ b: RealArray) -> RealArray {
    return vectorPowReal(a, b)
}

// MARK: Complex

/// Power.
/// - Parameters:
///   - a: Complex number.
///   - b: Real number.
/// - Returns: Raises `a` to the power of `b`.
public func pow(_ a: Complex, _ b: Real) -> Complex {
    return complexComplexRealPow(a, b)
}

/// Power.
/// - Parameters:
///   - a: Real number.
///   - b: Complex number.
/// - Returns: Raises `a` to the power of `b`
public func pow(_ a: Real, _ b: Complex) -> Complex {
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
public func pow(_ a: ComplexArray, _ b: RealArray) -> ComplexArray {
    assertSameSize(a, b)
    var r = RealArray(repeating: 0, count: a.0.count)
    var i = RealArray(repeating: 0, count: a.1.count)
    for k in 0 ..< a.0.count {
        (r[k], i[k]) = pow(Complex(a.0[k], a.1[k]), b[k])
    }
    return (r, i)
}

/// Power.
/// - Parameters:
///   - a: Real array.
///   - b: Complex array.
/// - Returns: Raises `a` to the power of `b`
public func pow(_ a: RealArray, _ b: ComplexArray) -> ComplexArray {
    assertSameSize(a, b)
    var r = RealArray(repeating: 0, count: b.0.count)
    var i = RealArray(repeating: 0, count: b.1.count)
    for k in 0 ..< b.0.count {
        (r[k], i[k]) = pow(a[k], Complex(b.0[k], b.1[k]))
    }
    return (r, i)
}

/// Power.
/// - Parameters:
///   - a: Real array.
///   - b: Complex number.
/// - Returns: Raises `a` to the power of `b`
public func pow(_ a: RealArray, _ b: Complex) -> ComplexArray {
    var r = RealArray(repeating: 0, count: a.count)
    var i = RealArray(repeating: 0, count: a.count)
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
public func pow(_ a: Complex, _ b: RealArray) -> ComplexArray {
    var r = RealArray(repeating: 0, count: b.count)
    var i = RealArray(repeating: 0, count: b.count)
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
public func pow(_ a: ComplexArray, _ b: Real) -> ComplexArray {
    var r = RealArray(repeating: 0, count: a.0.count)
    var i = RealArray(repeating: 0, count: a.1.count)
    for k in 0 ..< a.0.count {
        (r[k], i[k]) = pow(Complex(a.0[k], a.1[k]), b)
    }
    return (r, i)
}

/// Power.
/// - Parameters:
///   - a: Real number.
///   - b: Complex array.
/// - Returns: Raises `a` to the power of `b`
public func pow(_ a: Real, _ b: ComplexArray) -> ComplexArray {
    var r = RealArray(repeating: 0, count: b.0.count)
    var i = RealArray(repeating: 0, count: b.1.count)
    for k in 0 ..< b.0.count {
        (r[k], i[k]) = pow(a, Complex(b.0[k], b.1[k]))
    }
    return (r, i)
}
