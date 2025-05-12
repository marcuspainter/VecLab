//
//  arange.swift
//  VecLab
//
//  Created by Marcus Painter on 23/08/2024.
//

import Foundation

/// Return evenly spaced values within a given interval.
/// - Parameter stop: Real value.
/// - Returns: The array.
public func arange(_ stop: Real) -> RealArray {
    return arange(0.0, stop, 1.0)
}

/// Return evenly spaced values within a given interval.
/// - Parameters:
///   - start: Real value.
///   - stop: Real value.
/// - Returns: The array.
public func arange(_ start: Real, _ stop: Real) -> RealArray {
    return arange(start, stop, 1.0)
}

/// Return evenly spaced values within a given interval.
/// - Parameters:
///   - start: Real value.
///   - stop: Real value.
///   - step: Real value.
/// - Returns: The array.
public func arange(_ start: Real, _ stop: Real, _ step: Real) -> RealArray {
    guard step != 0 else {
        fatalError("Step cannot be zero.")
    }

    if (step > 0 && start >= stop) || (step < 0 && start <= stop) {
        return []
    }

    let count = Int(ceil((stop - start) / step))
    var result = [Real](repeating: 0.0, count: count)

    for i in 0..<count {
        let value = start + (Real(i) * step)
        if (step > 0 && value >= stop) || (step < 0 && value <= stop) {
            return Array(result[0..<i])
        }
        result[i] = value
    }

    return result
}
