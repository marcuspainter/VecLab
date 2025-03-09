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
    return (cos(x.0) * cosh(x.1), -sin(x.0) * sinh(x.1))
}

/// Cosine of a complex array in radians.
/// - Parameter x: Angle in radians.
/// - Returns: The cosine of the angles.
public func cos(_ x: ComplexArray) -> ComplexArray {
    assertSameSize(x)
    var real = RealArray(repeating: 0, count: x.0.count)
    var imag = RealArray(repeating: 0, count: x.1.count)
    let coshx = vForce.cosh(x.1)
    let sinhx = vForce.sinh(x.1)
    real = vForce.cos(x.0)
    imag = vForce.sin(x.0)
    imag = vDSP.negative(imag)
    real = vDSP.multiply(real, coshx) //  cosx0 * coshx1
    imag = vDSP.multiply(imag, sinhx) // -sinx0 * sinhx1
    return (real, imag)
}
