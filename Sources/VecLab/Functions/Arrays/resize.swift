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
public func resize(_ x: RealDoubleArray, _ m: Int) -> RealDoubleArray {
    let n = x.count
    guard m != n else { return x }
    var y = x
    if m < n {
        return slice(x, 0 ..< m)
    } else {
        let zeroCount = m - n
        let zeros = RealDoubleArray(repeating: 0, count: zeroCount)
        y.append(contentsOf: zeros)
    }
    return y
}

/// Resize data by adding or removing elements.
/// - Parameters:
///   - x: Input array
///   - m: Size.
/// - Returns: Array of new size.
public func resize(_ x: ComplexDoubleArray, _ m: Int) -> ComplexDoubleArray {
    let n = x.0.count
    guard m != n else { return x }
    var y = x
    if m < n {
        return slice(x, 0 ..< m)
    } else {
        let zeroCount = m - n
        let zeros = RealDoubleArray(repeating: 0, count: zeroCount)
        y.0.append(contentsOf: zeros)
        y.1.append(contentsOf: zeros)
    }
    return y
}

// MARK: Float

/// Resize data by adding or removing elements.
/// - Parameters:
///   - x: Input array
///   - m: Size.
/// - Returns: Array of new size.
public func resize(_ x: RealFloatArray, _ m: Int) -> RealFloatArray {
    let n = x.count
    guard m != n else { return x }
    var y = x
    if m < n {
        return slice(x, 0 ..< m)
    } else {
        let zeroCount = m - n
        let zeros = RealFloatArray(repeating: 0, count: zeroCount)
        y.append(contentsOf: zeros)
    }
    return y
}

/// Resize data by adding or removing elements.
/// - Parameters:
///   - x: Input array
///   - m: Size.
/// - Returns: Array of new size.
public func resize(_ x: ComplexFloatArray, _ m: Int) -> ComplexFloatArray {
    let n = x.0.count
    guard m != n else { return x }
    var y = x
    if m < n {
        return slice(x, 0 ..< m)
    } else {
        let zeroCount = m - n
        let zeros = RealFloatArray(repeating: 0, count: zeroCount)
        y.0.append(contentsOf: zeros)
        y.1.append(contentsOf: zeros)
    }
    return y
}

