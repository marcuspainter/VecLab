//
//  DoubleArray+Math+Assignment.swift
//  VecLab
//
//  Created by Marcus Painter on 11/05/2025.
//

extension Array where Element == Double {

    /// Addition.
    /// - Parameters:
    ///   - lhs: This real array.
    ///   - rhs: A real value.
    public static func += (lhs: inout [Double], rhs: Double) {
        lhs = lhs + rhs
    }

    /// Subtraction.
    /// - Parameters:
    ///   - lhs: This real array.
    ///   - rhs: A real array..
    public static func -= (lhs: inout [Double], rhs: [Double]) {
        lhs = lhs - rhs
    }

    /// Subtraction.
    /// - Parameters:
    ///   - lhs: This real array.
    ///   - rhs: A real value.
    public static func -= (lhs: inout [Double], rhs: Double) {
        lhs = lhs - rhs
    }

    /// Multiplication'.
    /// - Parameters:
    ///   - lhs: This real array.
    ///   - rhs: A real array..
    public static func *= (lhs: inout [Double], rhs: [Double]) {
        lhs = lhs * rhs
    }

    /// Multiplication'.
    /// - Parameters:
    ///   - lhs: This real array.
    ///   - rhs: A real value.
    public static func *= (lhs: inout [Double], rhs: Double) {
        lhs = lhs * rhs
    }

    /// Division.
    /// - Parameters:
    ///   - lhs: This real array.
    ///   - rhs: A real array..
    public static func /= (lhs: inout [Double], rhs: [Double]) {
        lhs = lhs / rhs
    }

    /// Division.
    /// - Parameters:
    ///   - lhs: This real array.
    ///   - rhs: A real value.
    public static func /= (lhs: inout [Double], rhs: Double) {
        lhs = lhs / rhs
    }

}
