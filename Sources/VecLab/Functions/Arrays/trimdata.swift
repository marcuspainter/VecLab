//
//  trimdata.swift
//
//
//  Created by Marcus Painter on 18/09/2023.
//

import Foundation

/// Trim data by removing elements.
/// - Parameters:
///   - x: Real array.
///   - m: New size.
/// - Returns: Trimmed array.
public func trimdata(_ x: RealDoubleArray, _ m: Int) -> RealDoubleArray {
    let n = x.count
    if m < n {
        return slice(x, 0 ..< m)
    }
    return x
}

/// Trim data by removing elements.
/// - Parameters:
///   - x: Complex array.
///   - m: New size.
/// - Returns: Trimmed array.
public func trimdata(_ x: ComplexDoubleArray, _ m: Int) -> ComplexDoubleArray {
    let n = x.0.count
    if m < n {
        return slice(x, 0 ..< m)
    }
    return x
}

// MARK: Float

/// Trim data by removing elements.
/// - Parameters:
///   - x: Real array.
///   - m: New size.
/// - Returns: Trimmed array.
public func trimdata(_ x: RealFloatArray, _ m: Int) -> RealFloatArray {
    let n = x.count
    if m < n {
        return slice(x, 0 ..< m)
    }
    return x
}

/// Trim data by removing elements.
/// - Parameters:
///   - x: Complex array.
///   - m: New size.
/// - Returns: Trimmed array.
public func trimdata(_ x: ComplexFloatArray, _ m: Int) -> ComplexFloatArray {
    let n = x.0.count
    if m < n {
        return slice(x, 0 ..< m)
    }
    return x
}

