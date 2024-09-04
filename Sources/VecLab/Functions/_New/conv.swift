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
    let fftN = nextpow2(N)
    let xx = paddata(x, fftN)
    let yy = paddata(y, fftN)

    let A = fftr(xx)
    let B = fftr(yy)

    let C = A * B

    var z = ifftr(C)
    z = slice(z, 0 ..< N)
    return z
}

/// Convolution.
/// - Parameters:
///   - x: Complex array.
///   - y: Complex array
/// - Returns: The result of the convolution.
public func conv(_ x: ComplexArray, _ y: ComplexArray) -> ComplexArray {

    let N = length(x) + length(y) - 1
    let fftN = nextpow2(N)
    let xx = paddata(x, fftN)
    let yy = paddata(y, fftN)

    let A = fft(xx)
    let B = fft(yy)

    let C = A * B

    var z = ifft(C)
    z = slice(z, 0 ..< N)
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
