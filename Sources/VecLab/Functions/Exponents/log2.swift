//
//  log2.swift
//
//
//  Created by Marcus Painter on 09/09/2023.
//

import Accelerate
import Foundation

// NOT VECTORIZED

/// Base 2 logarithm of a real array.
/// - Parameter x: Real number.
/// - Returns: The base 2 logarithm of `x`.
public func log2(_ x: RealArray) -> RealArray {
    return vForce.log2(x)
}

/// Base 2 logarithm of a complex number.
/// - Parameter a: Complex number.
/// - Returns: The base 2 logarithm of `x`.
public func log2(_ a: Complex) -> Complex {
    let naturalLog = complexLog(a)
    let ln2: Real = Darwin.log(2.0)
    return Complex(naturalLog.real / ln2, naturalLog.imag / ln2)
}

/// Base 2 logarithm of a complex array.
/// - Returns: The base 2 logarithm of `x`.
/// - Parameter x: Complex array.
/// - Returns: The base 2 logarithm of `x`.
public func log2(_ x: ComplexArray) -> ComplexArray {
    validateSize(x)
    var c = ComplexArray(count: x.count)
    for k in 0..<x.count {
        c[k] = log2(x[k])
    }
    return c
}
