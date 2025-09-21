//
//  SplitComplexArray+Trigonometry.swift
//  VecLab
//
//  Created by Marcus Painter on 21/09/2025.
//

import Accelerate

/// Sine of complex array in radians.
/// - Parameter x: Angle in radians.
/// - Returns: The sine of the angles.
public func sin(_ x: SplitComplexArray) -> SplitComplexArray {
    let coshx = vForce.cosh(x.imag)
    let sinhx = vForce.sinh(x.imag)
    let sinx = vForce.sin(x.real)
    let cosx = vForce.cos(x.real)
    let real = vDSP.multiply(sinx, coshx)  // sinx0 * coshx1
    let imag = vDSP.multiply(cosx, sinhx)  // cosx0 * sinhx1
    return SplitComplexArray(real, imag)
}

/// Cosine of a complex array in radians.
/// - Parameter x: Angle in radians.
/// - Returns: The cosine of the angles.
public func cos(_ x: SplitComplexArray) -> SplitComplexArray {
    validateSize(x)
    let coshx = vForce.cosh(x.imag)
    let sinhx = vForce.sinh(x.imag)
    let cosx = vForce.cos(x.real)
    var sinx = vForce.sin(x.real)
    sinx = vDSP.negative(sinx)
    let real = vDSP.multiply(cosx, coshx)  //  cosx0 * coshx1
    let imag = vDSP.multiply(sinx, sinhx)  // -sinx0 * sinhx1
    return SplitComplexArray(real, imag)
}

/// Tangent of complex array in radians.
/// - Parameter x: Angle in radians.
/// - Returns: The tangent of the angles.
public func tan(_ x: SplitComplexArray) -> SplitComplexArray {
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

    return SplitComplexArray(real, imag)
}


/// Inverse sine of complex array.
/// - Parameter x: Sine of angles.
/// - Returns: Inverse sin of x in the interval [0, π].
public func asin(_ x: SplitComplexArray) -> SplitComplexArray {
    validateSize(x)
    return -Real.i * log(Real.i * x + sqrt(1.0 - x * x))
}


/// Inverse sine of complex array.
/// - Parameter x: Cosine of angles.
/// - Returns: Inverse cosine of x in the interval [0, π].
public func acos(_ x: SplitComplexArray) -> SplitComplexArray {
    validateSize(x)
    let xx = x
    return -Real.i * log(xx + Real.i * sqrt(1.0 - xx * xx))
}

/// Inverse tangent of complex array.
/// - Parameter x:Tangent of angle.
/// - Returns: Inverse tangent of x in the interval  [-π/2, π/2].
public func atan(_ x: SplitComplexArray) -> SplitComplexArray {
    validateSize(x)
    return (Real.i * 0.5) * log((1.0 - Real.i * x) / (1.0 + Real.i * x))
}
