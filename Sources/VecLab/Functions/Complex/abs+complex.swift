//
//  abs+complex.swift
//
//
//  Created by Marcus Painter on 09/09/2023.
//

import Foundation
import Accelerate

/// Magnitude  of a complex number.
///
/// - Parameter x:Complex number.
/// - Returns: Real value of  magnitudes.
@inlinable
public func abs(_ x: Complex) -> Real {
    return sqrt(x.real * x.real + x.imag * x.imag)
}

/// Magnitudes  of a complex array.
///
/// - Parameter x:Complex array.
/// - Returns: Real array of  magnitudes.
public func abs(_ x: ComplexArray) -> RealArray {
    validateSize(x)
    return vectorAbsComplexArray(x)
}
