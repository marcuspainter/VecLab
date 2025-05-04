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
public func length(_ x: RealArray) -> Int {
    return x.count
}

/// Length of a complex array.
/// - Parameter x: Complex array.
/// - Returns: The length of the array.
public func length(_ x: ComplexArray) -> Int {
    validateSize(x)
    return x.count
}
