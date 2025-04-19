//
//  ComplexDouble+Math+.swift
//  VecLab
//
//  Created by Marcus Painter on 19/04/2025.
//

extension ComplexDouble: ComplexArithmetic {

    /// Complex addition.
    /// - Parameters:
    ///   - a: Complex number.
    ///   - b: Complex number.
    /// - Returns: The result of the addition.
    @inlinable
    public static func + (a: ComplexDouble, b: ComplexDouble) -> ComplexDouble {
        return ComplexDouble(a.real + b.real, a.imag + b.imag)
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

    /// Complex multiplication.
    /// - Parameters:
    ///   - a: Complex number.
    ///   - b: Complex number.
    /// - Returns: The result of the multiplication.
    @inlinable
    public static func * (a: ComplexDouble, b: ComplexDouble) -> ComplexDouble {
        return ComplexDouble(a.real * b.real - a.imag * b.imag, a.real * b.imag + a.imag * b.real)
    }

    /// Complex division.
    /// - Parameters:
    ///   - a: Complex number.
    ///   - b: Complex number.
    /// - Returns: The result of the division.
    public static func / (a: ComplexDouble, b: ComplexDouble) -> ComplexDouble {
        return complexDivide(a, b)
    }
}
