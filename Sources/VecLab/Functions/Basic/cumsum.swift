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
public func cumsum(_ x: RealDoubleArray) -> RealDoubleArray {
    var result = x
    var sum = Double(0)
    for k in 0 ..< x.count {
        sum += x[k]
        result[k] = sum
    }
    return result
}

/// Cumulative sum of complex array.
/// - Parameter x: Complex array.
/// - Returns: The cumulative sum of the array.
public func cumsum(_ x: ComplexDoubleArray) -> ComplexDoubleArray {
    var c = x
    var sum = (Double(0.0), Double(0.0))
    for k in 0 ..< x.0.count {
        sum.0 += x.0[k]
        sum.1 += x.1[k]
        c.0[k] = sum.0
        c.1[k] = sum.1
    }
    return c
}

// MARK: Float

/// Cumulative sum of array.
/// - Parameter x: Input array.
/// - Returns: The cumulative sum of the array.
public func cumsum(_ x: RealFloatArray) -> RealFloatArray {
    var result = x
    var sum = RealFloat(0)
    for k in 0 ..< x.count {
        sum += x[k]
        result[k] = sum
    }
    return result
}

/// Cumulative sum of complex array.
/// - Parameter x: Complex array.
/// - Returns: The cumulative sum of the array.
public func cumsum(_ x: ComplexFloatArray) -> ComplexFloatArray {
    var c = x
    var sum = (Float(0), Float(0))
    for k in 0 ..< x.0.count {
        sum.0 += x.0[k]
        sum.1 += x.1[k]
        c.0[k] = sum.0
        c.1[k] = sum.1
    }
    return c
}

