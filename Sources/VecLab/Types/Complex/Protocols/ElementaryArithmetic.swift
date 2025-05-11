//
//  ElementaryArithmetic.swift
//  VecLab
//
//  Created by Marcus Painter on 10/05/2025.
//

// This adds division and unary minus to arithmetic operators

public protocol ElementaryArithmetic {
    static func + (lhs: Self, rhs: Self) -> Self
    static func - (lhs: Self, rhs: Self) -> Self
    static func * (lhs: Self, rhs: Self) -> Self
    static func / (lhs: Self, rhs: Self) -> Self
    static prefix func - (rhs: Self) -> Self
}
