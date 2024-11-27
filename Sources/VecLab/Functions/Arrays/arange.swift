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
    let count = Int(ceil((stop - start) / step))
    var result = [Real](repeating: 0.0, count: count)

    var value = start
    for i in 0..<count {
        result[i] = value
        value += step
    }

    return result
}

/// Return evenly spaced values within a given interval.
/// - Parameters:
///   - start: Integer value.
///   - stop: Integer value.
///   - step: Integer value.
/// - Returns: The array.
public func arange(_ start: Int, _ stop: Int, _ step: Int = 1) -> [Int] {
    guard step != 0 else {
        fatalError("Step cannot be zero.")
    }

    // Calculate the number of elements
    let length = max(0, (stop - start + (step > 0 ? step - 1 : step + 1)) / step)

    var result = [Int](repeating: 0, count: length)
    var current = start

    for i in 0..<length {
        result[i] = current
        current += step
    }

    return result
}

// Case 1: Only 'stop' is provided, defaults are start = 0.0, step = 1.0
// Case 2: 'start' and 'stop' are provided, default is step = 1.0
// Case 3: 'start', 'stop', and 'step' are all provided
