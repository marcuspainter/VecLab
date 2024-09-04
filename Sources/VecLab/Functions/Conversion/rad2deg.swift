//
//  rad2deg.swift
//  
//
//  Created by Marcus Painter on 09/09/2023.
//

import Foundation
import Accelerate

// VECTORIZED

/// Convert angle from radians to degrees.
/// - Parameter rad: Angle in radians.
/// - Returns: Angle in degrees.
public func rad2deg(_ rad: Real) -> Real {
    return rad * (180.0 / .pi)
}

/// Convert angle from radians to degrees for an array.
/// - Parameter rad: Angles in radians.
/// - Returns: Angles in degrees.
public func rad2deg(_ rad: RealArray) -> RealArray {
    let scale = Real(180.0 / .pi)
    return vDSP.multiply(scale, rad)
}
