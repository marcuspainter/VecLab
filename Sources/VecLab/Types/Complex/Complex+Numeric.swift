//
//  Complex+Numeric.swift
//  VecLab
//
//  Created by Marcus Painter on 10/05/2025.
//

extension Complex: Numeric, AdditiveArithmetic {
    
    /// Complex multiplication.
    /// - Parameters:
    ///   - a: Complex number.
    ///   - b: Complex number.
    /// - Returns: The result of the multiplication.
    @inlinable
    public static func * (a: Complex, b: Complex) -> Complex {
        return Complex(a.real * b.real - a.imag * b.imag, a.real * b.imag + a.imag * b.real)
    }

    /// Complex multiplication.
    /// - Parameters:
    ///   - a: Complex number.
    ///   - b: Complex number.
    @inlinable
    public static func *= (a: inout Complex, b: Complex) {
        let x = a.real * b.real - a.imag * b.imag
        let y = a.real * b.imag + a.imag * b.real
        a.real = x
        a.imag = y
    }

    /// Magnitude.
    ///
    /// Needed for `SignedNumeric` protocol.
    @inlinable
    public var magnitude: Double {
        return (real * real + imag * imag).squareRoot()
    }
    
    // AdditiveArithmetic
    
    /// Complex addition.
    /// - Parameters:
    ///   - a: Complex number.
    ///   - b: Complex number.
    /// - Returns: The result of the addition.
    @inlinable
    public static func + (a: Complex, b: Complex) -> Complex {
        return Complex(a.real + b.real, a.imag + b.imag)
    }

    /// Complex addition.
    /// - Parameters:
    ///   - a: Complex number.
    ///   - b: Complex number.
    @inlinable
    public static func += (a: inout Complex, b: Complex) {
        a.real += b.real
        a.imag += b.imag
    }

    /// Complex subtraction.
    /// - Parameters:
    ///   - a: Complex number.
    ///   - b: Complex number.
    /// - Returns: The result of the subtraction.
    @inlinable
    public static func - (a: Complex, b: Complex) -> Complex {
        return Complex(a.real - b.real, a.imag - b.imag)
    }

    /// Complex subtraction.
    /// - Parameters:
    ///   - a: Complex number.
    ///   - b: Complex number.
    @inlinable
    public static func -= (a: inout Complex, b: Complex) {
        a.real -= b.real
        a.imag -= b.imag
    }

    /// The zero value.
    @inlinable
    public static var zero: Complex { .init(0, 0) }
    
    // SignedNumeric
    
    public typealias IntegerLiteralType = Double.IntegerLiteralType

    /// Unary minus.
    /// - Parameter a: Complex number.
    /// - Returns: The result of -a.
    @inlinable
    public static prefix func - (a: Complex) -> Complex {
        return Complex(-a.real, -a.imag)
    }

    /// Replaces this value with its additive inverse.
    @inlinable
    mutating public func negate() {
        self.real = -self.real
        self.imag = -self.imag
    }

}
