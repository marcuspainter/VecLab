//
//  bin2freq.swift
//  VecLab
//
//  Created by Marcus Painter on 27/11/2024.
//

import Foundation

/// Convert FFT bin to frequency.
/// - Parameters:
///   - bin: Bin number. DC = 0.
///   - n: FFT length.
///   - fs: Sample rate.
/// - Returns: Returns the frequency for an FFT bin.
public func bin2freq(bin: Int, n: Int, fs: Real = 48000.0) -> Real {
    // Ensure the bin index is within the valid range
    let clampedBin = max(0, min(bin, n - 1))
    // Calculate the frequency
    return Real(clampedBin) * fs / Real(n)
}
