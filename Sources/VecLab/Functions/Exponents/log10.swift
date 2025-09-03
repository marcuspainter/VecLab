//
//  log10.swift
//
//
//  Created by Marcus Painter on 09/09/2023.
//

import Accelerate
import Foundation

// NOT VECTORIZED

/// Base 10 logarithm of a real  array.
public func log10(_ x: RealArray) -> RealArray {
    return vForce.log10(x)
}

/// Base 10 logarithm of a complex number.
public func log10(_ a: Complex) -> Complex {
    let naturalLog = complexLog(a)
    let ln10: Real = Darwin.log(10.0)
    return Complex(naturalLog.real / ln10, naturalLog.imag / ln10)
}

/// Base 10 logarithm of a complex array.
public func log10(_ x: ComplexArray) -> ComplexArray {
    validateSize(x)
    var c = ComplexArray(count: x.count)
    for k in 0..<x.count {
        c[k] = log10(x[k])
    }
    return c
}
