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
public func wrap(_ angle: Real) -> Real {
    if angle < -.pi || angle > .pi {
        return wrapTo2Pi(angle + .pi) - .pi
    }
    return angle
}

/// Wrap angles in radians to [−pi pi].
/// - Parameter angle: Angles in radians.
/// - Returns: Wrapped angles.
public func wrap(_ angle: RealArray) -> RealArray {
    return angle.map { wrap($0) }
}

private func wrapTo2Pi(_ angle: Real) -> Real {
    let isPositive = (angle > 0)
    var result = mod(angle, 2.0 * .pi)
    if result == 0 && isPositive {
        result = 2.0 * .pi
    }
    return result
}

/*
 private func truncatingRemainder(_ a: Real, _ b: Real) -> Real {
     guard b != 0 else { fatalError("Division by zero") }

     let quotient = a / b
     let floorQuotient = floor(quotient)
     let remainder = a - b * floorQuotient

     return remainder
 }
 */
