//
//  notequals.swift
//  VecLab
//
//  Created by Marcus Painter on 23/02/2025.
//

/// Tests for inequality.
/// - Parameters:
///   - a: Real array.
///   - b: Real array.
/// - Returns: true or false.
public func != (a: RealArray, b: RealArray) -> Bool {
    assertSameSize(a, b)
    return !(a == b) // Overloaded ==
}

/// Tests for inequality.
/// - Parameters:
///   - a: Complex array.
///   - b: Complex array.
/// - Returns: true or false.
public func != (a: ComplexArray, b: ComplexArray) -> Bool {
    assertSameSize(a, b)
    return !(a == b) // Overloaded ==
}
