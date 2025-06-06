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
///   - a: Integer number.
///   - b: Integer number.
/// - Returns: Raises `a` to the power of `b`.
public func pow(_ a: Int, _ b: Int) -> Real {
    return Darwin.pow(Real(a), Real(b))
}

/// Power.
/// - Parameters:
///   - a: Integer number.
///   - b: Real number.
/// - Returns: Raises `a` to the power of `b`.
public func pow(_ a: Int, _ b: Real) -> Real {
    return Darwin.pow(Real(a), b)
}

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

// MARK: Real Array

/// Power.
/// - Parameters:
///   - a: Real array.
///   - b: Real array.
/// - Returns: Raises `a` to the power of `b`
public func pow(_ a: RealArray, _ b: RealArray) -> RealArray {
    validateSize(a, b)
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

/// Power.
/// - Parameters:
///   - a: Complex array.
///   - b: Real array.
/// - Returns: Raises `a` to the power of `b`
public func pow(_ a: ComplexArray, _ b: RealArray) -> ComplexArray {
    validateSize(a, b)
    var c: ComplexArray = a
    for k in 0 ..< a.count {
        c[k] = pow(a[k], b[k])
    }
    return c
}

/// Power.
/// - Parameters:
///   - a: Real array.
///   - b: Complex array.
/// - Returns: Raises `a` to the power of `b`
public func pow(_ a: RealArray, _ b: ComplexArray) -> ComplexArray {
    validateSize(a, b)
    var c: ComplexArray = b
    for k in 0 ..< b.count {
        c[k] = pow(a[k], b[k])
    }
    return c
}

/// Power.
/// - Parameters:
///   - a: Real array.
///   - b: Complex number.
/// - Returns: Raises `a` to the power of `b`
public func pow(_ a: RealArray, _ b: Complex) -> ComplexArray {
    var c: ComplexArray = ComplexArray(count: a.count)
    for k in 0 ..< a.count {
        c[k] = pow(a[k], b)
    }
    return c
}

/// Power.
/// - Parameters:
///   - a: Complex number.
///   - b: Real array.
/// - Returns: Raises `a` to the power of `b`
public func pow(_ a: Complex, _ b: RealArray) -> ComplexArray {
    var c: ComplexArray = ComplexArray(count: b.count)
    for k in 0 ..< b.count {
        c[k] = pow(a, b[k])
    }
    return c
}

/// Power.
/// - Parameters:
///   - a: Complex array.
///   - b: Real number.
/// - Returns: Raises `a` to the power of `b`
public func pow(_ a: ComplexArray, _ b: Real) -> ComplexArray {
    validateSize(a)
    var c: ComplexArray = ComplexArray(count: a.count)
    for k in 0 ..< a.count {
        c[k] = pow(a[k], b)
    }
    return c
}

/// Power.
/// - Parameters:
///   - a: Real number.
///   - b: Complex array.
/// - Returns: Raises `a` to the power of `b`
public func pow(_ a: Real, _ b: ComplexArray) -> ComplexArray {
    validateSize(b)
    var c: ComplexArray = ComplexArray(count: b.count)
    for k in 0 ..< b.count {
        c[k] = pow(a, b[k])
    }
    return c
}

/// Power.
/// - Parameters:
///   - base: Complex number.
///   - exponent: Complex number.
/// - Returns: Raises `a` to the power of `b
public func pow(_ base: Complex, _ exponent: Complex) -> Complex {
    let (a, b) = (base.real, base.imag)
    let (c, d) = (exponent.real, exponent.imag)

    // Convert base to polar form
    let r = hypot(a, b)
    let theta = atan2(b, a)

    // Compute power using exponentiation formula:
    // (r e^(iθ))^(c + di) = r^c * e^(-dθ) * e^(i(d ln r + cθ))
    let newR = pow(r, c) * exp(-d * theta)
    let newTheta = d * log(r) + c * theta

    return Complex(newR * cos(newTheta), newR * sin(newTheta))
}

/// Power.
/// - Parameters:
///   - a: Complex array.
///   - b: Complex array.
/// - Returns: Raises `a` to the power of `b
public func pow(_ a: ComplexArray, _ b: ComplexArray) -> ComplexArray {
    validateSize(a, b)
    var c: ComplexArray = ComplexArray(count: a.count)
    for k in 0 ..< a.count {
        c[k] = pow(a[k], b[k])
    }

    return c
}
