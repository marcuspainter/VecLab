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
    assertSameSize(x)
    var c = complex(sized: x)
    var sum = complex()
    for k in 0 ..< x.0.count {
        sum.0 += x.0[k]
        sum.1 += x.1[k]
        c.0[k] = sum.0
        c.1[k] = sum.1
    }
    return c
}
