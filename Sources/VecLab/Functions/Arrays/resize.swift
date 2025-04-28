//
//  resize.swift
//
//
//  Created by Marcus Painter on 18/09/2023.
//

import Foundation

/// Resize data by adding or removing elements.
/// - Parameters:
///   - x: Input array
///   - m: Length.
/// - Returns: Array of new length.
public func resize(_ x: RealArray, length m: Int) -> RealArray {
    let n = x.count
    guard m != n else { return x }
    var y = x
    if m < n {
        return slice(x, 0 ..< m)
    } else {
        let zeroCount = m - n
        let zeros = RealArray(repeating: 0, count: zeroCount)
        y.append(contentsOf: zeros)
    }
    return y
}

/// Resize data by adding or removing elements.
/// - Parameters:
///   - x: Input array
///   - m: Length.
/// - Returns: Array of new length m.
public func resize(_ x: ComplexArray, length m: Int) -> ComplexArray {
    validateSize(x)
    let n = x.count
    guard m != n else { return x }
    var y = x
    if m < n {
        return slice(x, 0 ..< m)
    } else {
        let zeroCount = m - n
        let zeros = ComplexArray(count: zeroCount)
        y.append(contentsOf: zeros)
    }
    return y
}
