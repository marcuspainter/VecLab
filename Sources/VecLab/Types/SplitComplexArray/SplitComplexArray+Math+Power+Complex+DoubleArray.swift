//
//  SplitComplexArray+Math+Power+Complex+DoubleArray.swift
//  VecLab
//
//  Created by Marcus Painter on 22/09/2025.
//

/// Complex Power.
/// - Parameters:
///   - a: Complex number.
///   - b: Real array.
/// - Returns: Raises `a` to the power of `b`.
@inlinable
public func ** (_ a: Complex, _ b: [Double]) -> SplitComplexArray {
    return pow(a, b)
}

/// Complex Power.
/// - Parameters:
///   - a: Real array.
///   - b: Complex number.
/// - Returns: Raises `a` to the power of `b`.
@inlinable
public func ** (_ a: [Double], _ b: Complex) -> SplitComplexArray {
    return pow(a, b)
}
