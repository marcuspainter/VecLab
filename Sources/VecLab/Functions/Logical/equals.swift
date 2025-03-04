//
//  equals.swift
//  VecLab
//
//  Created by Marcus Painter on 23/02/2025.
//

/// Tests for equality.
/// - Parameters:
///   - a: Real array.
///   - b: Real array.
/// - Returns: true or false.
public func == (a: RealArray, b: RealArray) -> Bool {
    assertSameSize(a, b)
    return zip(a, b).allSatisfy { $0 == $1 }
}

/// Tests for equality.
/// - Parameters:
///   - a: Complex array.
///   - b: Complex array.
/// - Returns: true or false.
public func == (a: ComplexArray, b: ComplexArray) -> Bool {
    assertSameSize(a, b)
    return zip(a.0, b.1).allSatisfy { $0 == $1 }
}
