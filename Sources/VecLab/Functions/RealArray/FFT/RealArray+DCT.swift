//
//  RealArray.swift
//  VecLab
//
//  Created by Marcus Painter on 22/09/2025.
//

import Accelerate

/// Discrete Cosine Transform using FFT.
/// - Parameter x: Real array.
/// - Returns: Real Array.
public func dct(_ x: RealArray) -> RealArray {
    let N = x.count
    let y = cat(x, flip(x))

    let Y = fftr(y)
    let k = vector(0..<N)
    let w = expi(-Real.pi * k / (2.0 * Real(N)))
    var X = real(w * Y[0..<N])
    X = X / Real(N)
    X = X * sqrt(Real(N) / 2.0)
    X[0] = X[0] / sqrt(2.0)

    return X
}

/*
// Only works for Float
func dctVDSP(_ x: RealArray) -> RealArray {
    let inputF = double2float(x)

    // Forward is type II
    guard let dct = vDSP.DCT(previous: nil,
                                count: inputF.count,
                                transformType: .II) else {
        return [Real](repeating: Real.nan, count: inputF.count)
    }

    let outputF = dct.transform(inputF)
    let output = float2double(outputF)

    return output
}
*/

/*
function X = dct_fft(x)
% DCT_FFT - 1D Discrete Cosine Transform using FFT
%
% Syntax: X = dct_fft(x)
%
% Input:
%   x - Input signal (vector)
%
% Output:
%   X - DCT coefficients
    x = x(:);  % Make sure x is a column vector
    N = length(x);

    % Rearrange input sequence
    y = zeros(2*N, 1);
    y(1:N) = x;
    y(N+1:2*N) = x(N:-1:1);

    % Compute FFT
    Y = fft(y);

    % Extract DCT coefficients
    k = (0:N-1)';
    w = exp(-1i*pi*k/(2*N));
    X = real(w .* Y(1:N));

    % Apply proper normalization
    X = X / N;
    X = X * sqrt(N/2);
    X(1) = X(1) / sqrt(2);
end
*/

/// Inverse Discrete Cosine Transform using FFT.
/// - Parameter X: Real array.
/// - Returns: Real Array.
public func idct(_ X: RealArray) -> RealArray {
    let N = X.count
    var Y = X * sqrt(Real(N) / 2.0)
    Y[0] = Y[0] * sqrt(2.0)

    let k = vector(0..<N)
    let w = expi(Real.pi * k / (2.0 * Real(N)))
    let YY = Y * w

    // var Z = SplitComplexArray(count: 2 * N)
    // Z[0 ..< N] = YY
    // Z[N + 1 ..< 2 * N] = conj(flip(YY[1 ..< N]))

    // Equivalent
    let Z = cat(YY, [.zero], conj(flip(YY[1..<N])))

    let z = ifftr(Z)
    let x = z[0..<N] * 2.0

    return x
}

/*
// Only works for Float
func idctVDSP(_ x: RealArray) -> RealArray {
    let inputF = double2float(x)

    // Inverse is type III
    guard let idct = vDSP.DCT(previous: nil,
                              count: inputF.count,
                              transformType: .III) else {
        return [Real](repeating: Real.nan, count: inputF.count)
    }

    let outputF = idct.transform(inputF)
    let output = float2double(outputF)

    return output
}
*/

/*
 function x = idct_fft(X)
 % IDCT_FFT - 1D Inverse Discrete Cosine Transform using FFT
 %
 % Syntax: x = idct_fft(X)
 %
 % Input:
 %   X - DCT coefficients (vector)
 %
 % Output:
 %   x - Reconstructed signal
     X = X(:);  % Make sure X is a column vector
     N = length(X);

     % Reverse the DCT normalization
     Y = X * sqrt(N/2);
     Y(1) = Y(1) * sqrt(2);

     % Apply inverse phase correction
     k = (0:N-1)';
     w = exp(1i*pi*k/(2*N));
     Y = Y .* w;

     % Create extended sequence for IFFT
     Z = zeros(2*N, 1);
     Z(1:N) = Y;
     % For proper conjugate symmetry: Z(2N-k+1) = conj(Z(k)) for k=2,...,N
     Z(N+2:2*N) = conj(Y(N:-1:2));

     % Compute IFFT
     z = ifft(Z);

     % Extract the first N real values and apply correct scaling
     x = real(z(1:N)) * 2;
 end
 */

