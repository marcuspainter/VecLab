//
//  cumsum.swift
//
//
//  Created by Marcus Painter on 09/09/2023.
//

import Foundation

// NOT VECTORIZED

/// Cumulative sum of array.
/// - Parameter x: Input array.
/// - Returns: The cumulative sum of the array.
public func cumsum(_ x: RealArray) -> RealArray {
    var result = RealArray(repeating: 0, count: x.count)
    var sum = Real(0)
    for k in 0 ..< x.count {
        sum += x[k]
        result[k] = sum
    }
    return result
}

/// Cumulative sum of complex array.
/// - Parameter x: Complex array.
/// - Returns: The cumulative sum of the array.
public func cumsum(_ x: ComplexArray) -> ComplexArray {
    validateSize(x)
    var c = x
    var sum = Complex()
    for k in 0 ..< x.count {
        sum = sum + x[k]
        c[k] = sum
    }
    return c
}
