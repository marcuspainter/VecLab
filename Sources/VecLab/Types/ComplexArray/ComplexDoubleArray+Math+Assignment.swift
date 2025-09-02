//
//  ComplexDoubleArray+Math+Assignment.swift
//  VecLab
//
//  Created by Marcus Painter on 16/04/2025.
//

extension ComplexDoubleArray {

    /// Addition.
    /// - Parameters:
    ///   - lhs: This complex array.
    ///   - rhs: A complex array.
    public static func += (lhs: inout ComplexDoubleArray, rhs: ComplexDoubleArray) {
        lhs = lhs + rhs
    }

    /// Addition.
    /// - Parameters:
    ///   - lhs: This complex array.
    ///   - rhs: A real value.
    public static func += (lhs: inout ComplexDoubleArray, rhs: Double) {
        lhs = lhs + rhs
    }

    /// Addition.
    /// - Parameters:
    ///   - lhs: This complex array.
    ///   - rhs: A real array.
    public static func += (lhs: inout ComplexDoubleArray, rhs: [Double]) {
        lhs = lhs + rhs
    }

    /// Addition.
    /// - Parameters:
    ///   - lhs: This complex array.
    ///   - rhs: A complex value.
    public static func += (lhs: inout ComplexDoubleArray, rhs: ComplexDouble) {
        lhs = lhs + rhs
    }

    /// Subtraction.
    /// - Parameters:
    ///   - lhs: This complex array.
    ///   - rhs: A complex array.
    public static func -= (lhs: inout ComplexDoubleArray, rhs: ComplexDoubleArray) {
        lhs = lhs - rhs
    }

    /// Subtraction.
    /// - Parameters:
    ///   - lhs: This complex array.
    ///   - rhs: A real value.
    public static func -= (lhs: inout ComplexDoubleArray, rhs: Double) {
        lhs = lhs - rhs
    }

    /// Subtraction.
    /// - Parameters:
    ///   - lhs: This complex array.
    ///   - rhs: A real array.
    public static func -= (lhs: inout ComplexDoubleArray, rhs: [Double]) {
        lhs = lhs - rhs
    }

    /// Subtraction.
    /// - Parameters:
    ///   - lhs: This complex array.
    ///   - rhs: A complex value.
    public static func -= (lhs: inout ComplexDoubleArray, rhs: ComplexDouble) {
        lhs = lhs - rhs
    }

    /// Multiplication.
    /// - Parameters:
    ///   - lhs: This complex array.
    ///   - rhs: A complex array.
    public static func *= (lhs: inout ComplexDoubleArray, rhs: ComplexDoubleArray) {
        lhs = lhs * rhs
    }

    /// Multiplication.
    /// - Parameters:
    ///   - lhs: This complex array.
    ///   - rhs: A real value.
    public static func *= (lhs: inout ComplexDoubleArray, rhs: Double) {
        lhs = lhs * rhs
    }

    /// Multiplication.
    /// - Parameters:
    ///   - lhs: This complex array.
    ///   - rhs: A real array.
    public static func *= (lhs: inout ComplexDoubleArray, rhs: [Double]) {
        lhs = lhs * rhs
    }

    /// Multiplication.
    /// - Parameters:
    ///   - lhs: This complex array.
    ///   - rhs: A complex value.
    public static func *= (lhs: inout ComplexDoubleArray, rhs: ComplexDouble) {
        lhs = lhs * rhs
    }

    /// Division.
    /// - Parameters:
    ///   - lhs: This complex array.
    ///   - rhs: A complex array.
    public static func /= (lhs: inout ComplexDoubleArray, rhs: ComplexDoubleArray) {
        lhs = lhs / rhs
    }

    /// Division.
    /// - Parameters:
    ///   - lhs: This complex array.
    ///   - rhs: A real value.
    public static func /= (lhs: inout ComplexDoubleArray, rhs: Double) {
        lhs = lhs / rhs
    }

    /// Division.
    /// - Parameters:
    ///   - lhs: This complex array.
    ///   - rhs: A real array.
    public static func /= (lhs: inout ComplexDoubleArray, rhs: [Double]) {
        lhs = lhs / rhs
    }

    /// Division.
    /// - Parameters:
    ///   - lhs: This complex array.
    ///   - rhs: A complex value.
    public static func /= (lhs: inout ComplexDoubleArray, rhs: ComplexDouble) {
        lhs = lhs / rhs
    }

}
