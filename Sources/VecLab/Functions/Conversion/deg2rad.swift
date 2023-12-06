//
//  deg2rad.swift
//
//
//  Created by Marcus Painter on 09/09/2023.
//

import Foundation
import Accelerate

// VECTORIZED

/// Convert angle from degrees to radians.
/// - Parameter deg: Angle in degrees.
/// - Returns: Angle in radians.
public func deg2rad(_ deg: Real) -> Real {
    return deg * (Real.pi / 180.0)
}

/// Convert angle from degrees to radians.
/// - Parameter deg: Angle in degrees.
/// - Returns: Angle in radians.
public func deg2rad(_ deg: RealArray) -> RealArray {
    // return deg.map { deg2rad($0) }
    let scale = (Real.pi / 180.0)
    return vDSP.multiply(scale, deg)
}
