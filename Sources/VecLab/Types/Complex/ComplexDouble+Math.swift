//
//  ComplexDouble+Math+.swift
//  VecLab
//
//  Created by Marcus Painter on 19/04/2025.
//

extension ComplexDouble: SignedNumeric {
    public typealias IntegerLiteralType = Double.IntegerLiteralType

    /// Magnitude.
    ///
    /// Needed for `SignedNumeric` protocol.
    public var magnitude: Double {
        return (real * real + imag * imag).squareRoot()
    }

    /// Initialize from an integer literal.
    /// - Parameter value: Integer literal.
    public init(integerLiteral value: Double.IntegerLiteralType) {
        self.init(Double(value), .zero)
    }

    /// Initialize from a binary integer literal.
    /// - Parameter source: Source.
    public init?<T>(exactly source: T) where T: BinaryInteger {
        self.init(Double(source), .zero)
   }

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

    /// Complex multiplication.
    /// - Parameters:
    ///   - a: Complex number.
    ///   - b: Complex number.
    @inlinable
    public static func *= (a: inout ComplexDouble, b: ComplexDouble) {
        a =  ComplexDouble(a.real * b.real - a.imag * b.imag, a.real * b.imag + a.imag * b.real)
    }

    /// Complex division.
    /// - Parameters:
    ///   - a: Complex number.
    ///   - b: Complex number.
    /// - Returns: The result of the division.
    public static func / (a: ComplexDouble, b: ComplexDouble) -> ComplexDouble {
        return complexDivide(a, b)
    }

    /// Unary minus.
    /// - Parameter a: Complex number.
    /// - Returns: The result of -a.
    @inlinable
    public static prefix func - (a: ComplexDouble) -> ComplexDouble {
        return ComplexDouble(-a.real, -a.imag)
    }
}
