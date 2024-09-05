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
public func log10(_ x: RealDoubleArray) -> RealDoubleArray {
    return vForce.log10(x)
}

/// Base 10 logarithm of a complex number.
public func log10(_ a: ComplexDouble) -> ComplexDouble {
    let naturalLog = complexLog(a)
    let ln10: Double = Darwin.log(10.0)
    return (naturalLog.0 / ln10, naturalLog.1 / ln10)
}

/// Base 10 logarithm of a complex array.
public func log10(_ x: ComplexDoubleArray) -> ComplexDoubleArray {
    var r = RealDoubleArray(repeating: 0, count: x.0.count)
    var i = RealDoubleArray(repeating: 0, count: x.1.count)
    for k in 0 ..< x.0.count {
        (r[k], i[k]) = log10( (x.0[k], x.1[k]) )
    }
    return (r, i)
}

// MARK: Float

/// Base 10 logarithm of a real  array.
public func log10(_ x: RealFloatArray) -> RealFloatArray {
    return vForce.log10(x)
}

/// Base 10 logarithm of a complex number.
public func log10(_ a: ComplexFloat) -> ComplexFloat {
    let naturalLog = complexLog(a)
    let ln10: Float = Darwin.log(10.0)
    return (naturalLog.0 / ln10, naturalLog.1 / ln10)
}

/// Base 10 logarithm of a complex array.
public func log10(_ x: ComplexFloatArray) -> ComplexFloatArray {
    var r = RealFloatArray(repeating: 0, count: x.0.count)
    var i = RealFloatArray(repeating: 0, count: x.1.count)
    for k in 0 ..< x.0.count {
        (r[k], i[k]) = log10(ComplexFloat(x.0[k], x.1[k]))
    }
    return (r, i)
}

