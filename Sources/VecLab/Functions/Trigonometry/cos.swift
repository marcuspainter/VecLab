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
    var r = RealArray(repeating: 0, count: x.0.count)
    var i = RealArray(repeating: 0, count: x.1.count)
    let coshx = vForce.cosh(x.1)
    let sinhx = vForce.sinh(x.1)
    r = vForce.cos(x.0)
    i = vForce.sin(x.0)
    i = vDSP.negative(i)
    r = vDSP.multiply(r, coshx) //  cosx0 * coshx1
    i = vDSP.multiply(i, sinhx) // -sinx0 * sinhx1
    return (r, i)
}
