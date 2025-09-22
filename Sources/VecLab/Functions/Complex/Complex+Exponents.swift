//
//  Complex+Exponents.swift
//  VecLab
//
//  Created by Marcus Painter on 21/09/2025.
//

import Accelerate

/// Exponential of a complex number.
/// - Parameter x: Complex number.
/// - Returns: The exponential of `x`.
public func exp(_ x: Complex) -> Complex {
    // return complexExp(x)
    return CoreComplex.exp(x)
}

/// Returns a complex number from angle by Euler
/// - Parameter x: Angle in radians
/// - Returns: Complex number of (cos(x),  sin(x)) equivalent to exp(i \* x) by Euler's formula.
public func expi(_ x: Real) -> Complex {
    return Complex(Darwin.cos(x), Darwin.sin(x))
}

/// Returns a complex number from angle by Euler
/// - Parameter x: Angle in radians
/// - Returns: Complex number of (cos(x),  sin(x)) equivalent to exp(j\* x) by Euler's formula.
public func expj(_ x: Real) -> Complex {
    return Complex(Darwin.cos(x), Darwin.sin(x))
}

/// Square root of sum of squares (hypotenuse).
/// - Parameters:
///   - a: Real number.
///   - b: Real number.
/// - Returns: Returns the hypotenuse of a right triangle with side lengths of  `a`and `b`.
public func hypot(_ a: Complex, _ b: Complex) -> Complex {
    var r: Complex
    var result: Complex
    if abs(a) > abs(b) {
        r = b / a
        result = abs(a) * sqrt(1.0 + r * r)
    } else {
        r = a / b
        result = abs(b) * sqrt(1.0 + r * r)
    }
    return result
}

/// Natural logarithm of a complex number.
/// - Parameter x: Complex number.
/// - Returns: The natural logarithm of `x`.
public func log(_ x: Complex) -> Complex {
    return CoreComplex.log(x)
}

/// Base 2 logarithm of a complex number.
/// - Parameter a: Complex number.
/// - Returns: The base 2 logarithm of `x`.
public func log2(_ x: Complex) -> Complex {
    return CoreComplex.log2(x)
}

/// Base 10 logarithm of a complex number.
public func log10(_ x: Complex) -> Complex {
    return CoreComplex.log10(x)
}

/// Square root of a complex number.
/// - Parameter x: Complex number.
/// - Returns: The complex square root.
public func sqrt(_ x: Complex) -> Complex {
    return CoreComplex.sqrt(x)
}
