//
//  arangef.swift
//
//
//  Created by Marcus Painter on 05/09/2024.
//

import Foundation

/// Return evenly spaced values within a given interval.
/// - Parameter stop: Real value.
/// - Returns: The array.
public func arange(_ stop: RealFloat) -> RealFloatArray {
    return arangef(0.0, stop, 1.0)
}

/// Return evenly spaced values within a given interval.
/// - Parameters:
///   - start: Real value.
///   - stop: Real value.
/// - Returns: The array.
public func arangef(_ start: RealFloat, _ stop: RealFloat) -> RealFloatArray {
    return arangef(start, stop, 1.0)
}

/// Return evenly spaced values within a given interval.
/// - Parameters:
///   - start: Real value.
///   - stop: Real value.
///   - step: Real value.
/// - Returns: The array.
public func arangef(_ start: RealFloat, _ stop: RealFloat, _ step: RealFloat) -> RealFloatArray {
    let count = Int(ceil((stop - start) / step))
    var result = [Float](repeating: 0.0, count: count)

    var value = start
    for i in 0..<count {
        result[i] = value
        value += step
    }

    return result
}

