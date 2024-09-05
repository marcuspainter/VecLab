//
//  onesf.swift
//  
//
//  Created by Marcus Painter on 05/09/2024.
//

import Foundation

/// Create an array of ones.
/// - Parameter count: Number of elements in the array.
/// - Returns: A real array of length `count`.
public func onesf(_ count: Int) -> RealFloatArray {
    return RealFloatArray(repeating: 1.0, count: count)
}

/// Create an array of ones.
/// - Parameter count: Number of elements in the array.
/// - Returns: A real array of length `count`.
public func onesf(_ count: RealFloat) -> RealFloatArray {
    return RealFloatArray(repeating: 1.0, count: Int(count))
}

