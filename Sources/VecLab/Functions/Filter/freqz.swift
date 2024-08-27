//
//  freqz.swift
//
//
//  Created by Marcus Painter on 26/08/2024.
//

import Foundation

/// Transfer function for filter coefficients.
/// - Parameters:
///   - b: b coefficients.
///   - a: a coefficients.
///   - N: FFT Length.
/// - Returns: Complex transfer function.
public func freqz(_ b: RealArray, _ a: RealArray, _ N: Int = 512) -> ComplexArray {
    let bb = paddata(b, N * 2)
    let aa = paddata(a, N * 2)
    let H = fftr(bb) / fftr(aa)
    let HH = slice(H, 0 ..< N)
    return HH
}

/// Transfer function for filter coefficients.
/// - Parameters:
///   - b: b coefficients.
///   - a: a coefficients.
///   - N: DFT Length.
/// - Returns: Complex transfer function.
public func freqz2(_ b: RealArray, _ a: RealArray, _ N: Int = 512) -> ComplexArray {
    // Define the frequency range
    // var w = linspace(0, .pi, N+1) // 512 points between 0 and pi
    // w = resize(w, w.count - 1)
    let w = vector(0 ... N - 1) * (.pi / Real(N))

    // Initialize the frequency response
    var H = complex(count: N)

    // Compute the frequency response H(e^jw)
    for i in 0 ..< length(w) {
        // Evaluate the numerator and denominator polynomials at e^(-j*w[i])
        var numerator = complex()
        var denominator = complex()
        for k in 0 ..< length(b) {
            numerator = numerator + b[k] * exp(-Real.i * w[i] * Real(k))
        }
        for k in 0 ..< length(a) {
            denominator = denominator + a[k] * exp(-Real.i * w[i] * Real(k))
        }
        let HH = numerator / denominator
        H.0[i] = HH.0
        H.1[i] = HH.1
    }
    return H
}
