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
/// - Parameter a: Real number.
/// - Returns: The base 2 logarithm of `x`.
public func log2(_ x: RealDoubleArray) -> RealDoubleArray {
    // return x.map { log2($0) }
    return vForce.log2(x)
}

/// Base 2 logarithm of a complex number.
/// - Parameter a: Complex number.
/// - Returns: The base 2 logarithm of `x`.
public func log2(_ a: ComplexDouble) -> ComplexDouble {
    let naturalLog = complexLog(a)
    let ln2: RealDouble = Darwin.log(2.0)
    return (naturalLog.0 / ln2, naturalLog.1 / ln2)
}

/// Base 2 logarithm of a complex array.
/// - Returns: The base 2 logarithm of `x`.
/// - Parameter a: Complex array.
/// - Returns: The base 2 logarithm of `x`.
public func log2(_ x: ComplexDoubleArray) -> ComplexDoubleArray {
    var r = RealDoubleArray(repeating: 0, count: x.0.count)
    var i = RealDoubleArray(repeating: 0, count: x.1.count)
    for k in 0 ..< x.0.count {
        (r[k], i[k]) = log2( (x.0[k], x.1[k]) )
    }
    return (r, i)
}

// MARK: Float

/// Base 2 logarithm of a real array.
/// - Parameter a: Real number.
/// - Returns: The base 2 logarithm of `x`.
public func log2(_ x: RealFloatArray) -> RealFloatArray {
    return vForce.log2(x)
}

/// Base 2 logarithm of a complex number.
/// - Parameter a: Complex number.
/// - Returns: The base 2 logarithm of `x`.
public func log2(_ a: ComplexFloat) -> ComplexFloat {
    let naturalLog = complexLog(a)
    let ln2: RealFloat = Darwin.log(2.0)
    return (naturalLog.0 / ln2, naturalLog.1 / ln2)
}

/// Base 2 logarithm of a complex array.
/// - Returns: The base 2 logarithm of `x`.
/// - Parameter a: Complex array.
/// - Returns: The base 2 logarithm of `x`.
public func log2(_ x: ComplexFloatArray) -> ComplexFloatArray {
    var r = RealFloatArray(repeating: 0, count: x.0.count)
    var i = RealFloatArray(repeating: 0, count: x.1.count)
    for k in 0 ..< x.0.count {
        (r[k], i[k]) = log2(ComplexFloat(x.0[k], x.1[k]))
    }
    return (r, i)
}

