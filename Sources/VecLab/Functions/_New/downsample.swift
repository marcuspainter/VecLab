//
//  downsample.swift
//  VecLab
//
//  Created by Marcus Painter on 19/11/2024.
//

/// Decrease sample rate by integer factor.
/// - Parameters:
///   - input: Real array.
///   - factor: Downsampling factor.
///   - phase: Starting offset. Default = 0.
/// - Returns: Real array of the first (or phase) sample and then every nth samples.
public func downsample(_ x: [Double], _ factor: Int, _ phase: Int = 0) -> [Double] {
    guard factor > 0 else { return x }
    let adjustedPhase = phase % factor // Ensure phase is within 0..(factor-1)
    let outputSize = (x.count - adjustedPhase + factor - 1) / factor // ceil((input.count - phase) / factor)
    var result = [Double](repeating: 0.0, count: outputSize)

    var i = adjustedPhase
    var outputIndex = 0
    while i < x.count {
        result[outputIndex] = x[i]
        outputIndex += 1
        i += factor
    }
    return result
}
