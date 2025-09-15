//
//  Matrix+Assignment.swift
//  VecLab
//
//  Created by Marcus Painter on 08/09/2025.
//

extension Matrix {

    /// Addition.
    /// - Parameters:
    ///   - lhs: This complex array.
    ///   - rhs: A complex array.
    @inlinable
    public static func += (lhs: inout Matrix, rhs: Matrix) {
        lhs = lhs + rhs
    }

    /// Addition.
    /// - Parameters:
    ///   - lhs: This complex array.
    ///   - rhs: A real value.
    @inlinable
    public static func += (lhs: inout Matrix, rhs: Double) {
        lhs = lhs + rhs
    }

    /// Subtraction.
    /// - Parameters:
    ///   - lhs: This complex array.
    ///   - rhs: A complex array.
    @inlinable
    public static func -= (lhs: inout Matrix, rhs: Matrix) {
        lhs = lhs - rhs
    }

    /// Subtraction.
    /// - Parameters:
    ///   - lhs: This complex array.
    ///   - rhs: A real value.
    @inlinable
    public static func -= (lhs: inout Matrix, rhs: Double) {
        lhs = lhs - rhs
    }

    /// Multiplication.
    /// - Parameters:
    ///   - lhs: This complex array.
    ///   - rhs: A complex array.
    @inlinable
    public static func *= (lhs: inout Matrix, rhs: Matrix) {
        lhs = lhs * rhs
    }

    /// Multiplication.
    /// - Parameters:
    ///   - lhs: This complex array.
    ///   - rhs: A complex array.
    @inlinable
    public static func .*= (lhs: inout Matrix, rhs: Matrix) {
        lhs = lhs .* rhs
    }

    /// Multiplication.
    /// - Parameters:
    ///   - lhs: This complex array.
    ///   - rhs: A real value.
    @inlinable
    public static func *= (lhs: inout Matrix, rhs: Double) {
        lhs = lhs * rhs
    }

    /// Division.
    /// - Parameters:
    ///   - lhs: This complex array.
    ///   - rhs: A real value.
    @inlinable
    public static func ./= (lhs: inout Matrix, rhs: Matrix) {
        lhs = lhs ./ rhs
    }

    /// Division.
    /// - Parameters:
    ///   - lhs: This complex array.
    ///   - rhs: A real value.
    public static func /= (lhs: inout Matrix, rhs: Double) {
        lhs = lhs / rhs
    }

}
