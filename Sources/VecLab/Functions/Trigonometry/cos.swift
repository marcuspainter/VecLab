//
//  cos.swift
//  
//
//  Created by Marcus Painter on 09/09/2023.
//

import Foundation
import Accelerate

// VECTORIZED

/// Cosine of array in radians.
/// - Parameter x: Angle in radians.
/// - Returns: The cosine of the angles.
public func cos(_ x: RealArray) -> RealArray {
    // return x.map { cos($0) }
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
    var real = RealArray(repeating: 0, count: x.count)
    var imag = RealArray(repeating: 0, count: x.count)
    let coshx = vForce.cosh(x.imag)
    let sinhx = vForce.sinh(x.imag)
    real = vForce.cos(x.real)
    imag = vForce.sin(x.real)
    imag = vDSP.negative(imag)
    real = vDSP.multiply(real, coshx) //  cosx0 * coshx1
    imag = vDSP.multiply(imag, sinhx) // -sinx0 * sinhx1
    return ComplexArray(real, imag)
}
