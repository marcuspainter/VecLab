//
//  peak2rms.swift
//  VecLab
//
//  Created by Marcus Painter on 18/11/2024.
//

/// Peak-magnitude-to-RMS ratio.
///
/// - Parameter x: Input signal
/// - Returns: Returns the ratio of the largest absolute value in x to the root-mean-square (RMS) value of x.
public func peak2rms(_ x: RealArray) -> Real {
    let peak = max(abs(x))
    return peak / rms(x)
}
