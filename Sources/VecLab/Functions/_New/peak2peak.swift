//
//  peak2peak.swift
//  VecLab
//
//  Created by Marcus Painter on 27/11/2024.
//

/// Maximum-to-minimum difference.
///
/// - Parameter x: Input signal.
/// - Returns: Returns the difference between the maximum and minimum values in x.
public func peak2peak(_ x: RealArray) -> Real {
    let maxPeak = max(x)        // Find the maximum value
    let minPeak = min(x)        // Find the minimum value
    return maxPeak - minPeak    // Return the difference between max and min
}
