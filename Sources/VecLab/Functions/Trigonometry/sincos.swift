//
//  sincos.swift
//  VecLab
//
//  Created by Marcus Painter on 16/11/2024.
//

import Accelerate
import Foundation

/// Sine and  cosine of array in radians.
/// - Parameter x: Angles in radians.
/// - Returns: sin(x) and cos(x) as array tuple
public func sincos(_ x: RealArray) -> (RealArray, RealArray) {
    return sincosArray(x)
}

public func sincos(_ x: Real) -> (Real, Real) {
    return (Darwin.sin(x), Darwin.cos(x))
}

private func sincosArray(_ x: [Double]) -> ([Double], [Double]) {
    var angles = x
    // Copy initialization
    var cosines = angles
    var sines = angles
    var n = Int32(x.count)
    vvsincos(&sines, &cosines, &angles, &n)
    return (sines, cosines)
}

private func sincosArray(_ x: [Float]) -> ([Float], [Float]) {
    var angles = x
    // Copy initialization
    var cosines = angles
    var sines = angles
    var n = Int32(x.count)
    vvsincosf(&sines, &cosines, &angles, &n)
    return (sines, cosines)
}
