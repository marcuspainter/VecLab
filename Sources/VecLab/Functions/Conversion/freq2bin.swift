//
//  freq2bin.swift
//  VecLab
//
//  Created by Marcus Painter on 27/11/2024.
//

import Foundation

/// Convert frequency to FFT bin.
/// - Parameters:
///   - f: Frequency.
///   - n: FFT length.
///   - fs: Sample rate (optional).
/// - Returns: Returns the FFT bin for a frequency.
public func freq2bin(f: Real, n: Int, fs: Real = 48000.0) -> Int {
    // Calculate the bin index
    let binIndex = Int(round(f * Real(n) / fs))
    // Ensure the bin index is within the valid range
    return max(0, min(binIndex, n - 1))
}
