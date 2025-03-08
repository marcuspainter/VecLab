//
//  log2.swift
//  
//
//  Created by Marcus Painter on 09/09/2023.
//

import Foundation
import Accelerate

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
    return (naturalLog.0 / ln2, naturalLog.1 / ln2)
}

/// Base 2 logarithm of a complex array.
/// - Returns: The base 2 logarithm of `x`.
/// - Parameter x: Complex array.
/// - Returns: The base 2 logarithm of `x`.
public func log2(_ x: ComplexArray) -> ComplexArray {
    assertSameSize(x)
    var r = RealArray(repeating: 0, count: x.0.count)
    var i = RealArray(repeating: 0, count: x.1.count)
    for k in 0 ..< x.0.count {
        (r[k], i[k]) = log2(Complex(x.0[k], x.1[k]))
    }
    return (r, i)
}
