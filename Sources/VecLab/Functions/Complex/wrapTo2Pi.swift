//
//  File.swift
//  
//
//  Created by Marcus Painter on 04/04/2024.
//

import Foundation

/// Wrap angles in radians to [0 2pi].
/// - Parameter angle: Angles in radians.
/// - Returns: Wrapped angles.
public func wrapTo2Pi(_ angle: RealDouble) -> RealDouble {
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
public func wrapTo2Pi(_ angle: RealDoubleArray) -> RealDoubleArray {
    return angle.map { wrapTo2Pi($0) }
}

// MARK: Float

/// Wrap angles in radians to [0 2pi].
/// - Parameter angle: Angles in radians.
/// - Returns: Wrapped angles.
public func wrapTo2Pi(_ angle: RealFloat) -> RealFloat {
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
public func wrapTo2Pi(_ angle: RealFloatArray) -> RealFloatArray {
    return angle.map { wrapTo2Pi($0) }
}

