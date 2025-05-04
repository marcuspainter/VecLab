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
///   - m: Length..
/// - Returns: Array padded to length m.
public func paddata(_ x: RealArray, length m: Int) -> RealArray {
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
///   - m: Length.
/// - Returns: Array padded to length m.
public func paddata(_ x: ComplexArray, length m: Int) -> ComplexArray {
    validateSize(x)
    let n = x.count
    var y = x
    if m > n {
        let zeroCount = m - n
        let zeros = ComplexArray(count: zeroCount)
        y.append(contentsOf: zeros)
    }
    return y
}
