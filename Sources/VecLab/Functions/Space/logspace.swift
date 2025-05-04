//
//  logspace.swift
//  
//
//  Created by Marcus Painter on 08/09/2023.
//

import Foundation

/// Generate logarithmically spaced vectors.
///
/// Returns `[]` if `n` is 0.
/// - Parameters:
///   - a: Start of interval.
///   - b: End of interval.
///   - n: Number of points.
/// - Returns:Returns an array of `n` logarithmically spaced points between decades `10^a` and `10^b`
public func logspace(_ a: Real, _ b: Real, _ n: Int = 50) -> RealArray {
    if n <= 1 {
        return []
    }

    let step = (b - a) / Real(n - 1)
    return (0 ..< n).map { pow(10, a + Real($0) * step) }
}
