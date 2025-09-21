//
//  sincresample.swift
//
//
//  Created by Marcus Painter on 12/09/2023.
//

import Foundation

/// Sinc window resample.
/// - Parameters:
///   - x: Input array.
///   - r: Resampling factor.
///   - beta: Beta value of kaiser window.
/// - Returns: Resampled output.
public func sincresample(_ x: RealArray, _ r: Real, _ beta: Real) -> RealArray {
    let N = x.count
    let M = Int(round(Real(N) * r))

    var y = RealArray(repeating: 0.0, count: M)
    let W = Int(round(Real(N) / 2))

    for m in 0..<M {
        let t = Real(m) / r
        let nStart = max(0, Int(t) - W)
        let nEnd = min(N, Int(t) + W)

        for n in nStart..<nEnd {
            y[m] += x[n] * sinc(t - Real(n)) * kaiserWindow(Real(n - Int(t) + W + 1), Real(2 * W + 1), beta)
        }
    }

    return y
}

func kaiserWindow(_ n: Real, _ M: Real, _ beta: Real) -> Real {
    let alpha = (2 * n) / (M - 1) - 1
    return besseli0(beta * sqrt(1 - alpha * alpha)) / besseli0(beta)
}

/*

 function y = fractional_resample(x, r, beta)
     % Inputs:
     % x - Input signal (1D array)
     % r - Resampling ratio. r > 1 for upsampling, r < 1 for downsampling.
     % beta - Kaiser window shape parameter

     % Compute the length of the input and output signals
     N = length(x);
     M = round(N * r);

     % Allocate space for the output signal
     y = zeros(1, M);
     W = round(N/2); % Half-width of the window (you can adjust based on your requirements)

     % Compute the resampled signal
     for m = 1:M
         % Resampled time instance
         t = m / r;

         % Calculate resampled value using sinc interpolation and Kaiser window
         for n = max(1, t - W):min(N, t + W)
             y(m) = y(m) + x(n) * sinc(t - n) * kaiser_window(n - t + W + 1, 2*W+1, beta);
         end
     end
 end

 % Define a sinc function for use in interpolation
 function s = sinc(t)
     if t == 0
         s = 1;
     else
         s = sin(pi * t) / (pi * t);
     end
 end

 function w = kaiser_window(n, M, beta)
     % n - Sample index (starting from 1, so adjust to 0-based)
     n = n - 1;

     % Kaiser window formula
     alpha = (2 * n) / (M - 1) - 1;
     w = I0(beta * sqrt(1 - alpha^2)) / I0(beta);
 end

 function val = I0(x)
     % Compute I0 using the series expansion
     % Limit the sum to a certain number of terms for practical computation
     max_terms = 20;
     val = 0;
     for k = 0:max_terms
         val = val + ( (x^2/4)^k / factorial(k)^2 );
     end
 end

 % Helper function to compute factorial
 function f = factorial(n)
     f = prod(1:n);
 end
*/
