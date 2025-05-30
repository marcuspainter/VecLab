//
//  ComplexDouble+Operators.swift
//  VecLab
//
//  Created by Marcus Painter on 13/05/2025.
//

extension ComplexDouble {
    
    /// Addition.
    /// - Parameters:
    ///   - lhs: This complex value.
    ///   - rhs: A real value.
    public static func += (lhs: inout ComplexDouble, rhs: Double) {
        lhs = lhs + rhs
    }

    /// Subtraction.
    /// - Parameters:
    ///   - lhs: This complex value.
    ///   - rhs: A real value.
    public static func -= (lhs: inout ComplexDouble, rhs: Double) {
        lhs = lhs - rhs
    }

    /// Multiplication.
    /// - Parameters:
    ///   - lhs: This complex value.
    ///   - rhs: A real value.
    public static func *= (lhs: inout ComplexDouble, rhs: Double) {
        lhs = lhs * rhs
    }

    /// Division.
    /// - Parameters:
    ///   - lhs: This complex value.
    ///   - rhs: A complex value.
    public static func /= (lhs: inout ComplexDouble, rhs: ComplexDouble) {
        lhs = lhs / rhs
    }
    
    /// Division.
    /// - Parameters:
    ///   - lhs: This complex value.
    ///   - rhs: A real value.
    public static func /= (lhs: inout ComplexDouble, rhs: Double) {
        lhs = lhs / rhs
    }
}
