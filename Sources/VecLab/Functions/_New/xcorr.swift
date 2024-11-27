//
//  xcorr.swift
//
//
//  Created by Marcus Painter on 29/08/2024.
//

import Accelerate
import Foundation

/// Cross correlation of  two signal vectors.
/// - Parameters:
///   - x: Array.
///   - y: Array.
/// - Returns: The cross correlation result.
public func xcorr(_ x: RealArray, _ y: RealArray) -> RealArray {
    let N = length(x) + length(y) - 1
    let M = Int(2 ** nextpow2(N))

    // Zero pad both signals to length M
    let xx = paddata(x, M)
    let yy = paddata(y, M)

    // Perform FFT on both signals
    let X = fftr(xx)
    let Y = fftr(yy)

    // Multiply in frequency domain
    // Note: For correlation, we take the conjugate
    let Z = X *~ Y

    // Perform inverse FFT
    var z = ifftr(Z)

    // Shift
    z = fftshift(z)

    // Take only the last N points
    z = Array(z[1 ..< length(z)])

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
///   - y: Array.
/// - Returns: The cross correlation result.
public func xcorrSimple(_ x: RealArray, _ y: RealArray) -> RealArray {
    let n = x.count
    let m = y.count
    let resultSize = n + m - 1
    var result = [Real](repeating: 0.0, count: resultSize)

    for i in 0 ..< n {
        for j in 0 ..< m {
            result[i + m - 1 - j] += x[i] * y[j] // Note the index change here
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

/*
 func autocorr(a: [Float]) -> [Float] {
 let filterLen = a.count
 let resultLen = filterLen * 2 - 1
 let signalLen = ((filterLen + 3) & 0xFFFFFFFC) + resultLen

 let padding1 = [Float](repeating: 0.0, count: a.count - 1)
 let padding2 = [Float]( repeating: 0.0, count: (signalLen - padding1.count - a.count))
 let signal = padding1 + a + padding2

 var result = [Float](repeating: 0.0, count: resultLen)

 vDSP_conv(signal, 1, a, 1, &result, 1, UInt(resultLen), UInt(filterLen))

 // Remove the first n-1 values which are just mirrored from the end so that [0] always has the autocorrelation.
 result.removeFirst(filterLen - 1)

 return result
 }

 // https://stackoverflow.com/questions/37175618/vdsp-conv-occasionally-returns-nans
 */

// signal = [1, 2, 3, 4, 5, 6, 7, 8]
// filter = [10, 20, 30]
// correlationResult = [140.0, 200.0, 260.0, 320.0, 380.0, 440.0]
// convolutionResult = [100.0, 160.0, 220.0, 280.0, 340.0, 400.0].

/*

 >> floor(xcorr(x,x))

 ans =

       8    23    44    70   100   133   168   204   168   133   100    70    44    23     8

  ans =

       8    23    44    70   100   133   168   204   168   133   100    70    44    23     8

  */
