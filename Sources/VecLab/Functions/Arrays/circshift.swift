//
//  circshift.swift
//
//
//  Created by Marcus Painter on 11/09/2023.
//

import Accelerate

/// Circularly shift real array.
/// - Parameters:
///   - x: Real array.
///   - k: Shift amount.
/// - Returns: Circularly shifted array.
public func circshift(_ x: RealArray, _ k: Int) -> RealArray {
    let n = x.count
    if n == 0 { return x }

    let shift = ((k % n) + n) % n
    if shift == 0 { return x }

    return RealArray(unsafeUninitializedCapacity: n) { buffer, initializedCount in
        x.withUnsafeBufferPointer { xPtr in
            let xBase = xPtr.baseAddress!
            let outBase = buffer.baseAddress!

            // Copy last 'shift' elements to the beginning
            cblas_dcopy(__LAPACK_int(shift), xBase + (n - shift), 1, outBase, 1)

            // Copy first 'n - shift' elements after the shifted portion
            cblas_dcopy(__LAPACK_int(n - shift), xBase, 1, outBase + shift, 1)
        }
        initializedCount = n
    }
}

/// Circularly shift complex array.
/// - Parameters:
///   - x: Complex array.
///   - k: Shift amount.
/// - Returns: Circularly shifted array
public func circshift(_ x: ComplexArray, _ k: Int) -> ComplexArray {
    validateSize(x)
    let real = circshift(x.real, k)
    let imag = circshift(x.imag, k)
    return ComplexArray(real, imag)
}
