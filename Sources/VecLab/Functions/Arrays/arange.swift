//
//  arange.swift
//  VecLab
//
//  Created by Marcus Painter on 23/08/2024.
//

import Foundation
import Accelerate

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
    return vDSP.ramp(withInitialValue: start, increment: step, count: count)
}
