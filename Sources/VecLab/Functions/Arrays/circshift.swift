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

            // Copy last `shift` elements to the beginning
            vDSP_mmovD(
                xBase + (n - shift), // source
                outBase,             // destination
                vDSP_Length(shift),  // number of columns
                1,                   // number of rows
                vDSP_Length(shift),  // source row stride
                vDSP_Length(shift)   // destination row stride
            )

            // Copy first `n - shift` elements after the shifted portion
            vDSP_mmovD(
                xBase,                    // source
                outBase + shift,          // destination
                vDSP_Length(n - shift),   // number of columns
                1,                        // number of rows
                vDSP_Length(n - shift),   // source row stride
                vDSP_Length(n - shift)    // destination row stride
            )
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
    return ComplexArray(circshift(x.real, k), circshift(x.imag, k))
}
