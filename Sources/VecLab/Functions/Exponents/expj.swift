//
//  expj.swift
//  VecLab
//
//  Created by Marcus Painter on 02/09/2025.
//

/// Returns a complex array from angles by Euler
/// - Parameter x: Angles in radians
/// - Returns: Complex array of (cos(x),  sin(x)) equivalent to exp(j \* x) by Euler's formula.
public func expj(_ x: RealArray) -> ComplexArray {
    return expi(x)
}

/// Returns a complex number from angle by Euler
/// - Parameter x: Angle in radians
/// - Returns: Complex number of (cos(x),  sin(x)) equivalent to exp(j\* x) by Euler's formula.
public func expj(_ x: Real) -> Complex {
    return expi(x)
}
