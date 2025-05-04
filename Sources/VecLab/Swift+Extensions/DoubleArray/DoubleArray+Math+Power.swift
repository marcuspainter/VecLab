//
//  DoubleArray+Math+Power.swift
//  VecLab
//
//  Created by Marcus Painter on 18/04/2025.
//

import Accelerate

extension Array where Element == Double {

    /// Real Power.
    /// - Parameters:
    ///   - a: Real array.
    ///   - b: Real array.
    /// - Returns: Raises `a` to the power of `b`.
    public static func ** (_ a: [Double], _ b: [Double]) -> [Double] {
        return pow(a, b)
    }

    /// Real Power.
    /// - Parameters:
    ///   - a: Real array.
    ///   - b: Real number.
    /// - Returns: Raises `a` to the power of `b`.
    public static func ** (_ a: [Double], _ b: Double) -> [Double] {
        return pow(a, b)
    }

    /// Real Power.
    /// - Parameters:
    ///   - a: Real number.
    ///   - b: Real array.
    /// - Returns: Raises `a` to the power of `b`.
    public static func ** (_ a: Double, _ b: [Double]) -> [Double] {
        return pow(a, b)
    }

    /// Real Power.
    /// - Parameters:
    ///   - a: Real number.
    ///   - b: Integer.
    /// - Returns: Raises `a` to the power of `b`.
    public static func ** (_ a: [Double], _ b: Int) -> [Double] {
        return pow(a, b)
    }

}
