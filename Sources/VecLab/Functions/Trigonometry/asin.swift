//
//  asin.swift
//  
//
//  Created by Marcus Painter on 09/09/2023.
//

import Foundation
import Accelerate

/// Inverse sine of real array.
/// - Parameter x:Sine of angle.
/// - Returns: Inverse sin of x in the interval [0, π].
public func asin(_ x: RealArray) -> RealArray {
    return vForce.asin(x)
}

/// Inverse sine of complex number..
/// - Parameter x: Sine of angle.
/// - Returns: Inverse sin of x in the interval [0, π].
public func asin(_ x: Complex) -> Complex {
    // Matlab: -1i * log( 1i * z + sqrt(1 - z^2))
    return -Real.i * log(Real.i * x + sqrt(1.0 - x * x))
}

/// Inverse sine of complex array.
/// - Parameter x: Sine of angles.
/// - Returns: Inverse sin of x in the interval [0, π].
public func asin(_ x: ComplexArray) -> ComplexArray {
    return -Real.i * log(Real.i * x + sqrt(1.0 - x * x))
    // return iterate(x) { asin($0) }
}
