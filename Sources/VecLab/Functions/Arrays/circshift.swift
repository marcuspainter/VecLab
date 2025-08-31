//
//  circshift.swift
//
//
//  Created by Marcus Painter on 11/09/2023.
//

import Foundation

/// Circularly shift array.
/// - Parameters:
///   - x: Input array.
///   - k: Shift amount.
/// - Returns: Circularly shifted array
public func circshift(_ x: RealArray, _ k: Int) -> RealArray {
    let n = x.count
    if n == 0 { return x } // Edge case: empty array
    let shift = ((k % n) + n) % n
    if shift == 0 { return x } // Edge case: no effective shift

    let part1 = x[(n - shift) ..< n]   // Last `shift` elements
    let part2 = x[0 ..< (n - shift)]   // First `n-shift` elements

    return cat(part1, part2)
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
