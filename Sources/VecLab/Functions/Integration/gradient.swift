//
//  gradient.swift
//  
//
//  Created by Marcus Painter on 09/09/2023.
//

import Foundation

/// Numerical gradient.
/// - Parameter x: Input array.
/// - Returns: The numerical gradient.
public func gradient(_ x: RealArray) -> RealArray {
    guard !x.isEmpty else { return [] }

    var result = [Real](repeating: Real(0), count: x.count)

    // For the first element
    result[0] = x[1] - x[0]

    // For elements in between
    for i in 1..<x.count - 1 {
        result[i] = (x[i + 1] - x[i - 1]) * 0.5
    }

    // For the last element
    result[x.count - 1] = x[x.count - 1] - x[x.count - 2]

    return result
}
