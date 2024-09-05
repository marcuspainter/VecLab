//
//  real.swift
//
//
//  Created by Marcus Painter on 09/09/2023.
//

import Foundation

/// Real part of a complex number.
/// - Parameter a: Complex number.
/// - Returns: The real part.
public func real(_ a: ComplexDouble) -> RealDouble {
    return a.0
}

/// Real parts of a complex array.
/// - Parameter a: Complex array.
/// - Returns: A real array of real part of a complex array.
public func real(_ a: ComplexDoubleArray) -> RealDoubleArray {
    return a.0
}

// MARK: Float

/// Real part of a complex number.
/// - Parameter a: Complex number.
/// - Returns: The real part.
public func real(_ a: ComplexFloat) -> RealFloat {
    return a.0
}

/// Real parts of a complex array.
/// - Parameter a: Complex array.
/// - Returns: A real array of real part of a complex array.
public func real(_ a: ComplexFloatArray) -> RealFloatArray {
    return a.0
}

