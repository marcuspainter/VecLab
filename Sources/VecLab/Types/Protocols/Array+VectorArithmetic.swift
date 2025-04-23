//
//  VectorMath.swift
//  VecLab
//
//  Created by Marcus Painter on 21/04/2025.
//

import Foundation

/*
extension Array: VectorArithmetic where Element: BasicArithmetic {

    /// Double addition.
    ///
    ///- Note: This overrides the default Swift `Array` behaviour does not append arrays.
    ///  Use the `append()` or `cat()` functions.
    /// - Parameters:
    ///   - a: Double array.
    ///   - b: Double array.
    /// - Returns: The result of the addition.
    public static func + (a: Self, b: Self) -> [Element] {
        assert(a.count == b.count,
               "Incompatible sizes \(a.count) \(b.count). Use cat() to join arrays.", file: #file, line: #line)
        return zip(a, b).map { $0 + $1 }
    }
    
    ///  Array addition.
    /// - Parameters:
    ///   - lhs: An array.
    ///   - rhs:  An array.
    public static func += (lhs: inout Self, rhs: Self) {
        lhs = lhs + rhs
    }

    /// Double subtraction.
    /// - Parameters:
    ///   - a: Double array.
    ///   - b: Double array.
    /// - Returns: The result of the subtraction.
    public static func - (a: Self, b: Self) -> [Element] {
        assertSameSize(a, b)
        return zip(a, b).map { $0 - $1 }
    }

    /// Double multiplication.
    /// - Parameters:
    ///   - a: Double array.
    ///   - b: Double array.
    /// - Returns: The result of the multiplication.
    public static func * (a: Self, b: Self) -> [Element] {
        assertSameSize(a, b)
        print("Double * Double")
        return zip(a, b).map { $0 * $1 }
    }
    
    /// Double division.
    /// - Parameters:
    ///   - a: Double array.
    ///   - b: Double array.
    /// - Returns: The result of the division.
    public static func / (a: Self, b: Self) -> [Element] {
        assertSameSize(a, b)
        return zip(a, b).map { $0 / $1 }
    }
    
    // MARK: Double
    
    /// Real addition.
    /// - Parameters:
    ///   - a: Real array.
    ///   - b: Real number.
    /// - Returns: The result of the addition.
    public static func + (a: Self, b: Element) -> [Element] {
        return a.map { $0 + b }
    }

    /// Real addition.∫
    /// - Parameters:
    ///   - a: Real number.
    ///   - b: Real array.
    /// - Returns: The result of the addition.
    public static func + (a: Element, b: Self) -> [Element] {
        return b.map { a + $0 }
    }

    /// Real subtraction.
    /// - Parameters:
    ///   - a: Real array.
    ///   - b: Real number.
    /// - Returns: The result of the subtraction.
    public static func - (a:Self, b: Element) -> [Element] {
        return a.map { $0  - b }
    }

    /// Real subtraction.
    /// - Parameters:
    ///   - a: Real number.
    ///   - b: Real array.
    /// - Returns: The result of the subtraction
    public static func - (a: Element, b: Self) -> [Element] {
        return b.map { a - $0 }
    }

    /// Real multiplication.
    /// - Parameters:
    ///   - a: Real array.
    ///   - b: Double number.
    /// - Returns: The result of the multiplication.
    public static func * (a: Self, b: Element) -> [Element] {
        return a.map { $0 * b }
    }

    /// Real multiplication.
    /// - Parameters:
    ///   - a: Real number..
    ///   - b: Real array.
    /// - Returns: The result of the multiplication.
    public static func * (a: Element, b: Self) -> [Element] {
        return b.map { a * $0 }
    }

    /// Real division.
    /// - Parameters:
    ///   - a: Real array.
    ///   - b: Real number.
    /// - Returns: The result of the division.
    public static func / (a: Self, b: Element) -> [Element] {
        return a.map { $0 / b }
    }

    /// Double division.
    /// - Parameters:
    ///   - a: Real number
    ///   - b: Real array
    /// - Returns: The result of the division
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
*/
