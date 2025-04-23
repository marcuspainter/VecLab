//
//  Array+VectorFloatArithmetic.swift
//  VecLab
//
//  Created by Marcus Painter on 22/04/2025.
//

import Accelerate

/*
extension Array where Element == Float {
    
    // This must be overridden to prevent concatenation by append.
    // Uses + operator from BasicMath element.
    
    /// Array addition.
    /// - Parameters:
    ///   - a: An array.
    ///   - b: An array.
    /// - Returns: The result of the addition.
    public static func + (a: Self, b: Self) -> [Element] {
        assert(a.count == b.count,
               "Incompatible sizes \(a.count) \(b.count). Use cat() to join arrays.", file: #file, line: #line)
        print("Float + Float")
        return vDSP.add(a,b)
    }
    
    // This must also be overridden to prevent concatenation by append.
    // Uses the math + operator defined above.

    ///  Array addition.
    /// - Parameters:
    ///   - lhs: An array.
    ///   - rhs:  An array.
    public static func += (lhs: inout  Self, rhs: [Element]) {
        print("Float +=")
        lhs = lhs + rhs  // Overloaded
    }

    // MARK: Subtraction

    /// Array subtraction.
    /// - Parameters:
    ///   - a: An array.
    ///   - b: An array.
    /// - Returns: The result of the subtraction.
    public static func - (a: Self, b: Self) -> [Element] {
        assertSameSize(a, b)
        return vDSP.subtract(a,b)
    }

    // MARK: Subtraction

    /// Array multiplication.
    /// - Parameters:
    ///   - a: An array.
    ///   - b: An array.
    /// - Returns: The result of the division.
    public static func * (a: Self, b: Self) -> [Element] {
        assertSameSize(a, b)
        print("Float * Float")
        return vDSP.multiply(a, b)
    }

    // MARK: Division

    /// Array division.
    /// - Parameters:
    ///   - a: An array.
    ///   - b: An array.
    /// - Returns: The result of the division.
    public static func / (a: Self, b: Self) -> [Element] {
        assertSameSize(a, b)
        return vDSP.divide(a, b)
    }
    // MARK: Double
    
    /// Real addition.
    /// - Parameters:
    ///   - a: Real array.
    ///   - b: Real number.
    /// - Returns: The result of the addition.
    public static func + (a: Self, b: Element) -> [Element] {
        return vDSP.add(b, a)
    }

    /// Real addition.∫
    /// - Parameters:
    ///   - a: Real number.
    ///   - b: Real array.
    /// - Returns: The result of the addition.
    public static func + (a: Element, b: Self) -> [Element] {
        return vDSP.add(a, b)
    }

    /// Real subtraction.
    /// - Parameters:
    ///   - a: Real array.
    ///   - b: Real number.
    /// - Returns: The result of the subtraction.
    public static func - (a:Self, b: Element) -> [Element] {
        let minusb = -b
        return vDSP.add(minusb, a)
    }

    /// Real subtraction.
    /// - Parameters:
    ///   - a: Real number.
    ///   - b: Real array.
    /// - Returns: The result of the subtraction
    public static func - (a: Element, b: Self) -> [Element] {
        let minusb = -b
        return vDSP.add(a, minusb)
    }

    /// Real multiplication.
    /// - Parameters:
    ///   - a: Real array.
    ///   - b: Double number.
    /// - Returns: The result of the multiplication.
    public static func * (a: Self, b: Element) -> [Element] {
        return vDSP.multiply(b, a)
    }

    /// Real multiplication.
    /// - Parameters:
    ///   - a: Real number..
    ///   - b: Real array.
    /// - Returns: The result of the multiplication.
    public static func * (a: Element, b: Self) -> [Element] {
        return vDSP.multiply(a, b)
    }

    /// Real division.
    /// - Parameters:
    ///   - a: Real array.
    ///   - b: Real number.
    /// - Returns: The result of the division.
    public static func / (a: Self, b: Element) -> [Element] {
        return vDSP.divide(a, b)
    }

    /// Double division.
    /// - Parameters:
    ///   - a: Real number
    ///   - b: Real array
    /// - Returns: The result of the division
    public static func / (a: Element, b: Self) -> [Element] {
        return vDSP.divide(a, b)
    }
    
    // MARK: Unary minus
    
    /// Unary minus.
    /// - Parameter a: Real array.
    /// - Returns: The result of -a
    public static prefix func - (a: Self) -> [Element] {
        return vDSP.negative(a)
    }
    
}
*/

