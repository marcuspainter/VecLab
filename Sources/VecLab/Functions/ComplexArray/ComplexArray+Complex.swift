//
//  ComplexArray+Complex.swift
//  VecLab
//
//  Created by Marcus Painter on 21/09/2025.
//

/// Magnitudes  of a complex array.
///
/// - Parameter x:Complex array.
/// - Returns: Real array of  magnitudes.
public func abs(_ x: ComplexArray) -> RealArray {
    return x.map { abs($0) }
}

/// Phase angles of a complex array.
/// - Parameter x:Complex array.
/// - Returns: The phase angles in radians.
public func angle(_ x: ComplexArray) -> RealArray {
    return x.map { angle($0) }
}

/// Complex conjugates of a complex array.
/// - Parameter x: Complex array.
/// - Returns: The complex conjugate of `x`.
public func conj(_ x: ComplexArray) -> ComplexArray {
    return x.map { conj($0) }
}

/// Imaginary parts of a complex array.
///
/// This function is retained for compatibility. Use the `imag` property.
/// - Parameter x: Complex array.
/// - Returns: A real array of imaginary part of a complex array.
public func imag(_ x: ComplexArray) -> RealArray {
    return x.map { $0.imag }
}

/// Real parts of a complex array.
///
/// This function is retained for compatibility. Use the `real` property.
/// - Parameter x: Complex array.
/// - Returns: A real array of real part of a complex array.
public func real(_ x: ComplexArray) -> RealArray {
    return x.map { $0.real }
}
