//
//  threshold.swift
//  VecLab
//
//  Created by Marcus Painter on 06/09/2025.
//

import Accelerate

/// Threshold value
/// - Parameters:
///   - x: Input number.
///   - lower: Threshold value.
/// - Returns: Thresholded value.
public func threshold(_ x: Real, lower: Real) -> Real {
    if x < lower {
        return lower
    }
    return x
}

/// Threshold value
/// - Parameters:
///   - x: Input array.
///   - lower: Threshold value.
/// - Returns: Thresholded values.
public func threshold(_ x: RealArray, lower: Real) -> RealArray {
    return vDSP.threshold(x, to: lower, with: .clampToThreshold)
}
