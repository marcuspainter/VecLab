//
//  ComplexArray+Math+Assignment.swift
//  VecLab
//
//  Created by Marcus Painter on 16/04/2025.
//

extension ComplexArray {

    /// Addition.
    /// - Parameters:
    ///   - lhs: This complex array.
    ///   - rhs: A complex array.
    @inlinable
    public static func += (lhs: inout ComplexArray, rhs: ComplexArray) {
        lhs = lhs + rhs
    }

    /// Addition.
    /// - Parameters:
    ///   - lhs: This complex array.
    ///   - rhs: A real value.
    @inlinable
    public static func += (lhs: inout ComplexArray, rhs: Double) {
        lhs = lhs + rhs
    }

    /// Addition.
    /// - Parameters:
    ///   - lhs: This complex array.
    ///   - rhs: A real array.
    @inlinable
    public static func += (lhs: inout ComplexArray, rhs: [Double]) {
        lhs = lhs + rhs
    }

    /// Addition.
    /// - Parameters:
    ///   - lhs: This complex array.
    ///   - rhs: A complex value.
    @inlinable
    public static func += (lhs: inout ComplexArray, rhs: Complex) {
        lhs = lhs + rhs
    }

    /// Subtraction.
    /// - Parameters:
    ///   - lhs: This complex array.
    ///   - rhs: A complex array.
    @inlinable
    public static func -= (lhs: inout ComplexArray, rhs: ComplexArray) {
        lhs = lhs - rhs
    }

    /// Subtraction.
    /// - Parameters:
    ///   - lhs: This complex array.
    ///   - rhs: A real value.
    @inlinable
    public static func -= (lhs: inout ComplexArray, rhs: Double) {
        lhs = lhs - rhs
    }

    /// Subtraction.
    /// - Parameters:
    ///   - lhs: This complex array.
    ///   - rhs: A real array.
    @inlinable
    public static func -= (lhs: inout ComplexArray, rhs: [Double]) {
        lhs = lhs - rhs
    }

    /// Subtraction.
    /// - Parameters:
    ///   - lhs: This complex array.
    ///   - rhs: A complex value.
    @inlinable
    public static func -= (lhs: inout ComplexArray, rhs: Complex) {
        lhs = lhs - rhs
    }

    /// Multiplication.
    /// - Parameters:
    ///   - lhs: This complex array.
    ///   - rhs: A complex array.
    @inlinable
    public static func *= (lhs: inout ComplexArray, rhs: ComplexArray) {
        lhs = lhs * rhs
    }

    /// Multiplication.
    /// - Parameters:
    ///   - lhs: This complex array.
    ///   - rhs: A real value.
    @inlinable
    public static func *= (lhs: inout ComplexArray, rhs: Double) {
        lhs = lhs * rhs
    }

    /// Multiplication.
    /// - Parameters:
    ///   - lhs: This complex array.
    ///   - rhs: A real array.
    @inlinable
    public static func *= (lhs: inout ComplexArray, rhs: [Double]) {
        lhs = lhs * rhs
    }

    /// Multiplication.
    /// - Parameters:
    ///   - lhs: This complex array.
    ///   - rhs: A complex value.
    @inlinable
    public static func *= (lhs: inout ComplexArray, rhs: Complex) {
        lhs = lhs * rhs
    }

    /// Division.
    /// - Parameters:
    ///   - lhs: This complex array.
    ///   - rhs: A complex array.
    @inlinable
    public static func /= (lhs: inout ComplexArray, rhs: ComplexArray) {
        lhs = lhs / rhs
    }

    /// Division.
    /// - Parameters:
    ///   - lhs: This complex array.
    ///   - rhs: A real value.
    @inlinable
    public static func /= (lhs: inout ComplexArray, rhs: Double) {
        lhs = lhs / rhs
    }

    /// Division.
    /// - Parameters:
    ///   - lhs: This complex array.
    ///   - rhs: A real array.
    @inlinable
    public static func /= (lhs: inout ComplexArray, rhs: [Double]) {
        lhs = lhs / rhs
    }

    /// Division.
    /// - Parameters:
    ///   - lhs: This complex array.
    ///   - rhs: A complex value.
    @inlinable
    public static func /= (lhs: inout ComplexArray, rhs: Complex) {
        lhs = lhs / rhs
    }

}
