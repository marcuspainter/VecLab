//
//  circshift.swift
//
//
//  Created by Marcus Painter on 11/09/2023.
//

import Accelerate
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

    let part1 = Array(x[(n - shift) ..< n])   // Last `shift` elements
    let part2 = Array(x[0 ..< (n - shift)])   // First `n-shift` elements

    return cat(part1, part2)
}

/// Circularly shift complex array.
/// - Parameters:
///   - x: Complex array.
///   - k: Shift amount.
/// - Returns: Circularly shifted array
public func circshift(_ x: ComplexArray, _ k: Int) -> ComplexArray {
    let r = circshift(x.0, k)
    let i = circshift(x.1, k)
    return (r, i)
}
