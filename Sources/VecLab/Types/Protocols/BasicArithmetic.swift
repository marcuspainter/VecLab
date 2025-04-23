//
//  BasicMath.swift
//  VecLab
//
//  Created by Marcus Painter on 21/04/2025.
//

import Foundation

/// Supports  basic arithmetic operations.
/// `+`,` -`, `*` and `\`

public protocol DivisionArithmetic {
    static func / (lhs: Self, rhs: Self) -> Self
}

public protocol BasicArithmetic: AdditiveArithmetic, Numeric, SignedNumeric, DivisionArithmetic {
    // AdditiveArithmetic
    static func + (lhs: Self, rhs: Self) -> Self
    static func - (lhs: Self, rhs: Self) -> Self

    // Numeric
    static func * (lhs: Self, rhs: Self) -> Self

    // SignedNumeric
    static prefix func - (lhs: Self) -> Self

    // No protocol for division
    static func / (lhs: Self, rhs: Self) -> Self
}

/*
 
// Add these to types
extension Float: BasicArithmetic {}
extension Double: BasicArithmetic {}
extension Int: BasicArithmetic {}
extension Decimal: BasicArithmetic {}
extension ComplexNumber: BasicArithmetic {}
*/
