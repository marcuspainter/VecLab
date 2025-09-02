//
//  cos.swift
//  
//
//  Created by Marcus Painter on 09/09/2023.
//

import Foundation
import Accelerate

/// Cosine of array in radians.
/// - Parameter x: Angle in radians.
/// - Returns: The cosine of the angles.
public func cos(_ x: RealArray) -> RealArray {
    return vForce.cos(x)
}

/// Cosine of array in radians.
/// - Parameter x: Angle in radians.
/// - Returns: The cosine of the angles.
public func cos(_ x: Complex) -> Complex {
    return Complex(cos(x.real) * cosh(x.imag), -sin(x.real) * sinh(x.imag))
}

/// Cosine of a complex array in radians.
/// - Parameter x: Angle in radians.
/// - Returns: The cosine of the angles.
public func cos(_ x: ComplexArray) -> ComplexArray {
    validateSize(x)
    let coshx = vForce.cosh(x.imag)
    let sinhx = vForce.sinh(x.imag)
    let cosx = vForce.cos(x.real)
    var sinx = vForce.sin(x.real)
    sinx = vDSP.negative(sinx)
    let real = vDSP.multiply(cosx, coshx) //  cosx0 * coshx1
    let imag = vDSP.multiply(sinx, sinhx) // -sinx0 * sinhx1
    return ComplexArray(real, imag)
}
