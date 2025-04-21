//
//  VectorMath.swift
//  VecLab
//
//  Created by Marcus Painter on 21/04/2025.
//

import Foundation

extension Array where Element: BasicMath {
    
    // Stop concatenation
    public static func += (lhs: inout Self, rhs: Self) {
        lhs = lhs + rhs
    }
    
    /// Array addition.
    /// - Parameters:
    ///   - a: An array.
    ///   - b: An array.
    /// - Returns: The result of the addition.
    public static func + (a: Self, b: Self) -> [Element] {
        assert(a.count == b.count,
               "Incompatible sizes \(a.count) \(b.count). Use cat() to join arrays.", file: #file, line: #line)
        return zip(a, b).map { $0 + $1 }
    }
    
    // MARK: Subtraction
    
    /// Array subtraction.
    /// - Parameters:
    ///   - a: An array.
    ///   - b: An array.
    /// - Returns: The result of the subtraction.
    public static func - (a: Self, b: Self) -> [Element] {
        assertSameSize(a, b)
        return zip(a, b).map { $0 - $1 }
    }
    
    // MARK: Subtraction

    /// Array multiplication.
    /// - Parameters:
    ///   - a: An array.
    ///   - b: An array.
    /// - Returns: The result of the division.
    public static func * (a: Self, b: Self) -> [Element] {
        assertSameSize(a, b)
        return zip(a, b).map { $0 * $1 }
    }

    // MARK: Divsion
    
    /// Array division.
    /// - Parameters:
    ///   - a: An array.
    ///   - b: An array.
    /// - Returns: The result of the division.
    public static func / (a: Self, b: Self) -> [Element] {
        assertSameSize(a, b)
        return zip(a, b).map { $0 / $1 }
    }

    /// Element addition.
    /// - Parameters:
    ///   - a: An array.
    ///   - b: An Element.
    /// - Returns: The result of the addition.
    public static func + (a: Self, b: Element) -> [Element] {
        return a.map { $0 + b }
    }

    /// Element addition.
    /// - Parameters:
    ///   - a: An Element.
    ///   - b: An array.
    /// - Returns: The result of the addition.
    public static func + (a: Element, b: Self) -> [Element] {
        return b.map { a + $0 }
    }

    /// Element subtraction.
    /// - Parameters:
    ///   - a: An array.
    ///   - b: An Element.
    /// - Returns: The result of the subtraction.
    public static func - (a: Self, b: Element) -> [Element] {
        return a.map { $0 - b }
    }

    /// Element subtraction.
    /// - Parameters:
    ///   - a: An Element.
    ///   - b: An array.
    /// - Returns: The result of the subtraction.
    public static func - (a: Element, b: Self) -> [Element] {
        return b.map { a - $0 }
    }

    /// Element multiplication.
    /// - Parameters:
    ///   - a: An array.
    ///   - b: An Element..
    /// - Returns: The result of the multiplication.
    public static func * (a: Self, b: Element) -> [Element] {
        return a.map { $0 * b }
    }

    /// Element multiplication.
    /// - Parameters:
    ///   - a: An Element..
    ///   - b: An array.
    /// - Returns: The result of the multiplication.
    public static func * (a: Element, b: Self) -> [Element] {
        return b.map { a * $0 }
    }

    /// Element division.
    /// - Parameters:
    ///   - a: An array.
    ///   - b: An Element..
    /// - Returns: The result of the division.
    public static func / (a: Self, b: Element) -> [Element] {
        return a.map { $0 / b }
    }

    /// Element division.
    /// - Parameters:
    ///   - a: An Element..
    ///   - b: An array.
    /// - Returns: The result of the division.
    public static func / (a: Element, b: Self) -> [Element] {
        return b.map { a / $0 }
    }
    
    // MARK: Unary minus
    
    /// Unary minus.
    /// - Parameter a: Real array.
    /// - Returns: The result of -a
    public static prefix func - (a: Self) -> [Element] {
        return a.map { -$0 }
    }
}

