//
//  imag.swift
//
//
//  Created by Marcus Painter on 09/09/2023.
//

import Foundation

/// Imaginary part of a complex number.
///
/// This function is retained for compatibility. Use the `imag` property.
/// - Parameter x: Complex number.
/// - Returns: The imaginary part of a complex number as a real number.
@inlinable
public func imag(_ x: Complex) -> Real {
    return x.imag
}

/// Imaginary parts of a complex array.
///
/// This function is retained for compatibility. Use the `imag` property.
/// - Parameter x: Complex array.
/// - Returns: A real array of imaginary part of a complex array.
public func imag(_ x: ComplexArray) -> RealArray {
    validateSize(x)
    return x.imag
}
