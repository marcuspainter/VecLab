//
//  atan2.swift
//
//
//  Created by Marcus Painter on 09/09/2023.
//

import Accelerate
import Foundation

// NO COMPLEX

/// Four-quadrant inverse tangent  of two arrays.
/// - Parameters:
///   - x: x-coordinate.
///   - y: y-coordinate.
/// - Returns: The four quadrant inverse tangent in the closed interval of  [–π, π].
public func atan2(_ x: RealArray, _ y: RealArray) -> RealArray {
    validateSize(x, y)
    return vForce.atan2(x: y, y: x)
}
