//
//  ComplexDouble+AdditiveArithmetic.swift
//  VecLab
//
//  Created by Marcus Painter on 10/05/2025.
//

extension ComplexDouble: AdditiveArithmetic {

    /// Complex addition.
    /// - Parameters:
    ///   - a: Complex number.
    ///   - b: Complex number.
    /// - Returns: The result of the addition.
    @inlinable
    public static func + (a: ComplexDouble, b: ComplexDouble) -> ComplexDouble {
        return ComplexDouble(a.real + b.real, a.imag + b.imag)
    }
    
    /// Complex addition.
    /// - Parameters:
    ///   - a: Complex number.
    ///   - b: Complex number.
    @inlinable
    public static func += (a: inout ComplexDouble, b: ComplexDouble) {
        a.real += b.real
        a.imag += b.imag
    }

    /// Complex subtraction.
    /// - Parameters:
    ///   - a: Complex number.
    ///   - b: Complex number.
    /// - Returns: The result of the subtraction.
    @inlinable
    public static func - (a: ComplexDouble, b: ComplexDouble) -> ComplexDouble {
        return ComplexDouble(a.real - b.real, a.imag - b.imag)
    }
    
    /// Complex subtraction.
    /// - Parameters:
    ///   - a: Complex number.
    ///   - b: Complex number.
    @inlinable
    public static func -= (a: inout ComplexDouble, b: ComplexDouble) {
        a.real -= b.real
        a.imag -= b.imag
    }
    
    /// The zero value.
    public static var zero: ComplexDouble { .init(0, 0) }
}
