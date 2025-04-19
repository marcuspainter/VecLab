//
//  Array+Math.swift
//  VecLab
//
//  Created by Marcus Painter on 19/04/2025.
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
