//
//  paprdb.swift
//  VecLab
//
//  Created by Marcus Painter on 27/11/2024.
//

/// Peak power to average power in decibels.
///
/// - Parameter x: Input signal.
/// - Returns: Returns the ratio of the largest peak power n x to the root-mean-square (RMS) power.
public func paprdb(_ x: RealArray) -> Real {
    return mag2db(peak2rms(x))
}
