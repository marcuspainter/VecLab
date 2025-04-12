//
//  paddata.swift
//
//
//  Created by Marcus Painter on 18/09/2023.
//

import Foundation

/// Pad real array with zeros.
/// - Parameters:
///   - x: Input array.
///   - m: Size.
/// - Returns: Array padded to size m
public func paddata(_ x: RealArray, _ m: Int) -> RealArray {
    let n = x.count
    var y = x
    if m > n {
        let zeroCount = m - n
        let zeros = RealArray(repeating: 0, count: zeroCount)
        y.append(contentsOf: zeros)
    }
    return y
}

/// Pad complex array with zeros.
/// - Parameters:
///   - x: Input array.
///   - m: Size.
/// - Returns: Array padded to size m
public func paddata(_ x: ComplexArray, _ m: Int) -> ComplexArray {
    assertSameSize(x)
    let n = x.count
    var y = x
    if m > n {
        let zeroCount = m - n
        let zeros = RealArray(repeating: 0, count: zeroCount)
        y.real.append(contentsOf: zeros)
        y.imag.append(contentsOf: zeros)
    }
    return y
}
