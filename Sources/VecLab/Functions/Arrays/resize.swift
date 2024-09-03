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
///   - m: Size.
/// - Returns: Array of new size.
public func resize(_ x: RealArray, _ m: Int) -> RealArray {
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
///   - m: Size.
/// - Returns: Array of new size.
public func resize(_ x: ComplexArray, _ m: Int) -> ComplexArray {
    let n = x.0.count
    guard m != n else { return x }
    var y = x
    if m < n {
        return slice(x, 0 ..< m)
    } else {
        let zeroCount = m - n
        let zeros = RealArray(repeating: 0, count: zeroCount)
        y.0.append(contentsOf: zeros)
        y.1.append(contentsOf: zeros)
    }
    return y
}
