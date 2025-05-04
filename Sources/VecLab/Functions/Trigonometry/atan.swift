//
//  atan.swift
//  
//
//  Created by Marcus Painter on 09/09/2023.
//

import Foundation
import Accelerate

// NO COMPLEX

/// Inverse tangent of array.
/// - Parameter x:Tangent of angle.
/// - Returns: Inverse tangent of x in the interval  [-π/2, π/2].
public func atan(_ x: RealArray) -> RealArray {
    return vForce.atan(x)
}

/// Inverse tangent of complex number.
/// - Parameter x:Tangent of angle.
/// - Returns: Inverse tangent of x in the interval  [-π/2, π/2].
public func atan(_ x: Complex) -> Complex {
    // Matlab: 1i/2 * log((1 - 1i * z) / (1 + 1i * z))
    return (Real.i * 0.5) * log( (1 - Real.i * x) / (1 + Real.i * x) )
}

/// Inverse tangent of complex array.
/// - Parameter x:Tangent of angle.
/// - Returns: Inverse tangent of x in the interval  [-π/2, π/2].
public func atan(_ x: ComplexArray) -> ComplexArray {
    validateSize(x)
    return (Real.i * 0.5) * log( (1.0 - Real.i * x) / (1.0 + Real.i * x) )
}
