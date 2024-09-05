//
//  File.swift
//  
//
//  Created by Marcus Painter on 05/09/2024.
//

import Foundation

/// Uniformly distributed random numbers.
/// - Returns: A random number from the uniform distribution in the interval (0,1).
public func rand() -> RealDouble {
    return GlobalRNG.shared.rand()
}

/// Uniformly distributed random numbers as an array.
/// - Parameter count: The number of elements in the array.
/// - Returns: A random number from the uniform distribution in the interval (0,1).
public func rand(count: Int) -> RealDoubleArray {
    return GlobalRNG.shared.rand(count: count)
}
