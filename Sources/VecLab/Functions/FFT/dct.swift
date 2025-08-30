//
//  dct.swift
//  VecLab
//
//  Created by Marcus Painter on 26/08/2025.
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
    X = X * sqrt(Real(N)/2.0)
    X[0] = X[0] / sqrt(2.0)

    return X
}

// Only works for Float
func dctVDSP(_ x: RealArray) -> RealArray {
    let inputF = d2f(x)

    // Forward is type II
    guard let dct = vDSP.DCT(previous: nil,
                                count: inputF.count,
                                transformType: .II) else {
        return [Real](repeating: Real.nan, count: inputF.count)
    }

    let outputF = dct.transform(inputF)
    let output = f2d(outputF)

    return output
}

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
