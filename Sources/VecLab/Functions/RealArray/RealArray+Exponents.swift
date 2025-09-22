//
//  RealArray+Exponents.swift
//  VecLab
//
//  Created by Marcus Painter on 21/09/2025.
//

import Accelerate
import Foundation

/// Exponential of a real array.
/// - Parameter x: Real array.
/// - Returns: The exponential of `x`.
public func exp(_ x: RealArray) -> RealArray {
    return vForce.exp(x)
}

/// Square root of sum of squares (hypotenuse).
/// - Parameters:
///   - a: Real number.
///   - b: Real number.
/// - Returns: Returns the hypotenuse of a right triangle with side lengths of  `a`and `b`.
public func hypot(_ a: Real, _ b: Real) -> Real {
    var r: Real
    var result: Real
    if abs(a) > abs(b) {
        r = b / a
        result = abs(a) * Darwin.sqrt(1.0 + r * r)
    } else {
        r = a / b
        result = abs(b) * Darwin.sqrt(1.0 + r * r)
    }
    return result
}

/// Square root of sum of squares (hypotenuse).
/// - Parameters:
///   - a: Real array.
///   - b: Real array.
/// - Returns: Returns the hypotenuse of a right triangle with side lengths of  `a`and `b`.
public func hypot(_ a: RealArray, _ b: RealArray) -> RealArray {
    validateSize(a, b)
    let result = zip(a, b).map { hypot($0, $1) }
    return result
}

/// Natural logarithm of a real array.
/// - Parameter x: Real number.
/// - Returns: The natural logarithm of `x`.
public func log(_ x: RealArray) -> RealArray {
    return vForce.log(x)
}

/// Base 2 logarithm of a real array.
/// - Parameter x: Real number.
/// - Returns: The base 2 logarithm of `x`.
public func log2(_ x: RealArray) -> RealArray {
    return vForce.log2(x)
}

/// Base 10 logarithm of a real  array.
public func log10(_ x: RealArray) -> RealArray {
    return vForce.log10(x)
}

/// Square root of a real array.
/// - Parameter x: Real array.
/// - Returns: The square roots.
public func sqrt(_ x: RealArray) -> RealArray {
    return vForce.sqrt(x)
}

/// Exponent of next higher power of 2.
///
/// By convention, `nextpow2(0)` returns zero. You can use `nextpow2` to pad the signal you pass to fft.
/// Doing so can speed up the computation of the FFT when the signal length is not an exact power of 2.
/// - Parameter n: Integer number.
/// - Returns: The next power of 2 greater than `n`.
public func nextpow2(_ n: Int) -> Int {
    guard n > 0 else {
        return 0
    }
    return Int(ceil(Darwin.log2(Double(n))))
}
