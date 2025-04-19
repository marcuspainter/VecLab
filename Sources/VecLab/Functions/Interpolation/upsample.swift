//
//  upsample.swift
//  VecLab
//
//  Created by Marcus Painter on 19/11/2024.
//

/// Increase sample rate by integer factor
/// - Parameters:
///   - x: Real array.
///   - factor: Upsampling factor.
///   - phase: Starting offset. Default = 0.
/// - Returns: Real array of n – 1 zeros between samples.
public func upsample(_ x: RealArray, _ factor: Int, _ phase: Int = 0) -> RealArray {
    guard factor > 0 else { return x }
    let adjustedPhase = phase % factor // Ensure phase is within 0..(factor-1)
    let outputSize = x.count * factor
    var result = RealArray(repeating: 0.0, count: outputSize)

    var outputIndex = adjustedPhase
    for i in 0 ..< x.count {
        result[outputIndex] = x[i]
        outputIndex += factor
    }
    return result
}
