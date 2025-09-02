//
//  sincos.swift
//  VecLab
//
//  Created by Marcus Painter on 16/11/2024.
//

import Accelerate

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
