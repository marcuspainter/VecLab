//
//  clip.swift
//  VecLab
//
//  Created by Marcus Painter on 06/09/2025.
//

import Accelerate

/// Clip data to range.
/// - Parameters:
///   - x: Input number.
///   - lower: Lower bound.
///   - upper: Upper bound.
/// - Returns: Clipped data.
public func clip(_ x: Real, lower: Real, upper: Real) -> Real {
    if x < lower {
        return lower
    } else if x < upper {
        return upper
    }
    return x
}

/// Clip data to range.
/// - Parameters:
///   - x: Input array.
///   - lower: Lower bound.
///   - upper: Upper bound.
/// - Returns: Clipped data.
public func clip(_ x: RealArray, lower: Real, upper: Real) -> RealArray {
    let range = (lower ... upper)
    return vDSP.clip(x, to: range)
}
