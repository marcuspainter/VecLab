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
public func imag(_ a: ComplexDouble) -> RealDouble {
    return a.1
}

/// Imaginary parts of a complex array.
/// - Parameter a: Complex array.
/// - Returns: A real array of imaginary part of a complex array.
public func imag(_ a: ComplexDoubleArray) -> RealDoubleArray {
    return a.1
}

// MARK: Float

/// Imaginary part of a complex number.
/// - Parameter a: Complex number.
/// - Returns: The imaginary part of a complex number as a real number.
public func imag(_ a: ComplexFloat) -> RealFloat {
    return a.1
}

/// Imaginary parts of a complex array.
/// - Parameter a: Complex array.
/// - Returns: A real array of imaginary part of a complex array.
public func imag(_ a: ComplexFloatArray) -> RealFloatArray {
    return a.1
}

