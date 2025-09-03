//
//  sin.swift
//
//
//  Created by Marcus Painter on 09/09/2023.
//

import Accelerate

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
    let coshx = vForce.cosh(x.imag)
    let sinhx = vForce.sinh(x.imag)
    let sinx = vForce.sin(x.real)
    let cosx = vForce.cos(x.real)
    let real = vDSP.multiply(sinx, coshx)  // sinx0 * coshx1
    let imag = vDSP.multiply(cosx, sinhx)  // cosx0 * sinhx1
    return ComplexArray(real, imag)
}
