//
//  fftx.swift
//
//
//  Created by Marcus Painter on 14/09/2023.
//

import Foundation

// https://uk.mathworks.com/company/newsletters/articles/faster-finite-fourier-transforms-matlab.html

/// Recursive FFT of real array.
/// - Parameter x: Real array.
/// - Returns: Complex array result.
public func fftx(_ x: RealArray) -> ComplexArray {
    let n = length(x)
    let omega = exp(-2 * Real.pi * Real.i / Real(n))
    if rem(n, 2) == 0 {
        // Recursive divide and conquer.
        let k = vector(0 ... (n / 2 - 1))
        let w = omega ** k
        let u = fftx(slice(x, 0 ..< n - 1, 2))
        let v = w * fftx(slice(x, 1 ..< n, 2))
        return cat(u + v, u - v)
    } else {
        return ([x[0]], [0])
    }
}

/// Recursive FFT of complex array.
/// - Parameter x: Complex array.
/// - Returns: Complex array result.
public func fftx(_ x: ComplexArray) -> ComplexArray {
    let n = length(x)
    let omega = exp(-2 * Real.pi * Real.i / Real(n))
    if rem(n, 2) == 0 {
        // Recursive divide and conquer.
        let k = vector(0 ... (n / 2 - 1))
        let w = omega ** k
        let u = fftx(slice(x, 0 ..< n - 1, 2))
        let v = w * fftx(slice(x, 1 ..< n, 2))
        return cat(u + v, u - v)
    } else {
        return x
    }
}

/*
 function y = fftx(x)
 %FFTX Fast Finite Fourier Transform.
 x = x(:);
 n = length(x);
 omega = exp(-2*pi*i/n);

 if rem(n,2) == 0
 % Recursive divide and conquer.
     k = (0:n/2-1)';
     w = omega.^k;
     u = fftx(x(1:2:n-1));
     v = w.*fftx(x(2:2:n));
     y = [u+v; u-v];
 else
     % The Fourier matrix.
     j = 0:n-1;
     k = j';
     F = omega.^(k*j);
     y = F*x;
 end
 */
