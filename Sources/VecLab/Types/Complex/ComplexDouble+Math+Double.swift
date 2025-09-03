//
//  ComplexDouble+Math+Double.swift
//  VecLab
//
//  Created by Marcus Painter on 19/04/2025.
//

//
// ComplexDouble and Double operators
//

extension ComplexDouble {

    /// Complex addition.
    /// - Parameters:
    ///   - a: Complex number.
    ///   - b: Real number.
    /// - Returns: The result of the addition.
    public static func + (a: ComplexDouble, b: Double) -> ComplexDouble {
        return ComplexDouble(a.real + b, a.imag)
    }

    /// Complex addition.
    /// - Parameters:
    ///   - a: Real number.
    ///   - b: Complex number.
    /// - Returns: The result of the addition.
    public static func + (a: Double, b: ComplexDouble) -> ComplexDouble {
        return b + a  // Overloaded
    }

    /// Complex subtraction.
    /// - Parameters:
    ///   - a: Complex number.
    ///   - b: Real number.
    /// - Returns: The result of the subtraction.
    public static func - (a: ComplexDouble, b: Double) -> ComplexDouble {
        return ComplexDouble(a.real - b, a.imag)
    }

    /// Complex subtraction.
    /// - Parameters:
    ///   - a: Real number.
    ///   - b: Complex number.
    /// - Returns: The result of the subtraction.
    public static func - (a: Double, b: ComplexDouble) -> ComplexDouble {
        return ComplexDouble(a - b.real, -b.imag)
    }

    /// Complex multiplication.
    /// - Parameters:
    ///   - a: Complex number.
    ///   - b: Real number.
    /// - Returns: The result of the multiplication.
    public static func * (a: ComplexDouble, b: Double) -> ComplexDouble {
        return ComplexDouble(a.real * b, a.imag * b)
    }

    /// Complex multiplication.
    /// - Parameters:
    ///   - a: Real number.
    ///   - b: Complex number.
    /// - Returns: The result of the multiplication.
    public static func * (a: Double, b: ComplexDouble) -> ComplexDouble {
        return b * a  // Overloaded
    }

    /// Complex division.
    /// - Parameters:
    ///   - a: Complex number.
    ///   - b: Real number.
    /// - Returns: The result of the division.
    public static func / (a: ComplexDouble, b: Double) -> ComplexDouble {
        return ComplexDouble(a.real / b, a.imag / b)
    }

    /// Complex division.
    /// - Parameters:
    ///   - a: Real number.
    ///   - b: Complex number.
    /// - Returns: The result of the division.
    public static func / (a: Double, b: ComplexDouble) -> ComplexDouble {
        return complexDivide(ComplexDouble(a, 0), b)
    }
}
