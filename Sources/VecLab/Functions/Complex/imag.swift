//
//  imag.swift
//
//
//  Created by Marcus Painter on 09/09/2023.
//

import Foundation

/// Imaginary part of a complex number.
/// - Parameter a: Complex number.
/// - Returns: The imaginary part of a complex number as a real number.
public func imag(_ x: Complex) -> Real {
    return x.1
}

/// Imaginary parts of a complex array.
/// - Parameter a: Complex array.
/// - Returns: A real array of imaginary part of a complex array.
public func imag(_ x: ComplexArray) -> RealArray {
    assertSameSize(x)
    return x.1
}
