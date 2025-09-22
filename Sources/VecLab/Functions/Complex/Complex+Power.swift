//
//  Complex+Power.swift
//  VecLab
//
//  Created by Marcus Painter on 22/09/2025.
//

import Foundation

/// Power.
/// - Parameters:
///   - a: Complex number.
///   - b: Integer.
/// - Returns: Raises `a` to the power of `b`.
public func pow(_ a: Complex, _ b: Int) -> Complex {
    return pow(a, Real(b))
}

// MARK: Complex

/// Power.
/// - Parameters:
///   - a: Complex number.
///   - b: Real number.
/// - Returns: Raises `a` to the power of `b`.
public func pow(_ a: Complex, _ b: Real) -> Complex {
    return complexComplexRealPow(a, b)
}

/// Power.
/// - Parameters:
///   - a: Real number.
///   - b: Complex number.
/// - Returns: Raises `a` to the power of `b`
public func pow(_ a: Real, _ b: Complex) -> Complex {
    return complexRealComplexPow(a, b)
}

// Power.
/// - Parameters:
///   - base: Complex number.
///   - exponent: Complex number.
/// - Returns: Raises `a` to the power of `b
public func pow(_ base: Complex, _ exponent: Complex) -> Complex {
    let (a, b) = (base.real, base.imag)
    let (c, d) = (exponent.real, exponent.imag)

    // Convert base to polar form
    let r = Darwin.hypot(a, b)
    let theta = atan2(b, a)

    // Compute power using exponentiation formula:
    // (r e^(iθ))^(c + di) = r^c * e^(-dθ) * e^(i(d ln r + cθ))
    let newR = pow(r, c) * exp(-d * theta)
    let newTheta = d * log(r) + c * theta

    return Complex(newR * cos(newTheta), newR * sin(newTheta))
}
