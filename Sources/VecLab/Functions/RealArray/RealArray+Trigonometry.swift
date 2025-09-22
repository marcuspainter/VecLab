//
//  Real+Trigonometry.swift
//  VecLab
//
//  Created by Marcus Painter on 21/09/2025.
//

import Accelerate

/// Sine  of array in radians.
/// - Parameter x: Angle in radians.
/// - Returns: The sine of the angles.
public func sin(_ x: RealArray) -> RealArray {
    return vForce.sin(x)
}

/// Cosine of array in radians.
/// - Parameter x: Angle in radians.
/// - Returns: The cosine of the angles.
public func cos(_ x: RealArray) -> RealArray {
    return vForce.cos(x)
}

/// Tangent of array in radians.
/// - Parameter x: Angle in radians.
/// - Returns: The tangent of the angles.
public func tan(_ x: RealArray) -> RealArray {
    return vForce.tan(x)
}

/// Inverse sine of real array.
/// - Parameter x:Sine of angle.
/// - Returns: Inverse sin of x in the interval [0, π].
public func asin(_ x: RealArray) -> RealArray {
    return vForce.asin(x)
}

/// Inverse cosine of array.
/// - Parameter x:Cosine of angle.
/// - Returns: Inverse cosine of x in the interval [0, π].
public func acos(_ x: RealArray) -> RealArray {
    return vForce.acos(x)
}

/// Inverse tangent of array.
/// - Parameter x:Tangent of angle.
/// - Returns: Inverse tangent of x in the interval  [-π/2, π/2].
public func atan(_ x: RealArray) -> RealArray {
    return vForce.atan(x)
}

/// Four-quadrant inverse tangent  of two arrays.
/// - Parameters:
///   - x: x-coordinate.
///   - y: y-coordinate.
/// - Returns: The four quadrant inverse tangent in the closed interval of  [–π, π].
public func atan2(_ x: RealArray, _ y: RealArray) -> RealArray {
    validateSize(x, y)
    return vForce.atan2(x: y, y: x)
}

/// Sine and  cosine of array in radians.
/// - Parameter x: Angles in radians.
/// - Returns: sin(x) and cos(x) as array tuple
public func sincos(_ x: RealArray) -> (RealArray, RealArray) {
    var angles = x
    // Copy initialization
    var cosines = angles
    var sines = angles
    var n = Int32(x.count)
    vvsincos(&sines, &cosines, &angles, &n)
    return (sines, cosines)
}

/// Sine and  cosine in radians.
/// - Parameter x: Angle in radians.
/// - Returns: sin(x) and cos(x) as array tuple
public func sincos(_ x: Real) -> (Real, Real) {
    return (Darwin.sin(x), Darwin.cos(x))
}
