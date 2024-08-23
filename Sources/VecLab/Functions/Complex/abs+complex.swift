//
//  abs+complex.swift
//
//
//  Created by Marcus Painter on 09/09/2023.
//

import Foundation
import Accelerate

// VECTORIZED

/// Magnitude  of a complex number.
///
/// - Parameter x:Complex number.
/// - Returns: Real value of  magnitudes.
public func abs(_ x: Complex) -> Real {
    return sqrt(x.0 * x.0 + x.1 * x.1)
}

/// Magnitudes  of a complex array.
///
/// - Parameter x:Complex array.
/// - Returns: Real array of  magnitudes.
public func abs(_ x: ComplexArray) -> RealArray {
    // return zip(x.0, x.1).map { sqrt($0 * $0 + $1 * $1) }
    return vectorComplexAbs(x)
}
