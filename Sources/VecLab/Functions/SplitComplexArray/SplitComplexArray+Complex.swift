//
//  SplitComplexArray+Complex.swift
//  VecLab
//
//  Created by Marcus Painter on 21/09/2025.
//

import Accelerate

/// Magnitudes  of a complex array.
///
/// - Parameter x: Split Complex array.
/// - Returns: Real array of  magnitudes.
public func abs(_ x: SplitComplexArray) -> RealArray {
    validateSize(x)
    return vectorAbsSplitComplexArray(x)
}

/// Phase angles of a complex array.
/// - Parameter x:Complex array.
/// - Returns: The phase angles in radians.
public func angle(_ x: SplitComplexArray) -> RealArray {
    validateSize(x)
    return vectorAngleSplitComplexArray(x)
}

/// Complex conjugates of a complex array.
/// - Parameter x: Complex array.
/// - Returns: The complex conjugate of `x`.
public func conj(_ x: SplitComplexArray) -> SplitComplexArray {
    validateSize(x)
    let imag = vDSP.negative(x.imag)
    return SplitComplexArray(x.real, imag)
}

/// Imaginary parts of a complex array.
///
/// This function is retained for compatibility. Use the `imag` property.
/// - Parameter x: Complex array.
/// - Returns: A real array of imaginary part of a complex array.
public func imag(_ x: SplitComplexArray) -> RealArray {
    validateSize(x)
    return x.imag
}

/// Real parts of a complex array.
///
/// This function is retained for compatibility. Use the `real` property.
/// - Parameter x: Complex array.
/// - Returns: A real array of real part of a complex array.
public func real(_ x: SplitComplexArray) -> RealArray {
    validateSize(x)
    return x.real
}
