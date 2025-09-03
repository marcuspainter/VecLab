//
//  czt.swift
//  VecLab
//
//  Created by Marcus Painter on 30/04/2025.
//

// Chirp Z-Transform Spectral Zoom Optimization with MATLAB
// https://www.osti.gov/servlets/purl/1004350

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
    let m = x.count
    let k = k ?? m
    let w = w ?? expi(-2.0 * .pi / Double(k))
    let a = a ?? Complex(1.0, 0.0)

    // Length for power-of-two FFT
    let nfft = Int(2 ** nextpow2(m + k - 1))

    // Premultiply data
    let kk = vector((-m + 1)...max(k - 1, m - 1))
    let kk2 = (kk ** 2.0) / 2.0
    let ww = w ** kk2  // Chirp filter is 1./ww

    // Apply initial twiddle factor
    let nn = vector(0...(m - 1))
    var aa = a ** nn

    aa = aa * ww[m - 1..<m + m - 1]
    let y = x * aa

    let inv_ww = 1.0 / ww[0..<(m + k - 1)]  //  <----- Chirp filter.

    // Fast convolution via FFT
    // Zero pad
    var fy = fft(y, length: nfft)
    let fv = fft(inv_ww, length: nfft)
    fy = fy * fv
    var g = ifft(fy)

    // Final multiply
    g = g[m - 1..<(m + k - 1)] * ww[m - 1..<(m + k - 1)]

    return g
}

/*

 x = [1,2,3,4,5,6,7,8];
 g = czt1d_1(x)
 y = iczt1d_1(g)

 function g = czt1d_1(x, k, w, a)
 % CZT1D  Simplified Chirp Z-transform for 1D vectors only
 %   G = CZT1D(X, K, W, A) returns the K-point chirp z-transform of X,
 %   computed at points A*W^(0:K-1).
 %
 %   Default values:
 %     K = length(X)
 %     W = exp(-i*2*pi/K)
 %     A = 1
 %
 %   This is a simplified version that only works with 1D vectors.

 % Handle input parameters
 x = x(:);  % Ensure x is a column vector
 m = length(x);

 if nargin < 2
     k = m;
 end
 if nargin < 3
     w = exp(-1i * 2 * pi / k);
 end
 if nargin < 4
     a = 1;
 end

 % Length for power-of-two FFT
 nfft = 2^nextpow2(m+k-1);

 % Premultiply data
 kk = ((-m+1):max(k-1, m-1))';
 kk2 = (kk .^ 2) ./ 2;
 ww = w .^ kk2;  % Chirp filter is 1./ww

 % Apply initial twiddle factor
 nn = (0:(m-1))';
 aa = a .^ (-nn);

 % m + nn;
 mnn = (m:m+m-1)';

 aa = aa .* ww(mnn);
 y = x .* aa;

 % Fast convolution via FFT
 fy = fft(y, nfft);
 fv = fft(1 ./ ww(1:(m+k-1)), nfft);  % Chirp filter
 fy = fy .* fv;
 g = ifft(fy);

 % Final multiply
 g = g(m:(m+k-1)) .* ww(m:(m+k-1));

 end


 function x = iczt1d_1(g, m, w, a)
 % ICZT1D  Simplified Inverse Chirp Z-transform for 1D vectors only
 %   X = ICZT1D(G, M, W, A) returns the M-point inverse chirp z-transform of G,
 %   computed at points A*W^(0:M-1).
 %
 %   Default values:
 %     M = length(G)
 %     W = exp(-i*2*pi/M)
 %     A = 1
 %
 %   This is a simplified version that only works with 1D vectors.

 % Handle input parameters
 g = g(:);  % Ensure g is a column vector
 k = length(g);

 if nargin < 2
     m = k;
 end
 if nargin < 3
     w = exp(-1i * 2 * pi / m);
 end
 if nargin < 4
     a = 1;
 end

 % For inverse CZT, we need to use conjugate of w and reciprocal of a
 w_inv = conj(w);
 a_inv = 1/a;

 % Use the forward CZT with inverse parameters
 x = czt1d_1(g, m, w_inv, a_inv);

 % Apply additional scaling for perfect reconstruction
 x = x / m;

 end

 */
