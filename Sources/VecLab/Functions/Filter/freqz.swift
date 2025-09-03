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
///   - n: FFT Length.
/// - Returns: Complex transfer function.
public func freqz(b: RealArray, a: RealArray, n: Int = 512) -> ComplexArray {
    let bb = paddata(b, length: n * 2)
    let aa = paddata(a, length: n * 2)
    let H = fftr(bb) / fftr(aa)
    let HH = H[0..<n]
    return HH
}

/// Transfer function for filter coefficients.
/// - Parameters:
///   - b: b coefficients.
///   - a: a coefficients.
///   - n: DFT Length.
/// - Returns: Complex transfer function.
public func freqz2(b: RealArray, a: RealArray, n: Int = 512) -> ComplexArray {
    // Define the frequency range
    // var w = linspace(0, .pi, N+1) // 512 points between 0 and pi
    // w = resize(w, w.count - 1)
    let w = vector(0...n - 1) * (.pi / Real(n))

    // Initialize the frequency response
    var H = ComplexArray(count: n)

    // Compute the frequency response H(e^jw)
    for i in 0..<length(w) {
        // Evaluate the numerator and denominator polynomials at e^(-j*w[i])
        var numerator = Complex()
        var denominator = Complex()
        for k in 0..<length(b) {
            numerator = numerator + b[k] * exp(-Real.i * w[i] * Real(k))
        }
        for k in 0..<length(a) {
            denominator = denominator + a[k] * exp(-Real.i * w[i] * Real(k))
        }
        let HH = numerator / denominator
        H[i] = HH
    }
    return H
}
