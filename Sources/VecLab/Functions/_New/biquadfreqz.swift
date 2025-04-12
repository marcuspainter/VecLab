//
//  biquadfreqz.swift
//
//
//  Created by Marcus Painter on 27/08/2024.
//

import Foundation

/// Transfer function for biquad filter coefficients.
/// - Parameters:
///   - b: b coefficients.
///   - a: a coefficients.
///   - n: FFT size..
/// - Returns: Complex transfer function.
public func biquadfreqz(b: RealArray, a: RealArray, n: Int = 512) -> ComplexArray {
    let b0 = b[0]
    let b1 = b[1]
    let b2 = b[2]
    let a0 = a[0]
    let a1 = a[1]
    let a2 = a[2]

    let N = n
    let w = vector(0 ... N-1) * (.pi / Real(N))

    // Compute trigonometric terms
    let sin_half_w = sin(w / 2)
    let sin_w = sin(w)
    let sin_2w = sin(2 * w)

    // Compute cosine terms using trigonometric identities
    let cos_w =  1 - 2 * sin_half_w * sin_half_w
    let cos_2w = 1 - 2 * sin_w * sin_w

    // Real and imaginary parts of the numerator
    let num_re = b0 + b1 * cos_w + b2 * cos_2w
    let num_im =     -b1 * sin_w - b2 * sin_2w  // Corrected sign

    // Real and imaginary parts of the denominator
    let den_re = a0 + a1 * cos_w + a2 * cos_2w
    let den_im =     -a1 * sin_w - a2 * sin_2w  // Corrected sign

    // Compute the complex frequency response
    let num = ComplexArray(num_re, num_im)
    let den = ComplexArray(den_re, den_im)
    let H = num / den

    return H
}

// https://dsp.stackexchange.com/questions/16885/how-do-i-manually-plot-the-frequency-response-of-a-bandpass-butterworth-filter-i/16911#16911
// https://www.musicdsp.org/en/latest/Analysis/186-frequency-response-from-biquad-coefficients.html
// https://dsp.stackexchange.com/questions/24222/iir-filter-calculating-the-phase-response
