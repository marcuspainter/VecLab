//
//  exp2.swift
//  VecLab
//
//  Created by Marcus Painter on 16/11/2024.
//
import Foundation
import Accelerate

/// Returns a complex array from angles by Euler
/// - Parameter x: Angles in radians
/// - Returns: Complex array of (cos(x),  sin(x)) equivalent to exp(i \* x) by Euler's formula.
public func exp2(x: RealArray) -> ComplexArray {
    var angles = x
    // Copy initialization
    var cosines = angles
    var sines = angles
    var n = Int32(x.count)
    vvsincos(&sines, &cosines, &angles, &n)

    return (cosines, sines)
}

/// Returns a complex number from angle by Euler
/// - Parameter x: Angle in radians
/// - Returns: Complex number of (cos(x),  sin(x)) equivalent to exp(i \* x) by Euler's formula.
public func exp2(x: Real) -> Complex {
    return (Darwin.cos(x), Darwin.sin(x))
}
