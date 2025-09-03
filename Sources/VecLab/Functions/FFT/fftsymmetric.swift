//
//  fftsymmetric.swift
//
//
//  Created by Marcus Painter on 15/09/2023.
//

import Foundation

/// Make conjugate symmetric.
/// - Parameter x: Complex  array.
/// - Returns: Conjugate symmetric array.
public func fftsymmetric(_ x: ComplexArray) -> ComplexArray {
    validateSize(x)
    var y = x
    let n = x.count
    if n % 2 == 0 {
        // Even
        let n2 = n / 2  // Nyquist
        for k in 1..<n2 {
            y[n2 + k] = y[n2 - k]
        }
    } else {
        let n2 = (n + 1) / 2
        for k in 0..<n2 - 1 {
            y[n2 + k] = y[n2 - k - 1]
        }
    }
    return y
}

/*
 function X = fftsymmetric(X)
 N = length(X);
 N1 = 2;

 if mod(N,2) == 0
     % Even
     N2 = N/2+1; % Nyquist
     X(N2+1:N) = conj(X(N2-1:-1:N1));
 else
    % Odd
    N2 = (N+1)/2; % Half, No Nyquist
    X(N2+1:N) = conj(X(N2:-1:N1));
 end

 % Even
 % 0     1     2     3     4     5     6     7
 % 0     1     2     3     4    -3    -2    -1
 % DC                      NQ

 % Odd
 % 0     1     2     3     4     5     6
 % 0     1     2     3    -3    -2    -1
 % DC

 4 = 3
 5 = 2
 6 = 1

 */
