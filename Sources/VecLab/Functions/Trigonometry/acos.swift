//
//  acos.swift
//  
//
//  Created by Marcus Painter on 09/09/2023.
//

import Foundation
import Accelerate

/// Inverse cosine of array.
/// - Parameter x:Cosine of angle.
/// - Returns: Inverse cosine of x in the interval [0, π].
public func acos(_ x: RealArray) -> RealArray {
    return vForce.acos(x)
}

/// Inverse cosine of complex number..
/// - Parameter x: Sine of angle.
/// - Returns: Inverse cosine of x in the interval [0, π].
public func acos(_ x: Complex) -> Complex {
    // Matlab: -1i * log( z + 1i * sqrt(1 - z^2))
    return -Real.i * log(x + Real.i * sqrt(1.0 - x * x))
}

/// Inverse sine of complex array.
/// - Parameter x: Cosine of angles.
/// - Returns: Inverse cossin of x in the interval [0, π].
public func acos(_ x: ComplexArray) -> ComplexArray {
    validateSize(x)
    let xx = x
    return -Real.i * log(xx + Real.i * sqrt(1.0 - xx * xx))
}
