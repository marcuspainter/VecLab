//
//  sqrt.swift
//  
//
//  Created by Marcus Painter on 09/09/2023.
//

// https://github.com/dankogai/swift-complex/blob/master/Sources/Complex/Complex.swift

import Foundation
import Accelerate

// NOT VECTORIZED

/// Square root of a real array.
/// - Parameter x: Real array.
/// - Returns: The square roots.
public func sqrt(_ x: RealDoubleArray) -> RealDoubleArray {
    return vForce.sqrt(x)
}

/// Square root of a complex number.
/// - Parameter x: Complex number.
/// - Returns: The complex square root.
public func sqrt(_ x: ComplexDouble) -> ComplexDouble {
    return complexSqrt(x)
}

/// Square root of a complex array.
/// - Parameter x: Complex array.
/// - Returns: The complex square roots.
public func sqrt(_ x: ComplexDoubleArray) -> ComplexDoubleArray {
    var r = RealDoubleArray(repeating: 0, count: x.0.count)
    var i = RealDoubleArray(repeating: 0, count: x.1.count)
    for k in 0 ..< x.0.count {
        (r[k], i[k]) = sqrt(ComplexDouble(x.0[k], x.1[k]))
    }
    return (r, i)
}

// MARK: Float

/// Square root of a real array.
/// - Parameter x: Real array.
/// - Returns: The square roots.
public func sqrt(_ x: RealFloatArray) -> RealFloatArray {
    return vForce.sqrt(x)
}

/// Square root of a complex number.
/// - Parameter x: Complex number.
/// - Returns: The complex square root.
public func sqrt(_ x: ComplexFloat) -> ComplexFloat {
    return complexSqrt(x)
}

/// Square root of a complex array.
/// - Parameter x: Complex array.
/// - Returns: The complex square roots.
public func sqrt(_ x: ComplexFloatArray) -> ComplexFloatArray {
    var r = RealFloatArray(repeating: 0, count: x.0.count)
    var i = RealFloatArray(repeating: 0, count: x.1.count)
    for k in 0 ..< x.0.count {
        (r[k], i[k]) = sqrt(ComplexFloat(x.0[k], x.1[k]))
    }
    return (r, i)
}

