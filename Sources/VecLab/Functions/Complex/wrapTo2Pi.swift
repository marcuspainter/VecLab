//
//  wrapTo2Pi.swift
//  
//
//  Created by Marcus Painter on 04/04/2024.
//

import Foundation

/// Wrap angles in radians to [0 2pi].
/// - Parameter angle: Angles in radians.
/// - Returns: Wrapped angles.
public func wrapTo2Pi(_ angle: Real) -> Real {
    let isPositive = (angle > 0)
    var result = mod(angle, 2.0 * .pi)
    if result == 0 && isPositive {
        result = 2.0 * .pi
    }
    return result
}

/// Wrap angles in radians to [0 2pi].
/// - Parameter angle: Angles in radians.
/// - Returns: Wrapped angles.
public func wrapTo2Pi(_ angle: RealArray) -> RealArray {
    return angle.map { wrapTo2Pi($0) }
}
