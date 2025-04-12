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
    return Complex(sin(x.real) * cosh(x.imag), cos(x.real) * sinh(x.imag))
}

/// Sine of complex array in radians.
/// - Parameter x: Angle in radians.
/// - Returns: The sine of the angles.
public func sin(_ x: ComplexArray) -> ComplexArray {
    assertSameSize(x)
    var real = RealArray(repeating: 0, count: x.count)
    var imag = RealArray(repeating: 0, count: x.count)
    let coshx = vForce.cosh(x.imag)
    let sinhx = vForce.sinh(x.imag)
    real = vForce.sin(x.real)
    imag = vForce.cos(x.real)
    real = vDSP.multiply(real, coshx) // sinx0 * coshx1
    imag = vDSP.multiply(imag, sinhx) // cosx0 * sinhx1
    return ComplexArray(real, imag)
}
