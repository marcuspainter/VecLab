//
//  DoubleArray+Math+Int.swift
//  VecLab
//
//  Created by Marcus Painter on 22/04/2025.
//

import Foundation
import Accelerate

/*

extension Array where Element == Double {
    
    // This is needed because ComplexDouble is Numeric
    
    // MARK: Int
    
    /// Real addition.
    /// - Parameters:
    ///   - a: Real array.
    ///   - b: Real number.
    /// - Returns: The result of the addition.
    public static func + (a: Self, b: Int) -> [Double] {
        let bb = Double(b)
        return vDSP.add(bb, a)
    }

    /// Real addition.∫
    /// - Parameters:
    ///   - a: Real number.
    ///   - b: Real array.
    /// - Returns: The result of the addition.
    public static func + (a: Int, b: Self) -> [Double] {
        let aa = Double(a)
        return vDSP.add(aa, b)
    }

    /// Real subtraction.
    /// - Parameters:
    ///   - a: Real array.
    ///   - b: Real number.
    /// - Returns: The result of the subtraction.
    public static func - (a:Self, b: Int) -> [Double] {
        let minusb = Double(-b)
        return vDSP.add(minusb, a)
    }

    /// Real subtraction.
    /// - Parameters:
    ///   - a: Real number.
    ///   - b: Real array.
    /// - Returns: The result of the subtraction
    public static func - (a: Int, b: Self) -> [Double] {
        let minusb = -b
        let aa = Double(a)
        return vDSP.add(aa, minusb)
    }

    /// Real multiplication.
    /// - Parameters:
    ///   - a: Real array.
    ///   - b: Double number.
    /// - Returns: The result of the multiplication.
    public static func * (a: Self, b: Int) -> [Double] {
        let bb = Double(b)
        return vDSP.multiply(bb, a)
    }

    /// Real multiplication.
    /// - Parameters:
    ///   - a: Real number..
    ///   - b: Real array.
    /// - Returns: The result of the multiplication.
    public static func * (a: Int, b: Self) -> [Double] {
        let aa = Double(a)
        return vDSP.multiply(aa, b)
    }

    /// Real division.
    /// - Parameters:
    ///   - a: Real array.
    ///   - b: Real number.
    /// - Returns: The result of the division.
    public static func / (a: Self, b: Int) -> [Double] {
        let bb = Double(b)
        return vDSP.divide(a, bb)
    }

    /// Double division.
    /// - Parameters:
    ///   - a: Real number
    ///   - b: Real array
    /// - Returns: The result of the division
    public static func / (a: Int, b: Self) -> [Double] {
        let aa = Double(a)
        return vDSP.divide(aa, b)
    }
    
}

*/
