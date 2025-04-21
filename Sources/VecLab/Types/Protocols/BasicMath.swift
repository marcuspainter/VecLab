//
//  BasicMath.swift
//  VecLab
//
//  Created by Marcus Painter on 21/04/2025.
//

import Foundation

public protocol BasicMath {
    static func + (lhs: Self, rhs: Self) -> Self
    static func - (lhs: Self, rhs: Self) -> Self
    static func * (lhs: Self, rhs: Self) -> Self
    static func / (lhs: Self, rhs: Self) -> Self
    static prefix func - (lhs: Self) -> Self
}

extension Float: BasicMath {}
extension Int32: BasicMath {}
extension Decimal: BasicMath {}

public protocol VectorFloatingPoint {}

extension Float: VectorFloatingPoint {}
extension Double: VectorFloatingPoint {}
