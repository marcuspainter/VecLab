//
//  RealArray+conv.swift
//  VecLab
//
//  Created by Marcus Painter on 22/09/2025.
//

import Accelerate
import Foundation

/// Convolution.
/// - Parameters:
///   - x: Real array.
///   - y: Real array.
///   - shape: `same` or `full`
/// - Returns: The result of the convolution.
public func conv(_ x: RealArray, _ y: RealArray, shape: ConvolutionType = .same) -> RealArray {
    validateSize(x, y)
    switch shape {
    case .same:
        return convsame(x, y)
    case .full:
        return convfull(x, y)
    }
}

/// Convolution "same".
/// - Parameters:
///   - x: Real array.
///   - y: Real array.
/// - Returns: The result of the convolution.
private func convsame(_ x: RealArray, _ y: RealArray) -> RealArray {

    let nx = length(x)
    let ny = length(y)
    let n = nx + ny - 1  // Full convolution length

    // Ensure FFT size is a power of 2
    let N = Int(2 ** nextpow2(n))

    // Zero-pad inputs
    let a = paddata(x, length: N)
    let b = paddata(y, length: N)

    // Compute FFT convolution
    let A = fftr(a)
    let B = fftr(b)
    let C = A * B
    let full_c = ifftr(C)  // Full convolution result

    // Extract the "same" portion
    let start_idx = Int(floor(Real(ny) / 2.0))  // Corrected center alignment
    let end_idx = start_idx + nx - 1  // Ensure length(u) output

    let c = full_c[start_idx...end_idx]
    return c
}

/// Convolution "full".
/// - Parameters:
///   - x: Real array.
///   - y: Real array.
/// - Returns: The result of the convolution.
private func convfull(_ x: RealArray, _ y: RealArray) -> RealArray {
    let n = length(x) + length(y) - 1  // Result length

    // Simulate using power of 2 fft only
    let N = Int(2 ** nextpow2(n))
    let a = paddata(x, length: N)
    let b = paddata(y, length: N)

    let A = fftr(a)
    let B = fftr(b)

    let C = A * B
    var c = ifftr(C)

    c = Array(c[0..<n])  // Trim to correct length
    return c
}
