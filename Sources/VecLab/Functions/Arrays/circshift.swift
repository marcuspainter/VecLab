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
    // Handle negative and > n shifts
    let shift = ((k % n) + n) % n
    var part1 = Array(x[(n - shift) ..< n])
    let part2 = Array(x[0 ..< (n - shift)])
    part1 += part2
    return part1
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
