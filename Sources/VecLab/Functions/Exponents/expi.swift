//
//  expi.swift
//  VecLab
//
//  Created by Marcus Painter on 16/11/2024.
//

import Accelerate

/// Returns a complex array from angles by Euler
/// - Parameter x: Angles in radians
/// - Returns: Complex array of (cos(x),  sin(x)) equivalent to exp(i \* x) by Euler's formula.
public func expi(_ x: RealArray) -> ComplexArray {
    var cosines = RealArray(repeating: 0.0, count: x.count)
    var sines = RealArray(repeating: 0.0, count: x.count)
    var n = Int32(x.count)
    vvsincos(&sines, &cosines, x, &n)
    return ComplexArray(cosines, sines)
}

/// Returns a complex number from angle by Euler
/// - Parameter x: Angle in radians
/// - Returns: Complex number of (cos(x),  sin(x)) equivalent to exp(i \* x) by Euler's formula.
public func expi(_ x: Real) -> Complex {
    return Complex(Darwin.cos(x), Darwin.sin(x))
}
