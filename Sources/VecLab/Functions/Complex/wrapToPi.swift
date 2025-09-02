//
//  wrap.swift
//
//
//  Created by Marcus Painter on 09/09/2023.
//

import Foundation

/// Wrap angle in radians to [−pi pi].
/// - Parameter angle:Angle in radians.
/// - Returns : Wrapped angle.
public func wrapToPi(_ angle: Real) -> Real {
    if angle < -.pi || angle > .pi {
        return wrapTo2Pi(angle + .pi) - .pi
    }
    return angle
}

/// Wrap angles in radians to [−pi pi].
/// - Parameter angle: Angles in radians.
/// - Returns: Wrapped angles.
public func wrapToPi(_ angle: RealArray) -> RealArray {
    return angle.map { wrapToPi($0) }
}
