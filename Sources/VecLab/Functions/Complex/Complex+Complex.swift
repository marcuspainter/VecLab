//
//  Complex+Complex.swift
//  VecLab
//
//  Created by Marcus Painter on 21/09/2025.
//

import Foundation

/// Magnitude  of a complex number.
///
/// - Parameter x:Complex number.
/// - Returns: Real value of  magnitudes.
@inlinable
public func abs(_ x: Complex) -> Real {
    return Darwin.hypot(x.real, x.imag)
}

/// Phase angle of a complex number.
/// - Parameter x:Complex number.
/// - Returns: The phase angle in radians.
public func angle(_ x: Complex) -> Real {
    return atan2(x.imag, x.real)
}

/// Complex conjugate of a complex number.
/// - Parameter x: Complex number.
/// - Returns: The complex conjugate of `x`.
@inlinable
public func conj(_ x: Complex) -> Complex {
    return Complex(x.real, -x.imag)
}

/// Imaginary part of a complex number.
///
/// This function is retained for compatibility. Use the `imag` property.
/// - Parameter x: Complex number.
/// - Returns: The imaginary part of a complex number as a real number.
@inlinable
public func imag(_ x: Complex) -> Real {
    return x.imag
}

/// Real part of a complex number.
///
/// This function is retained for compatibility. Use the `real` property.
/// - Parameter x: Complex number.
/// - Returns: The real part.
@inlinable
public func real(_ x: Complex) -> Real {
    return x.real
}
