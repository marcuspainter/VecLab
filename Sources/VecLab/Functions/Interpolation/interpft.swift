//
//  interpft.swift
//  
//
//  Created by Marcus Painter on 17/09/2023.
//

import Foundation
import Accelerate

/// Interpolate using FFT. method  (Alternative)
/// - Parameters:
///   - x: Input array.
///   - n: Factor.
/// - Returns: Output array.
public func interpft(_ x: RealArray, _ n: Int) -> RealArray {
    let N = length(x)

    // Upsample, odd length
    if mod(length(x), 2) != 0 {
        let U = Real(n)
        let z = zeros(N * Int(U) - N)
        let X = fftr(x)
        // XX = U * [X2( 1:((N+1)/2) )  z  X2(((N+1)/2+1):N)]; // Matlab
        let t1 = slice(X, 0 ..< ((N+1)/2) )
        let t2 = ComplexArray(z, z)
        let t3 = slice(X, (N+1)/2 ..< N)
        let XX = U * cat(t1, t2, t3)
        let xx = ifftr(XX)
        return xx
    } else {
        let U = Real(n)
        let X = fftr(x)
        let z = zeros(N * Int(U) - N)
        let t1 = slice(X, 0 ..< (N/2))
        let t2 = ComplexArray( [X.real[N/2+1]], [X.imag[N/2+1]]) * 0.5
        let t3 = ComplexArray(z, z)
        let t4 = ComplexArray( [X.real[N/2+1]], [X.imag[N/2+1]]) * 0.5
        let t5 = slice(X, N/2+1 ..< N)
        // XX = U * [X(1:(N/2)) X((N/2)+1)/2 z X(N/2+1)/2 X(N/2+2:N)];  // Matlab
        let XX = U * cat(t1, t2, t3, t4, t5)
        let xx = ifftr(XX)
        return xx
    }
}

// % https://dsp.stackexchange.com/questions/14919/upsample-data-using-ffts-how-is-this-exactly-done
