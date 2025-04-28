//
//  tan.swift
//
//
//  Created by Marcus Painter on 09/09/2023.
//

import Accelerate
import Foundation

// VECTORIZED

/// Tangent of array in radians.
/// - Parameter x: Angle in radians.
/// - Returns: The tangent of the angles.
public func tan(_ x: RealArray) -> RealArray {
    return vForce.tan(x)
}

/// Tangent of complex number in radians.
/// - Parameter x: Angle in radians.
/// - Returns: The tangent of the angles.
public func tan(_ x: Complex) -> Complex {
    let twoX = 2.0 * x.real
    let twoY = 2.0 * x.imag
    let denominator = cos(twoX) + cosh(twoY)
    let real = sin(twoX) / denominator
    let imag = sinh(twoY) / denominator
    return Complex(real, imag)
}

/// Tangent of complex array in radians.
/// - Parameter x: Angle in radians.
/// - Returns: The tangent of the angles.
public func tan(_ x: ComplexArray) -> ComplexArray {
    validateSize(x)
    // Compute 2x and 2y
    let twoX = vDSP.multiply(2.0, x.real)
    let twoY = vDSP.multiply(2.0, x.imag)

    // Compute cos(2x) and cosh(2y)
    let cosTwoX = vForce.cos(twoX)
    let coshTwoY = vForce.cosh(twoY)

    // Compute sin(2x) and sinh(2y)
    let sinTwoX = vForce.sin(twoX)
    let sinhTwoY = vForce.sinh(twoY)

    // Compute denominator = cos(2x) + cosh(2y)
    let denominator = vDSP.add(cosTwoX, coshTwoY)

    // Compute the real and imaginary parts of tan
    let real = vDSP.divide(sinTwoX, denominator)
    let imag = vDSP.divide(sinhTwoY, denominator)

    return ComplexArray(real, imag)
}
