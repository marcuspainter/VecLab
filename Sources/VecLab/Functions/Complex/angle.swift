//
//  angle.swift
//
//
//  Created by Marcus Painter on 09/09/2023.
//

import Accelerate
import Foundation

// VECTORIZED

/// Phase angle of a complex number.
/// - Parameter x:Complex number.
/// - Returns: The phase angle in radians.
public func angle(_ x: ComplexDouble) -> RealDouble {
    return atan2(x.1, x.0)
}

/// Phase angles of a complex array.
/// - Parameter x:Complex array.
/// - Returns: The phase angles in radians.
public func angle(_ x: ComplexDoubleArray) -> RealDoubleArray {
    return vectorAngleComplexArray(x)
}

// MARK: Float

/// Phase angle of a complex number.
/// - Parameter x:Complex number.
/// - Returns: The phase angle in radians.
public func angle(_ x: ComplexFloat) -> RealFloat {
    return atan2(x.1, x.0)
}

/// Phase angles of a complex array.
/// - Parameter x:Complex array.
/// - Returns: The phase angles in radians.
public func angle(_ x: ComplexFloatArray) -> RealFloatArray {
    return vectorAngleComplexArray(x)
}

