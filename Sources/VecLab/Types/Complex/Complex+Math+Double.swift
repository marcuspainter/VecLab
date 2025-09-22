//
//  Complex+Math+Double.swift
//  VecLab
//
//  Created by Marcus Painter on 19/04/2025.
//

//
// Complex and Double operators
//

extension Complex {

    /// Complex addition.
    /// - Parameters:
    ///   - a: Complex number.
    ///   - b: Real number.
    /// - Returns: The result of the addition.
    @inlinable
    public static func + (a: Complex, b: Double) -> Complex {
        return Complex(a.real + b, a.imag)
    }

    /// Complex addition.
    /// - Parameters:
    ///   - a: Real number.
    ///   - b: Complex number.
    /// - Returns: The result of the addition.
    @inlinable
    public static func + (a: Double, b: Complex) -> Complex {
        return Complex(a + b.real, b.imag)
    }

    /// Complex subtraction.
    /// - Parameters:
    ///   - a: Complex number.
    ///   - b: Real number.
    /// - Returns: The result of the subtraction.
    @inlinable
    public static func - (a: Complex, b: Double) -> Complex {
        return Complex(a.real - b, a.imag)
    }

    /// Complex subtraction.
    /// - Parameters:
    ///   - a: Real number.
    ///   - b: Complex number.
    /// - Returns: The result of the subtraction.
    @inlinable
    public static func - (a: Double, b: Complex) -> Complex {
        return Complex(a - b.real, -b.imag)
    }

    /// Complex multiplication.
    /// - Parameters:
    ///   - a: Complex number.
    ///   - b: Real number.
    /// - Returns: The result of the multiplication.
    @inlinable
    public static func * (a: Complex, b: Double) -> Complex {
        return Complex(a.real * b, a.imag * b)
    }

    /// Complex multiplication.
    /// - Parameters:
    ///   - a: Real number.
    ///   - b: Complex number.
    /// - Returns: The result of the multiplication.
    @inlinable
    public static func * (a: Double, b: Complex) -> Complex {
        return Complex(a * b.real, a * b.imag)
    }

    /// Complex division.
    /// - Parameters:
    ///   - a: Complex number.
    ///   - b: Complex number.
    /// - Returns: The result of the division.
    public static func / (a: Complex, b: Complex) -> Complex {
        return CoreComplex.divide(a, b)
    }

    /// Complex division.
    /// - Parameters:
    ///   - a: Complex number.
    ///   - b: Real number.
    /// - Returns: The result of the division.
    @inlinable
    public static func / (a: Complex, b: Double) -> Complex {
        return Complex(a.real / b, a.imag / b)
    }

    /// Complex division.
    /// - Parameters:
    ///   - a: Real number.
    ///   - b: Complex number.
    /// - Returns: The result of the division.
    public static func / (a: Double, b: Complex) -> Complex {
        return CoreComplex.divide(a, b)
    }
}
