//
//  zeros.swift
//
//
//  Created by Marcus Painter on 26/11/2023.
//

import Foundation

/// Create an array of zeros.
/// - Parameter count: Number of elements in the array.
/// - Returns: A real array of length `count`.
public func zeros(_ count: Int) -> RealArray {
    return RealArray(repeating: 0, count: count)
}
