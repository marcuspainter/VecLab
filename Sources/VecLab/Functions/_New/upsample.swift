//
//  upsample.swift
//  VecLab
//
//  Created by Marcus Painter on 19/11/2024.
//

/// Increase sample rate by integer factor
/// - Parameters:
///   - input: Real array.
///   - factor: Upsampling factor.
///   - phase: Starting offset. Default = 0.
/// - Returns: Real array of n – 1 zeros between samples.
public func upsample(_ input: [Double], _ factor: Int, _ phase: Int = 0) -> [Double] {
    guard factor > 0 else { return input }
    let adjustedPhase = phase % factor // Ensure phase is within 0..(factor-1)
    let outputSize = input.count * factor
    var result = [Double](repeating: 0.0, count: outputSize)

    var outputIndex = adjustedPhase
    for i in 0 ..< input.count {
        result[outputIndex] = input[i]
        outputIndex += factor
    }
    return result
}


