//
//  acos.swift
//  
//
//  Created by Marcus Painter on 09/09/2023.
//

import Foundation
import Accelerate

// NO COMPLEX

/// Inverse cosine of array.
/// - Parameter x:Cosine of angle.
/// - Returns: Inverse cosine of x in the interval [0, π].
public func acos(_ x: RealDoubleArray) -> RealDoubleArray {
    return vForce.acos(x)
}

// MARK: Float

/// Inverse cosine of array.
/// - Parameter x:Cosine of angle.
/// - Returns: Inverse cosine of x in the interval [0, π].
public func acos(_ x: RealFloatArray) -> RealFloatArray {
    return vForce.acos(x)
}

