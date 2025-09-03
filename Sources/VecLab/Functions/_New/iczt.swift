//
//  iczt.swift
//  VecLab
//
//  Created by Marcus Painter on 01/05/2025.
//

func iczt(_ x: ComplexArray, k: Int? = nil, w: Complex? = nil, a: Complex? = nil) -> ComplexArray {
    // ICZT1D  Inverse Chirp Z-transform for 1D vectors
    //   G = ICZT1D(X, K, W, A) returns the inverse chirp z-transform of X,
    //   where X was computed using the forward CZT with parameters K, W, A.
    //
    //   This ensures that iczt(czt(x)) = x when using the same parameters.

    // Handle input parameters (use the same parameters as the forward transform)
    let m = x.count
    let k = k ?? m

    // For proper inversion, we need conjugate of W and reciprocal of A
    var w_inv: Complex
    if let w {
        w_inv = conj(w)
    } else {
        w_inv = expi(2.0 * .pi / Double(k))
    }

    var a_inv: Complex
    if let a {
        a_inv = 1.0 / a
    } else {
        a_inv = Complex(1.0, 0.0)  // Reciprocal of 1 is 1
    }

    // Length for power-of-two FFT
    let nfft = Int(2 ** nextpow2(m + k - 1))

    // Premultiply data
    let kk = vector((-m + 1)...max(k - 1, m - 1))
    let kk2 = (kk ** 2.0) / 2.0
    let ww = w_inv ** kk2

    // Apply initial twiddle factor
    let nn = vector(0...(m - 1))
    var aa = a_inv ** nn

    aa = aa * ww[m - 1..<m + m - 1]
    let y = x * aa

    let inv_ww = 1.0 / ww[0..<(m + k - 1)]  // <----- Inverse chirp filter.

    // Fast convolution via FFT
    // Zero pad
    var fy = fft(y, length: nfft)
    let fv = fft(inv_ww, length: nfft)
    fy = fy * fv
    var g = ifft(fy)

    // Final multiply
    g = g[m - 1..<(m + k - 1)] * ww[m - 1..<(m + k - 1)]

    // Scale to get proper inverse
    g = g / Double(m)

    return g
}
