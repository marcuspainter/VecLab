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
public func expeuler(_ x: RealArray) -> ComplexArray {
    return expeulerArray(x)
}

/// Returns a complex number from angle by Euler
/// - Parameter x: Angle in radians
/// - Returns: Complex number of (cos(x),  sin(x)) equivalent to exp(i \* x) by Euler's formula.
public func expeuler(_ x: Real) -> Complex {
    return (Darwin.cos(x), Darwin.sin(x))
}

private func expeulerArray(_ x: [Double]) -> ([Double], [Double]) {
    var angles = x
    // Copy initialization
    var cosines = angles
    var sines = angles
    var n = Int32(x.count)
    vvsincos(&sines, &cosines, &angles, &n)

    return (cosines, sines)
}

private func expeulerArray(_ x: [Float]) -> ([Float], [Float]) {
    var angles = x
    // Copy initialization
    var cosines = angles
    var sines = angles
    var n = Int32(x.count)
    vvsincosf(&sines, &cosines, &angles, &n)

    return (cosines, sines)
}