//
//  DoubleArray+Math.swift
//  VecLab
//
//  Created by Marcus Painter on 24/09/2025.
//

import Accelerate

extension Array where Element == Double {

    /// Double addition.
    ///
    /// - Note: This overrides the default Swift `Array` behaviour does not append arrays.
    ///  Use the `append()` or `cat()` functions.
    /// - Parameters:
    ///   - a: Double array.
    ///   - b: Double array.
    /// - Returns: The result of the addition.
    @inlinable
    public static func + (a: Self, b: Self) -> [Double] {
        assert(a.count == b.count,
            "Incompatible sizes \(a.count) \(b.count). Use cat() to join arrays.",
            file: #file,
            line: #line
        )
        return vDSP.add(a, b)
    }

    /// Double subtraction.
    /// - Parameters:
    ///   - a: Double array.
    ///   - b: Double array.
    /// - Returns: The result of the subtraction.
    @inlinable
    public static func - (a: Self, b: Self) -> [Double] {
        validateSize(a, b)
        return vDSP.subtract(a, b)

    }

    /// Double multiplication.
    /// - Parameters:
    ///   - a: Double array.
    ///   - b: Double array.
    /// - Returns: The result of the multiplication.
    @inlinable
    public static func * (a: Self, b: Self) -> [Double] {
        validateSize(a, b)
        return vDSP.multiply(a, b)
    }

    /// Double division.
    /// - Parameters:
    ///   - a: Double array.
    ///   - b: Double array.
    /// - Returns: The result of the division.
    @inlinable
    public static func / (a: Self, b: Self) -> [Double] {
        validateSize(a, b)
        return vDSP.divide(a, b)
    }

}
