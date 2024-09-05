//
//  mod.swift
//
//
//  Created by Marcus Painter on 09/09/2023.
//

import Foundation

/// Remainder after division (modulo operation).
///
/// Returns the remainder after division of  'a' by `m`, where `a` is the dividend and `m` is the divisor.
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

// MARK: Double

/// Remainder after division (modulo operation).
///
/// Returns the remainder after division of 'a' by `m`, where `a` is the dividend and `m` is the divisor.
/// This function is often called the modulo operation, which can be expressed as `b = a - m.*floor(a./m)`.
///
/// The mod function follows the convention that `mod(a,0)` returns `a`.
///
///
/// - Parameters:
///   - a: Dividend.
///   - b: Divisor.
/// - Returns: The remainder after division.
public func mod(_ a: RealDouble, _ b: RealDouble) -> RealDouble {
    let result = a - b * floor(a / b)
    return result
}

/// Remainder after division (modulo operation).
///
/// Returns the remainder after division of 'a' by `m`, where `a` is the dividend and `m` is the divisor.
/// This function is often called the modulo operation, which can be expressed as `b = a - m.*floor(a./m)`.
///
/// The mod function follows the convention that `mod(a,0)` returns `a`.
///
///
/// - Parameters:
///   - a: Dividend.
///   - b: Divisor.
/// - Returns: The remainder after division.
public func mod(_ a: RealDoubleArray, _ b: RealDoubleArray) -> RealDoubleArray {
    return zip(a, b).map { mod($0, $1) }
}

// MARK: Float

/// Remainder after division (modulo operation).
///
/// Returns the remainder after division of 'a' by `m`, where `a` is the dividend and `m` is the divisor.
/// This function is often called the modulo operation, which can be expressed as `b = a - m.*floor(a./m)`.
///
/// The mod function follows the convention that `mod(a,0)` returns `a`.
///
///
/// - Parameters:
///   - a: Dividend.
///   - b: Divisor.
/// - Returns: The remainder after division.
public func mod(_ a: RealFloat, _ b: RealFloat) -> RealFloat {
    let result = a - b * floor(a / b)
    return result
}

/// Remainder after division (modulo operation).
///
/// Returns the remainder after division of 'a' by `m`, where `a` is the dividend and `m` is the divisor.
/// This function is often called the modulo operation, which can be expressed as `b = a - m.*floor(a./m)`.
///
/// The mod function follows the convention that `mod(a,0)` returns `a`.
///
///
/// - Parameters:
///   - a: Dividend.
///   - b: Divisor.
/// - Returns: The remainder after division.
public func mod(_ a: RealFloatArray, _ b: RealFloatArray) -> RealFloatArray {
    return zip(a, b).map { mod($0, $1) }
}

