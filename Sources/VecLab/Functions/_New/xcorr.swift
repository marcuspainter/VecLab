//
//  xcorr.swift
//
//
//  Created by Marcus Painter on 29/08/2024.
//

import Accelerate
import Foundation

/// Cross correlation of  two signal vectors.
///
/// The result is of length 2N-1.
/// - Parameters:
///   - x: Array.
///   - y: Array.
/// - Returns: The cross correlation result.
public func xcorr(_ x: RealArray, _ y: RealArray) -> RealArray {
    let N = length(x) + length(y) - 1
    //let M = max(x.count, y.count)
    let M = nextpow2(N)
    
    let xx = paddata(x, M)
    let yy = paddata(y, M)

    print(xx)
    print(yy)
    print(xx.count)
    
    let A = fftr(xx)
    let B = fftr(yy)

    let C = A *~ B // conj(B)
    var z = ifftr(C)
    z = fftshift(z)
    z = circshift(z, -1) // Needed to match Matlab
 
    return z
}

/// Autocorrelation of  a signal vector.
///
/// The result is of length 2N-1.
/// - Parameters:
///   - x: Array.
/// - Returns: The autocorrelation.
public func xcorr(_ x: RealArray) -> RealArray {
    xcorr(x, x)
}

/// Cross correlation of  two signal vectors.
///
/// The result is of length 2N-1.
/// - Parameters:
///   - x: Array.
/// - Returns: The cross correlation result.
public func xcorrSimple(_ x: RealArray, _ y: RealArray) -> RealArray {
    let n = x.count
    let m = y.count
    let resultSize = n + m - 1
    var result = [Real](repeating: 0.0, count: resultSize)
    
    for i in 0..<n {
        for j in 0..<m {
            result[i + m - 1 - j] += x[i] * y[j]  // Note the index change here
        }
    }
    
    return result
}

// https://www.researchgate.net/post/How-to-perform-cross-correlation-by-FFT
/*
 fx = fft(x,2*N); % 2N point FFT of x
 fy = fft(y,2*N); % 2N point FFT of y
 r_xy = ifft(fx.*conj(fy)) % r = [r0,r1,...,r_N-1,0,r_1-N,...,r_-1]
 */

// https://uk.mathworks.com/matlabcentral/fileexchange/43967-circular-cross-correlation-using-fft