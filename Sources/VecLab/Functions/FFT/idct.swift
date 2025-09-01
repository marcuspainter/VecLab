//
//  idct.swift
//  VecLab
//
//  Created by Marcus Painter on 26/08/2025.
//

import Accelerate

/// Inverse Discrete Cosine Transform using FFT.
/// - Parameter X: Real array.
/// - Returns: Real Array.
public func idct(_ X: RealArray) -> RealArray {
    let N = X.count
    var Y = X * sqrt(Real(N) / 2.0)
    Y[0] = Y[0] * sqrt(2.0)

    let k = vector(0 ..< N)
    let w = expi(Real.pi * k / (2.0 * Real(N)))
    let YY = Y * w

    // var Z = ComplexArray(count: 2 * N)
    // Z[0 ..< N] = YY
    // Z[N + 1 ..< 2 * N] = conj(flip(YY[1 ..< N]))

    // Equivalent
    let Z = cat(YY, [0], conj(flip(YY[1..<N])))

    let z = ifftr(Z)
    let x = z[0 ..< N] * 2.0

    return x
}

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
