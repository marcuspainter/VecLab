//
//  DoubleArray+Math+Self.swift
//  VecLab
//
//  Created by Marcus Painter on 23/04/2025.
//

import Accelerate

extension Array where Element == Double {
    
    /// Double addition.
    ///
    ///- Note: This overrides the default Swift `Array` behaviour does not append arrays.
    ///  Use the `append()` or `cat()` functions.
    /// - Parameters:
    ///   - a: Double array.
    ///   - b: Double array.
    /// - Returns: The result of the addition.
    public static func + (a: Self, b: Self) -> [Double] {
        assert(a.count == b.count,
               "Incompatible sizes \(a.count) \(b.count). Use cat() to join arrays.", file: #file, line: #line)
        return vDSP.add(a, b)
    }
    
    ///  Array addition.
    /// - Parameters:
    ///   - lhs: Double array.
    ///   - rhs:  Double array.
    public static func += (lhs: inout Self, rhs: [Double]) {
        lhs = lhs + rhs
    }

    /// Double subtraction.
    /// - Parameters:
    ///   - a: Double array.
    ///   - b: Double array.
    /// - Returns: The result of the subtraction.
    public static func - (a: Self, b: Self) -> [Double] {
        validateSize(a, b)
        return vDSP.subtract(a, b)
    }

    /// Double multiplication.
    /// - Parameters:
    ///   - a: Double array.
    ///   - b: Double array.
    /// - Returns: The result of the multiplication.
    public static func * (a: Self, b: Self) -> [Double] {
        validateSize(a, b)
        return vDSP.multiply(a, b)
    }
    
    /// Double division.
    /// - Parameters:
    ///   - a: Double array.
    ///   - b: Double array.
    /// - Returns: The result of the division.
    public static func / (a: Self, b: Self) -> [Double] {
        validateSize(a, b)
        return vDSP.divide(a, b)
    }
    
    // MARK: Double
    
    /// Real addition.
    /// - Parameters:
    ///   - a: Real array.
    ///   - b: Real number.
    /// - Returns: The result of the addition.
    public static func + (a: Self, b: Double) -> [Double] {
        return vDSP.add(b, a)
    }

    /// Real addition.∫
    /// - Parameters:
    ///   - a: Real number.
    ///   - b: Real array.
    /// - Returns: The result of the addition.
    public static func + (a: Double, b: Self) -> [Double] {
        return vDSP.add(a, b)
    }

    /// Real subtraction.
    /// - Parameters:
    ///   - a: Real array.
    ///   - b: Real number.
    /// - Returns: The result of the subtraction.
    public static func - (a:Self, b: Double) -> [Double] {
        let minusb = -b
        return vDSP.add(minusb, a)
    }

    /// Real subtraction.
    /// - Parameters:
    ///   - a: Real number.
    ///   - b: Real array.
    /// - Returns: The result of the subtraction
    public static func - (a: Double, b: Self) -> [Double] {
        let minusb = -b
        return vDSP.add(a, minusb)
    }

    /// Real multiplication.
    /// - Parameters:
    ///   - a: Real array.
    ///   - b: Double number.
    /// - Returns: The result of the multiplication.
    public static func * (a: Self, b: Double) -> [Double] {
        return vDSP.multiply(b, a)
    }

    /// Real multiplication.
    /// - Parameters:
    ///   - a: Real number..
    ///   - b: Real array.
    /// - Returns: The result of the multiplication.
    public static func * (a: Double, b: Self) -> [Double] {
        return vDSP.multiply(a, b)
    }

    /// Real division.
    /// - Parameters:
    ///   - a: Real array.
    ///   - b: Real number.
    /// - Returns: The result of the division.
    public static func / (a: Self, b: Double) -> [Double] {
        return vDSP.divide(a, b)
    }

    /// Double division.
    /// - Parameters:
    ///   - a: Real number
    ///   - b: Real array
    /// - Returns: The result of the division
    public static func / (a: Double, b: Self) -> [Double] {
        return vDSP.divide(a, b)
    }
    
    // MARK: Unary minus
    
    /// Unary minus.
    /// - Parameter a: Real array.
    /// - Returns: The result of -a
    public static prefix func - (a: Self) -> [Double] {
        return vDSP.negative(a)
    }
    
}

