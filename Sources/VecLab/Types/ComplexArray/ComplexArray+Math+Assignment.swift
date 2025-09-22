//
//  ComplexArray+Math+Assignment.swift
//  VecLab
//
//  Created by Marcus Painter on 09/09/2025.
//

extension Array where Element == Complex {
    
    /// Addition.
    /// - Parameters:
    ///   - lhs: This complex value.
    ///   - rhs: A real value.
    @inlinable
    public static func += (lhs: inout Self, rhs: Self) {
        lhs = lhs + rhs
    }

    /// Subtraction.
    /// - Parameters:
    ///   - lhs: This complex value.
    ///   - rhs: A real value.
    @inlinable
    public static func -= (lhs: inout Self, rhs: Self) {
        lhs = lhs - rhs
    }
    
    /// Multiplication.
    /// - Parameters:
    ///   - lhs: This complex value.
    ///   - rhs: A real value.
    @inlinable
    public static func *= (lhs: inout Self, rhs: Self) {
        lhs = lhs * rhs
    }
    
    /// Division.
    /// - Parameters:
    ///   - lhs: This complex value.
    ///   - rhs: A complex value.
    @inlinable
    public static func /= (lhs: inout Self, rhs: Self) {
        lhs = lhs / rhs
    }
    
    // MARK: Double
    
    /// Addition.
    /// - Parameters:
    ///   - lhs: This complex value.
    ///   - rhs: A real value.
    @inlinable
    public static func += (lhs: inout Self, rhs: Double) {
        lhs = lhs + rhs
    }

    /// Subtraction.
    /// - Parameters:
    ///   - lhs: This complex value.
    ///   - rhs: A real value.
    @inlinable
    public static func -= (lhs: inout Self, rhs: Double) {
        lhs = lhs - rhs
    }
    
    /// Multiplication.
    /// - Parameters:
    ///   - lhs: This complex value.
    ///   - rhs: A real value.
    @inlinable
    public static func *= (lhs: inout Self, rhs: Double) {
        lhs = lhs * rhs
    }
    
    /// Division.
    /// - Parameters:
    ///   - lhs: This complex value.
    ///   - rhs: A complex value.
    @inlinable
    public static func /= (lhs: inout Self, rhs: Double) {
        lhs = lhs / rhs
    }
    
    // MARK: DoubleArray
    
    /// Addition.
    /// - Parameters:
    ///   - lhs: This complex value.
    ///   - rhs: A real value.
    @inlinable
    public static func += (lhs: inout Self, rhs: [Double]) {
        lhs = lhs + rhs
    }

    /// Subtraction.
    /// - Parameters:
    ///   - lhs: This complex value.
    ///   - rhs: A real value.
    @inlinable
    public static func -= (lhs: inout Self, rhs: [Double]) {
        lhs = lhs - rhs
    }
    
    /// Multiplication.
    /// - Parameters:
    ///   - lhs: This complex value.
    ///   - rhs: A real value.
    @inlinable
    public static func *= (lhs: inout Self, rhs: [Double]) {
        lhs = lhs * rhs
    }
    
    /// Division.
    /// - Parameters:
    ///   - lhs: This complex value.
    ///   - rhs: A complex value.
    @inlinable
    public static func /= (lhs: inout Self, rhs: [Double]) {
        lhs = lhs / rhs
    }
    
    // MARK: Complex
    
    /// Addition.
    /// - Parameters:
    ///   - lhs: This complex value.
    ///   - rhs: A real value.
    @inlinable
    public static func += (lhs: inout Self, rhs: Complex) {
        lhs = lhs + rhs
    }

    /// Subtraction.
    /// - Parameters:
    ///   - lhs: This complex value.
    ///   - rhs: A real value.
    @inlinable
    public static func -= (lhs: inout Self, rhs: Complex) {
        lhs = lhs - rhs
    }
    
    /// Multiplication.
    /// - Parameters:
    ///   - lhs: This complex value.
    ///   - rhs: A real value.
    @inlinable
    public static func *= (lhs: inout Self, rhs: Complex) {
        lhs = lhs * rhs
    }
    
    /// Division.
    /// - Parameters:
    ///   - lhs: This complex value.
    ///   - rhs: A complex value.
    @inlinable
    public static func /= (lhs: inout Self, rhs: Complex) {
        lhs = lhs / rhs
    }
}
