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
public func imag(_ a: Complex) -> Real {
    return a.1
}

/// Imaginary parts of a complex array.
/// - Parameter a: Complex array.
/// - Returns: A real array of imaginary part of a complex array.
public func imag(_ a: ComplexArray) -> RealArray {
    return a.1
}
