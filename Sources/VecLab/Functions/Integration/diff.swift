//
//  diff.swift
//
//
//  Created by Marcus Painter on 03/09/2023.
//

import Foundation

/// Differences and approximate derivatives.
///
/// - Note: The length of the returned array is (length - 1).
/// - Parameter x: Input array.
/// - Returns: Difference between elements as an array of (length - 1).
public func diff(_ x: RealArray) -> RealArray {
    guard x.count > 1 else { return [] }

    var result = RealArray(repeating: 0, count: x.count - 1)
    for i in 1 ..< x.count {
        result[i-1] = (x[i] - x[i - 1])
    }
    return result
}
