//
//  Complex+Trigonometry.swift
//  VecLab
//
//  Created by Marcus Painter on 21/09/2025.
//

import Accelerate

/// Sine of complex number in radians.
/// - Parameter x: Angle in radians.
/// - Returns: The sine of the angles.
public func sin(_ x: Complex) -> Complex {
    return Complex(sin(x.real) * cosh(x.imag), cos(x.real) * sinh(x.imag))
}

/// Cosine of array in radians.
/// - Parameter x: Angle in radians.
/// - Returns: The cosine of the angles.
public func cos(_ x: Complex) -> Complex {
    return Complex(cos(x.real) * cosh(x.imag), -sin(x.real) * sinh(x.imag))
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

/// Inverse sine of complex number..
/// - Parameter x: Sine of angle.
/// - Returns: Inverse sin of x in the interval [0, π].
public func asin(_ x: Complex) -> Complex {
    // Matlab: -1i * log( 1i * z + sqrt(1 - z^2))
    return -Real.i * log(Real.i * x + sqrt(1.0 - x * x))
}

/// Inverse cosine of complex number..
/// - Parameter x: Sine of angle.
/// - Returns: Inverse cosine of x in the interval [0, π].
public func acos(_ x: Complex) -> Complex {
    // Matlab: -1i * log( z + 1i * sqrt(1 - z^2))
    return -Real.i * log(x + Real.i * sqrt(1.0 - x * x))
}

/// Inverse tangent of complex number.
/// - Parameter x:Tangent of angle.
/// - Returns: Inverse tangent of x in the interval  [-π/2, π/2].
public func atan(_ x: Complex) -> Complex {
    // Matlab: 1i/2 * log((1 - 1i * z) / (1 + 1i * z))
    return (Real.i * 0.5) * log((1 - Real.i * x) / (1 + Real.i * x))
}
