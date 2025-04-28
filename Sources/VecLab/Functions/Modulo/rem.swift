//
//  rem.swift
//  
//
//  Created by Marcus Painter on 09/09/2023.
//

import Foundation

/// Remainder after division.
/// - Parameters:
///   - a: Dividend.
///   - b: Divisor.
/// - Returns: The remainder after division of `a` by` b`, where `a` is the dividend and `b` is the divisor.
public func rem(_ a: Int, _ b: Int) -> Int {
    let result = a - b * (a / b)
    return result
}

/// Remainder after division.
/// - Parameters:
///   - a: Dividend.
///   - b: Divisor.
/// - Returns: The remainder after division of `a` by` b`, where `a` is the dividend and `b` is the divisor. 
public func rem(_ a: Real, _ b: Real) -> Real {
    let result = a - b * trunc(a / b)
    return result
}

/// Remainder after division.
/// - Parameters:
///   - a: Dividend.
///   - b: Divisor.
/// - Returns: The remainder after division of `a` by` b`, where `a` is the dividend and `b` is the divisor.
public func rem(_ a: RealArray, _ b: RealArray) -> RealArray {
    validateSize(a, b)
    return zip(a, b).map { rem($0, $1) }
}
