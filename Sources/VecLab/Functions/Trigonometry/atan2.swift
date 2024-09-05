//
//  atan2.swift
//  
//
//  Created by Marcus Painter on 09/09/2023.
//

import Foundation
import Accelerate

// NO COMPLEX

/// Four-quadrant inverse tangent  of two arrays.
/// - Parameters:
///   - x: x-coordinate.
///   - y: y-coordinate.
/// - Returns: The four quadrant inverse tangent in the closed interval of  [–π, π].
public func atan2(_ x: RealDoubleArray, _ y: RealDoubleArray) -> RealDoubleArray {
    // return zip(x, y).map { atan2($0, $1) }
    assertSameSize(x, y)
    return vForce.atan2(x: y, y: x)
}

/// Four-quadrant inverse tangent  of two arrays.
/// - Parameters:
///   - x: x-coordinate.
///   - y: y-coordinate.
/// - Returns: The four quadrant inverse tangent in the closed interval of  [–π, π].
public func atan2(_ x: RealFloatArray, _ y: RealFloatArray) -> RealFloatArray {
    // return zip(x, y).map { atan2($0, $1) }
    assertSameSize(x, y)
    return vForce.atan2(x: y, y: x)
}
