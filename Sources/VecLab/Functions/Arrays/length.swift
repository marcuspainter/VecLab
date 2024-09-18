//
//  length.swift
//
//
//  Created by Marcus Painter on 09/09/2023.
//

import Foundation

/// Length of a real array.
/// - Parameter x: Real array.
/// - Returns: The length of the array.
@inlinable
public func length(_ x: RealArray) -> Int {
    return x.count
}

/// Length of a complex array.
/// - Parameter x: Complex array.
/// - Returns: The length of the array.
@inlinable
public func length(_ x: ComplexArray) -> Int {
    assert(x.0.count == x.1.count, "Complex array sizes do not match: r:\(x.0.count) i:\(x.1.count)")
    return x.0.count
}
