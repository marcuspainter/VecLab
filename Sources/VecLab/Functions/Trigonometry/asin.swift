//
//  asin.swift
//  
//
//  Created by Marcus Painter on 09/09/2023.
//

import Foundation
import Accelerate

// NO COMPLEX

/// Inverse sine of array.
/// - Parameter x:Sine of angle.
/// - Returns: Inverse sin of x in the interval [0, π].
public func asin(_ x: RealDoubleArray) -> RealDoubleArray {
    return vForce.asin(x)
}

/// Inverse sine of array.
/// - Parameter x:Sine of angle.
/// - Returns: Inverse sin of x in the interval [0, π].
public func asin(_ x: RealFloatArray) -> RealFloatArray {
    return vForce.asin(x)
}

