//
//  Array+Extensions.swift
//  VecLab
//
//  Created by Marcus Painter on 18/04/2025.
//

import Accelerate

extension Array where Element == Double {
    
    /// Double addition.
    /// - Parameters:
    ///   - a: Double array.
    ///   - b: Double array.
    /// - Returns: The result of the addition.
    public static func + (a: [Double], b: [Double]) -> [Double] {
        assert(a.count == b.count,
               "Incompatible sizes \(a.count) \(b.count). Use cat() to join arrays.", file: #file, line: #line)
        return vDSP.add(a, b)
    }
    
    /// Double subtraction.
    /// - Parameters:
    ///   - a: Double array.
    ///   - b: Double array.
    /// - Returns: The result of the subtraction.
    public static func - (a: [Double], b: [Double]) -> [Double] {
        assertSameSize(a, b)
        return vDSP.subtract(a, b)
    }
    
    /// Double multiplication.
    /// - Parameters:
    ///   - a: Double array.
    ///   - b: Double array.
    /// - Returns: The result of the multiplication.
    public static func * (a: [Double], b: [Double]) -> [Double] {
        assertSameSize(a, b)
        return vDSP.multiply(a, b)
    }
}

extension Array where Element == Double {
    
    /// Double addition.
    /// - Parameters:
    ///   - a: Double array.
    ///   - b: Double number.
    /// - Returns: The result of the addition.
    public static func + (a: [Double], b: Double) -> [Double] {
        return vDSP.add(b, a)
    }
    
    /// Double addition.
    /// - Parameters:
    ///   - a: Double number.
    ///   - b: Double array.
    /// - Returns: The result of the addition.
    public static func + (a: Double, b: [Double]) -> [Double] {
        return vDSP.add(a, b)
    }
    
    /// Double subtraction.
    /// - Parameters:
    ///   - a: Double array.
    ///   - b: Double number.
    /// - Returns: The result of the subtraction.
    public static func - (a: [Double], b: Double) -> [Double] {
        let minusb = -b
        return vDSP.add(minusb, a)
    }

    /// Double subtraction.
    /// - Parameters:
    ///   - a: Double number.
    ///   - b: Double array.
    /// - Returns: The result of the subtraction
    public static func - (a: Double, b: [Double]) -> [Double] {
        let minusb = -b
        return vDSP.add(a, minusb)
    }
    
    /// Multiplication.
    /// - Parameters:
    ///   - a: Double array.
    ///   - b: Double number.
    /// - Returns: The result of the multiplication.
    public static func * (a: [Double], b: Double) -> [Double] {
        return vDSP.multiply(b, a)
    }

    /// Multiplication.
    /// - Parameters:
    ///   - a: Double number..
    ///   - b: Double array.
    /// - Returns: The result of the multiplication.
    public static func * (a: Double, b: [Double]) -> [Double] {
        return vDSP.multiply(a, b)
    }
    
    /// Double division.
    /// - Parameters:
    ///   - a: Double array.
    ///   - b: Double array.
    /// - Returns: The result of the division.
    public static func / (a: [Double], b: [Double]) -> [Double] {
        assertSameSize(a, b)
        return vDSP.divide(a, b)
    }

    /// Double division.
    /// - Parameters:
    ///   - a: Double array.
    ///   - b: Double number.
    /// - Returns: The result of the division.
    public static func / (a: [Double], b: Double) -> [Double] {
        return vDSP.divide(a, b)
    }

    /// Double division.
    /// - Parameters:
    ///   - a: Double number
    ///   - b: Double array
    /// - Returns: The result of the division
    public static func / (a: Double, b: [Double]) -> [Double] {
        return vDSP.divide(a, b)
    }
}
