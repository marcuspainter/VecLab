//
//  File.swift
//  
//
//  Created by Marcus Painter on 05/09/2024.
//

import Foundation

/// Uniformly distributed random numbers.
/// - Returns: A random number from the uniform distribution in the interval (0,1).
public func randf() -> RealFloat {
    return Float(GlobalRNG.shared.rand())
}

/// Uniformly distributed random numbers.
/// - Returns: A random number from the uniform distribution in the interval (0,1).
func randf(count: Int) -> RealFloatArray {
    return (0..<count).map { _ in Float(rand()) }
}
