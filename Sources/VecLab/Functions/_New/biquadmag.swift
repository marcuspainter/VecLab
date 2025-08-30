//
//  biquadmag.swift
//  
//
//  Created by Marcus Painter on 28/08/2024.
//

import Foundation

/// Magnitude response for biquad coefficients.
/// - Parameters:
///   - b: b coefficients.
///   - a: a coefficients.
///   - n: FFT Length.
/// - Returns: Complex transfer function.
public func biquadmag(b: RealArray, a: RealArray, n: Int = 512) -> RealArray {
    let b0 = b[0]
    let b1 = b[1]
    let b2 = b[2]
    let a0 = a[0]
    let a1 = a[1]
    let a2 = a[2]

    // let f = logspace(log10(20), log10(20000), 201)
    // let w = f * 2 * Real.pi / 48000
    let w = vector(0 ... n-1) * (.pi / Real(n))

    var phi = sin(w / 2.0)
    phi = phi * phi
/*
    let H = 10 * log10[(b0 + b1 + b2) ** 2 - 4 * (b0 * b1 + 4 * b0 * b2 + b1 * b2) * phi + 16 * b0 * b2 * phi ** 2]
    -10 * log10[(a0 + a1 + a2) ** 2 - 4 * (a0 * a1 + 4 * a0 * a2 + a1 * a2) * phi + 16 * a0 * a2 * phi ** 2]
*/
    var p1 = (b0 + b1 + b2)
    p1 = p1 * p1
    let p2 = 4.0 * (b0 * b1 + 4 * b0 * b2 + b1 * b2)
    let p3 = 16.0 * b0 * b2
    var q1 = (a0 + a1 + a2)
    q1 = q1 * q1
    let q2 = 4.0 * (a0 * a1 + 4 * a0 * a2 + a1 * a2)
    let q3 = 16.0 * a0 * a2
    let phi2 = phi * phi

    let H2 = 10.0 * (log10(p1 - p2 * phi + p3 * phi2) - log10(q1 - q2 * phi + q3 * phi2))

    return H2
}

// https://dsp.stackexchange.com/
// questions/16885/how-do-i-manually-plot-the-frequency-response-of-a-bandpass-butterworth-filter-i/16911#16911
// https://www.musicdsp.org/en/latest/Analysis/186-frequency-response-from-biquad-coefficients.html
// http://groups.google.com/group/comp.dsp/browse_frm/thread/8c0fa8d396aeb444/a1bc5b63ac56b686
// https://dsp.stackexchange.com/questions/24222/iir-filter-calculating-the-phase-response
