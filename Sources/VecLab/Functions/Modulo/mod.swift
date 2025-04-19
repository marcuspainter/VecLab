//
//  mod.swift
//
//
//  Created by Marcus Painter on 09/09/2023.
//

import Foundation

/// Remainder after division (modulo operation).
///
/// Returns the remainder after division of  `a` by `m`, where `a` is the dividend and `m` is the divisor.
/// This function is often called the modulo operation, which can be expressed as `b = a - m.*floor(a./m)`.
///
/// The mod function follows the convention that `mod(a,0)` returns `a`.
///
///
/// - Parameters:
///   - a: Dividend.
///   - b: Divisor.
/// - Returns: The remainder after division.
public func mod(_ a: Int, _ b: Int) -> Int {
    let result = a - b * (a / b)
    return result
}

/// Remainder after division (modulo operation).
///
/// Returns the remainder after division of `a` by `m`, where `a` is the dividend and `m` is the divisor.
/// This function is often called the modulo operation, which can be expressed as `b = a - m.*floor(a./m)`.
///
/// The mod function follows the convention that `mod(a,0)` returns `a`.
///
///
/// - Parameters:
///   - a: Dividend.
///   - b: Divisor.
/// - Returns: The remainder after division.
public func mod(_ a: Real, _ b: Real) -> Real {
    let result = a - b * floor(a / b)
    return result
}

/// Remainder after division (modulo operation).
///
/// Returns the remainder after division of `a` by `m`, where `a` is the dividend and `m` is the divisor.
/// This function is often called the modulo operation, which can be expressed as `b = a - m.*floor(a./m)`.
///
/// The mod function follows the convention that `mod(a,0)` returns `a`.
///
///
/// - Parameters:
///   - a: Dividend.
///   - b: Divisor.
/// - Returns: The remainder after division.
public func mod(_ a: RealArray, _ b: RealArray) -> RealArray {
    return zip(a, b).map { mod($0, $1) }
}
