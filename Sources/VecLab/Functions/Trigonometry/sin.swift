//
//  sin.swift
//  
//
//  Created by Marcus Painter on 09/09/2023.
//

import Foundation
import Accelerate

// VECTORIZED

/// Sine  of array in radians.
/// - Parameter x: Angle in radians.
/// - Returns: The sine of the angles.
public func sin(_ x: RealArray) -> RealArray {
    return vForce.sin(x)
}

/// Sine of complex number in radians.
/// - Parameter x: Angle in radians.
/// - Returns: The sine of the angles.
public func sin(_ x: Complex) -> Complex {
    return Complex(sin(x.0) * cosh(x.1), cos(x.0) * sinh(x.1))
}

/// Sine of complex array in radians.
/// - Parameter x: Angle in radians.
/// - Returns: The sine of the angles.
public func sin(_ x: ComplexArray) -> ComplexArray {
    var r = RealArray(repeating: 0, count: x.0.count)
    var i = RealArray(repeating: 0, count: x.1.count)
    let coshx = vForce.cosh(x.1)
    let sinhx = vForce.sinh(x.1)
    r = vForce.sin(x.0)
    i = vForce.cos(x.0)
    r = vDSP.multiply(r, coshx) // sinx0 * coshx1
    i = vDSP.multiply(i, sinhx) // cosx0 * sinhx1
    return (r, i)
}
