//
//  conv.swift
//
//
//  Created by Marcus Painter on 29/08/2024.
//

import Accelerate
import Foundation

/// Convolution.
/// - Parameters:
///   - x: Real array.
///   - y: Real array.
///   - shape: `same` or `full`
/// - Returns: The result of the convolution.
public func conv(_ x: RealArray, _ y: RealArray, shape: ConvolutionType = .same) -> RealArray {
    validateSize(x, y)
    switch shape {
        case .same:
            return convsame(x, y)
        case .full:
            return convfull(x, y)
    }
}

/// Convolution "same".
/// - Parameters:
///   - x: Real array.
///   - y: Real array.
/// - Returns: The result of the convolution.
private func convsame(_ x: RealArray, _ y: RealArray) -> RealArray {

    let nx = length(x)
    let ny = length(y)
    let n = nx + ny - 1  // Full convolution length

    // Ensure FFT size is a power of 2
    let N = Int(2 ** nextpow2(n))

    // Zero-pad inputs
    let a = paddata(x, length: N)
    let b = paddata(y, length: N)

    // Compute FFT convolution
    let A = fftr(a)
    let B = fftr(b)
    let C = A * B
    let full_c = ifftr(C) // Full convolution result

    // Extract the "same" portion
    let start_idx = Int(floor(Real(ny) / 2.0))  // Corrected center alignment
    let end_idx = start_idx + nx - 1   // Ensure length(u) output

    let c = full_c[start_idx ... end_idx]
    return c
}

/// Convolution "full".
/// - Parameters:
///   - x: Real array.
///   - y: Real array.
/// - Returns: The result of the convolution.
private func convfull(_ x: RealArray, _ y: RealArray) -> RealArray {
    let n = length(x) + length(y) - 1 // Result length

    // Simulate using power of 2 fft only
    let N = Int(2 ** nextpow2(n))
    let a = paddata(x, length: N)
    let b = paddata(y, length: N)

    let A = fftr(a)
    let B = fftr(b)

    let C = A * B
    var c = ifftr(C)

    c = Array(c[0 ..< n]) // Trim to correct length
    return c
}

/// Convolution.
/// - Parameters:
///   - x: Complex array.
///   - y: Complex array.
///   - shape: `same` or `full`
/// - Returns: The result of the convolution.
public func conv(_ x: ComplexArray, _ y: ComplexArray, shape: ConvolutionType = .same) -> ComplexArray {
    switch shape {
        case .same:
            return convsame(x, y)
        case .full:
            return convfull(x, y)
    }
}

/// Convolution "same".
/// - Parameters:
///   - x: Complex array.
///   - y: Complex array.
/// - Returns: The result of the convolution.
private func convsame(_ x: ComplexArray, _ y: ComplexArray) -> ComplexArray {
    let nx = length(x)
    let ny = length(y)
    let n = nx + ny - 1  // Full convolution length

    // Ensure FFT size is a power of 2
    let N = Int(2 ** nextpow2(n))

    // Zero-pad inputs
    let a = paddata(x, length: N)
    let b = paddata(y, length: N)

    // Compute FFT convolution
    let A = fft(a)
    let B = fft(b)
    let C = A * B
    let full_c = ifft(C) // Full convolution result

    // Extract the "same" portion
    let start_idx = Int(floor(Real(ny) / 2.0))  // Corrected center alignment
    let end_idx = start_idx + nx - 1   // Ensure length(u) output

    let c = full_c[start_idx ... end_idx]
    return c
}

/// Convolution "full".
/// - Parameters:
///   - x: Complex array.
///   - y: Complex array
/// - Returns: The result of the convolution.
private func convfull(_ x: ComplexArray, _ y: ComplexArray) -> ComplexArray {
    let n = length(x) + length(y) - 1 // Result length

    // Simulate using power of 2 fft only
    let N = Int(2 ** nextpow2(n))
    let a = paddata(x, length: N)
    let b = paddata(y, length: N)

    let A = fft(a)
    let B = fft(b)

    let C = A * B
    var c = ifft(C)

    c = trimdata(c, length: n) // Trim to correct length
    return c
}

/*
 function c = myconvsame(u, v)
     nu = length(u);
     nv = length(v);
     n = nu + nv - 1;  % Full convolution length

     % Ensure FFT size is a power of 2
     N = 2^nextpow2(n);
     assert(log2(N) == round(log2(N)), 'FFT size must be power of 2');

     % Zero-pad inputs
     a = paddata(u, N);
     b = paddata(v, N);

     % Compute FFT convolution
     A = fft(a, N);
     B = fft(b, N);
     C = A .* B;
     full_c = real(ifft(C));  % Full convolution result

     % Extract the "same" portion
     start_idx = floor(nv / 2) + 1;  % Corrected center alignment
     end_idx = start_idx + nu - 1;   % Ensure length(u) output

     c = full_c(start_idx:end_idx);
 end

 function c = myconvfull(u,v)
 n = length(u) + length(v) - 1; % Result length

 % Simulate using power of 2 fft only
 N = 2^nextpow2(n);
 a = paddata(u, N);
 b = paddata(v, N);

 A = fft(a,N);
 B = fft(b,N);

 C = A .* B;
 c = real(ifft(C));

 c = c(1:n); % Trim to correct length

 end
 
 */

func convSimple(_ x: RealArray, _ y: RealArray) -> RealArray {
    // The resulting convolution array will have a size of (x.count + y.count - 1)
    let n = x.count
    let m = y.count
    let resultSize = n + m - 1
    var result = [Real](repeating: 0.0, count: resultSize)

    // Brute-force convolution
    for i in 0 ..< n {
        for j in 0 ..< m {
            result[i + j] += x[i] * y[j]
        }
    }

    return result
}

// signal = [1, 2, 3, 4, 5, 6, 7, 8]
// filter = [10, 20, 30]
// correlationResult = [140.0, 200.0, 260.0, 320.0, 380.0, 440.0]
// convolutionResult = [100.0, 160.0, 220.0, 280.0, 340.0, 400.0].

/*

 >> conv(x,x)

 ans =

      1     4    10    20    35    56    84   120   147   164   170   164   145   112    64

  ans =

      10    40   100   160   220   280   340   400   370   240
 


 */
