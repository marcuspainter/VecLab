//
//  File.swift
//  
//
//  Created by Marcus Painter on 05/09/2024.
//

import Foundation

/// Normally distributed random numbers.
/// - Returns: A random number from the standard normal distribution.
public func randnf() -> RealFloat {
    return Float(randn())
}

/// Normally distributed random numbers as an array.
/// - Parameter count: The number of elements in the array.
/// - Returns: A random array from the standard normal distribution.
public func randnf(count: Int) -> RealFloatArray {
    return (0..<count).map { _ in Float(randn()) }
}
