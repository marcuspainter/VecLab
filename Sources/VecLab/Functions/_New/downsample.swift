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
public func downsample(_ input: [Double], factor: Int, phase: Int = 0) -> [Double] {
    guard factor > 0 else { return input }
    let adjustedPhase = phase % factor // Ensure phase is within 0..(factor-1)
    let outputSize = (input.count - adjustedPhase + factor - 1) / factor // ceil((input.count - phase) / factor)
    var result = [Double](repeating: 0.0, count: outputSize)

    var i = adjustedPhase
    var outputIndex = 0
    while i < input.count {
        result[outputIndex] = input[i]
        outputIndex += 1
        i += factor
    }
    return result
}
