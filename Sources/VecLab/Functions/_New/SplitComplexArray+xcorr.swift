//
//  SplitComplexArray+xcorr.swift
//  VecLab
//
//  Created by Marcus Painter on 22/09/2025.
//

/// Cross correlation of two complex signal vectors.
/// - Parameters:
///   - x: Complex array.
///   - y: Complex array.
/// - Returns: The cross correlation result.
public func xcorr(_ x: SplitComplexArray, _ y: SplitComplexArray) -> SplitComplexArray {
    let nx = length(x)
    let ny = length(y)
    let n = nx + ny - 1  // Full cross-correlation length

    // Use power-of-2 FFT size
    let N = Int(2.0 ** nextpow2(n))

    // Zero-pad inputs
    let a = paddata(x, length: N)
    let b = paddata(y, length: N)

    // FFT-based cross-correlation (note conjugation on y)
    let A = fft(a)
    let B = fft(b)
    let C = A *~ B
    let full_c = ifft(C)

    // Correct circular shift to align with MATLAB xcorr
    // MATLAB's xcorr lags go from -(nv-1) to (nu-1)
    // Zero-lag should be at index nv in a 1-based system
    let shift_amount = ny - 1
    var c = circshift(full_c, shift_amount)

    // Trim extra values
    c = trimdata(c, length: n)
    return c
}

/// Autocorrelation of a complex signal vector.
///
/// The result is of length 2N-1.
/// - Parameters:
///   - x: real array.
/// - Returns: The autocorrelation.
public func xcorr(_ x: SplitComplexArray) -> SplitComplexArray {
    xcorr(x, x)
}
