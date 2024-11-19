//
//  File.swift
//  
//
//  Created by Marcus Painter on 29/08/2024.
//

import Accelerate
import Foundation

/// Convolution.
/// - Parameters:
///   - x: Real array.
///   - y: Real array
/// - Returns: The result of the convolution.
public func conv(_ x: RealArray, _ y: RealArray) -> RealArray {
    let N = length(x) + length(y) - 1
    let M = Int(2 ** nextpow2(N))

    // Zero pad both signals to length M
    let xx = paddata(x, M)
    let yy = paddata(y, M)

    // Perform FFT on both signals
    let X = fftr(xx)
    let Y = fftr(yy)

    // Multiply in frequency domain
    // Note: For convolution, we don't take the conjugate like in xcorr
    let Z = X * Y

    // Perform inverse FFT
    var z = ifftr(Z)

    // Take only the first N points (valid convolution length)
    z = Array(z[0 ..< N])

    return z
}

public func convSimple(_ x: RealArray, _ y: RealArray) -> RealArray {
    // The resulting convolution array will have a size of (x.count + y.count - 1)
    let n = x.count
    let m = y.count
    let resultSize = n + m - 1
    var result = [Real](repeating: 0.0, count: resultSize)

    // Brute-force convolution
    for i in 0..<n {
        for j in 0..<m {
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
