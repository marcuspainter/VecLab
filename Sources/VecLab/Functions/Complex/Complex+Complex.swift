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
