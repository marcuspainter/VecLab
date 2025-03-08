//
//  log10.swift
//  
//
//  Created by Marcus Painter on 09/09/2023.
//

import Foundation
import Accelerate

// NOT VECTORIZED

/// Base 10 logarithm of a real  array.
public func log10(_ x: RealArray) -> RealArray {
    return vForce.log10(x)
}

/// Base 10 logarithm of a complex number.
public func log10(_ a: Complex) -> Complex {
    let naturalLog = complexLog(a)
    let ln10: Real = Darwin.log(10.0)
    return (naturalLog.0 / ln10, naturalLog.1 / ln10)
}

/// Base 10 logarithm of a complex array.
public func log10(_ x: ComplexArray) -> ComplexArray {
    assertSameSize(x)
    var r = RealArray(repeating: 0, count: x.0.count)
    var i = RealArray(repeating: 0, count: x.1.count)
    for k in 0 ..< x.0.count {
        (r[k], i[k]) = log10(Complex(x.0[k], x.1[k]))
    }
    return (r, i)
}
