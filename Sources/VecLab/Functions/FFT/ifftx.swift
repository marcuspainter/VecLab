//
//  ifftx.swift
//
//
//  Created by Marcus Painter on 15/09/2023.
//

import Foundation

/// Recursive inverse FFT of real array.
/// - Parameter x: Real array.
/// - Returns: Complex array result.
public func ifftx(_ x: ComplexArray) -> ComplexArray {
    assertSameSize(x)
    let n = length(x)
    let invN = 1.0 / Real(n)
    let omega = exp(2 * Real.pi * Real.i / Real(n)) // IFFT +i
    if rem(n, 2) == 0 {
        // Recursive divide and conquer.
        let k = RealArray(0 ... (n / 2 - 1))
        let w = omega ** k
        let u = fftx(slice(x, 0 ..< n - 1, 2))
        let v = w * fftx(slice(x, 1 ..< n, 2))
        return cat(u + v, u - v) * invN // IFFT
    } else {
        return x * invN
    }
}
