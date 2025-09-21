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
public func trimdata(_ x: RealArray, length m: Int) -> RealArray {
    let n = x.count
    if m < n {
        return x[0..<m]
    }
    return x
}

/// Trim data by removing elements.
/// - Parameters:
///   - x: Complex array.
///   - m: New size.
/// - Returns: Trimmed array.
public func trimdata(_ x: SplitComplexArray, length m: Int) -> SplitComplexArray {
    validateSize(x)
    let n = x.count
    if m < n {
        return x[0..<m]
    }
    return x
}

/// Trim data by removing elements.
/// - Parameters:
///   - x: Complex array.
///   - m: New size.
/// - Returns: Trimmed array.
public func trimdata(_ x: ComplexArray, length m: Int) -> ComplexArray {
    let n = x.count
    if m < n {
        return Array(x[0..<m])
    }
    return x
}
