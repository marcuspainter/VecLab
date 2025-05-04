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
public func angle(_ x: Complex) -> Real {
    return atan2(x.imag, x.real)
}

/// Phase angles of a complex array.
/// - Parameter x:Complex array.
/// - Returns: The phase angles in radians.
public func angle(_ x: ComplexArray) -> RealArray {
    validateSize(x)
    return vectorAngleComplexArray(x)
}
