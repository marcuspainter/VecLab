//
//  File.swift
//  
//
//  Created by Marcus Painter on 05/09/2024.
//

import Foundation

/// Normally distributed random numbers.
/// - Returns: A random number from the standard normal distribution.
public func randn() -> RealDouble {
    return GlobalRNG.shared.randn()
}

/// Normally distributed random numbers as an array.
/// - Parameter count: The number of elements in the array.
/// - Returns: A random array from the standard normal distribution.
public func randn(count: Int) -> RealDoubleArray {
    return GlobalRNG.shared.randn(count: count)
}

