//
//  ComplexArray+CZT.swift
//  VecLab
//
//  Created by Marcus Painter on 22/09/2025.
//

func czt(_ x: ComplexArray, k: Int? = nil, w: Complex? = nil, a: Complex? = nil) -> ComplexArray {
    // CZT1D  Simplified Chirp Z-transform for 1D vectors only
    //   G = CZT1D(X, K, W, A) returns the K-point chirp z-transform of X,
    //   computed at points A*W^(0:K-1).
    //
    //   Default values:
    //     K = length(X)
    //     W = exp(-i*2*pi/K)
    //     A = 1
    //

    // Handle input parameters
    let m: Int = x.count
    let k: Int = k ?? m
    let w: Complex = w ?? expi(-2.0 * .pi / Double(k))
    let a: Complex = a ?? Complex(1.0, 0.0)

    // Length for power-of-two FFT
    let nfft: Int = Int(2 ** nextpow2(m + k - 1))

    // Premultiply data
    let kk: RealArray = vector((-m + 1)...max(k - 1, m - 1))
    let kk2: RealArray = (kk ** 2.0) / 2.0
    let ww: ComplexArray = w ** kk2  // Chirp filter is 1./ww

    // Apply initial twiddle factor
    let nn: RealArray = vector(0...(m - 1))
    var aa: ComplexArray = a ** nn

    aa = aa * ww[m - 1..<m + m - 1]
    var y = x * aa

    var inv_ww = 1.0 / ww[0..<(m + k - 1)]  //  <----- Chirp filter.

    // Fast convolution via FFT
    // Zero pad
    y = paddata(y, length: nfft)
    inv_ww = paddata(inv_ww, length: nfft)
    
    var fy = fft(y)
    let fv = fft(inv_ww)
    fy = fy * fv
    var g = ifft(fy)

    // Final multiply
    g = g[m - 1..<(m + k - 1)] * ww[m - 1..<(m + k - 1)]

    return g
 
}
