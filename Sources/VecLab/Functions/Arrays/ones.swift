//
//  File.swift
//  
//
//  Created by Marcus Painter on 01/12/2023.
//

import Foundation

/// Create an array of ones.
/// - Parameter count: Number of elements in the array.
/// - Returns: A real array of length `count`.
public func ones(_ count: Int) -> RealArray {
    return RealArray(repeating: 1.0, count: count)
}
