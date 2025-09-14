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
    if m > n {
        let zeroCount = m - n
        let zeros = RealArray(repeating: 0, count: zeroCount)
        return cat(x, zeros)
    }
    return x
}


/// Pad complex array with zeros.
/// - Parameters:
///   - x: Input array.
///   - m: Length.
/// - Returns: Array padded to length m.
public func paddata(_ x: SplitComplexArray, length m: Int) -> SplitComplexArray {
    validateSize(x)
    let n = x.count
    if m > n {
        let zeroCount = m - n
        let zeros = SplitComplexArray(count: zeroCount)
        return cat(x, zeros)
    }
    return x
}
