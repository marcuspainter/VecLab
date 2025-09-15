//
//  ComplexMatrix+Math+Assignment.swift
//  VecLab
//
//  Created by Marcus Painter on 08/09/2025.
//

extension ComplexMatrix {

    /// Addition.
    /// - Parameters:
    ///   - lhs: This complex matrix.
    ///   - rhs: A real value.
    @inlinable
    public static func += (lhs: inout ComplexMatrix, rhs: Double) {
        lhs = lhs + rhs
    }
    
    /// Subtraction.
    /// - Parameters:
    ///   - lhs: This complex array.
    ///   - rhs: A real value.
    @inlinable
    public static func -= (lhs: inout ComplexMatrix, rhs: ComplexMatrix) {
        lhs = lhs - rhs
    }

    /// Subtraction.
    /// - Parameters:
    ///   - lhs: This complex array.
    ///   - rhs: A real value.
    @inlinable
    public static func -= (lhs: inout ComplexMatrix, rhs: Double) {
        lhs = lhs - rhs
    }

    /// Multiplication.
    /// - Parameters:
    ///   - lhs: This complex array.
    ///   - rhs: A complex array.
    @inlinable
    public static func *= (lhs: inout ComplexMatrix, rhs: ComplexMatrix) {
        lhs = lhs * rhs
    }
    
    /// Multiplication.
    /// - Parameters:
    ///   - lhs: This complex array.
    ///   - rhs: A complex array.
    @inlinable
    public static func .*= (lhs: inout ComplexMatrix, rhs: ComplexMatrix) {
        lhs = lhs .* rhs
    }

    /// Multiplication.
    /// - Parameters:
    ///   - lhs: This complex array.
    ///   - rhs: A real value.
    @inlinable
    public static func *= (lhs: inout ComplexMatrix, rhs: Double) {
        lhs = lhs * rhs
    }
    
    /// Division.
    /// - Parameters:
    ///   - lhs: This complex array.
    ///   - rhs: A real value.
    @inlinable
    public static func ./= (lhs: inout ComplexMatrix, rhs: ComplexMatrix) {
        lhs = lhs ./ rhs
    }

    /// Division.
    /// - Parameters:
    ///   - lhs: This complex array.
    ///   - rhs: A real value.
    @inlinable
    public static func /= (lhs: inout ComplexMatrix, rhs: Double) {
        lhs = lhs / rhs
    }

}
