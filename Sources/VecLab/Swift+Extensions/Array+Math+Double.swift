//
//  Array+Math+Double.swift
//  VecLab
//
//  Created by Marcus Painter on 19/04/2025.
//

import Accelerate

extension Array where Element == Double {

    /// Real addition.
    /// - Parameters:
    ///   - a: Real array.
    ///   - b: Real number.
    /// - Returns: The result of the addition.
    public static func + (a: [Double], b: Double) -> [Double] {
        return vDSP.add(b, a)
    }

    /// Real addition.
    /// - Parameters:
    ///   - a: Real number.
    ///   - b: Real array.
    /// - Returns: The result of the addition.
    public static func + (a: Double, b: [Double]) -> [Double] {
        return vDSP.add(a, b)
    }

    /// Real subtraction.
    /// - Parameters:
    ///   - a: Real array.
    ///   - b: Real number.
    /// - Returns: The result of the subtraction.
    public static func - (a: [Double], b: Double) -> [Double] {
        let minusb = -b
        return vDSP.add(minusb, a)
    }

    /// Real subtraction.
    /// - Parameters:
    ///   - a: Real number.
    ///   - b: Real array.
    /// - Returns: The result of the subtraction
    public static func - (a: Double, b: [Double]) -> [Double] {
        let minusb = -b
        return vDSP.add(a, minusb)
    }

    /// Real multiplication.
    /// - Parameters:
    ///   - a: Real array.
    ///   - b: Double number.
    /// - Returns: The result of the multiplication.
    public static func * (a: [Double], b: Double) -> [Double] {
        return vDSP.multiply(b, a)
    }

    /// Real multiplication.
    /// - Parameters:
    ///   - a: Real number..
    ///   - b: Real array.
    /// - Returns: The result of the multiplication.
    public static func * (a: Double, b: [Double]) -> [Double] {
        return vDSP.multiply(a, b)
    }

    /// Real division.
    /// - Parameters:
    ///   - a: Real array.
    ///   - b: Real array.
    /// - Returns: The result of the division.
    public static func / (a: [Double], b: [Double]) -> [Double] {
        assertSameSize(a, b)
        return vDSP.divide(a, b)
    }

    /// Real division.
    /// - Parameters:
    ///   - a: Real array.
    ///   - b: Real number.
    /// - Returns: The result of the division.
    public static func / (a: [Double], b: Double) -> [Double] {
        return vDSP.divide(a, b)
    }

    /// Double division.
    /// - Parameters:
    ///   - a: Real number
    ///   - b: Real array
    /// - Returns: The result of the division
    public static func / (a: Double, b: [Double]) -> [Double] {
        return vDSP.divide(a, b)
    }
}
