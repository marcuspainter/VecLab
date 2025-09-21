//
//  RealArray+filter.swift
//  VecLab
//
//  Created by Marcus Painter on 21/09/2025.
//

/// Filter
///
/// Direct Form II IIR filter.
/// - Parameters:
///   - b: b coefficients.
///   - a: a coefficients.
///   - x: Real input signal.
/// - Returns: Filtered signal.
public func filter(b: RealArray, a: RealArray, x: RealArray) -> RealArray {
    let M = b.count
    let L = a.count
    let N = x.count

    var w = RealArray(count: max(M, L))
    var y = RealArray(count: N)

    for n in 0..<N {
        // Compute w[0]
        var wn = x[n]
        for i in 1..<L {
            wn -= a[i] * w[i - 1]
        }

        // Update output y[n]
        y[n] = b[0] * wn
        for i in 1..<M {
            y[n] += b[i] * w[i - 1]
        }

        // Shift state variables for the next iteration
        for j in (1..<M).reversed() {
            w[j] = w[j - 1]
        }
        w[0] = wn
    }

    return y
}
