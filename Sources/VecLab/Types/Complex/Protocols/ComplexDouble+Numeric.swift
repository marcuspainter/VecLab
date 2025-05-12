//
//  ComplexDouble+Numeric.swift
//  VecLab
//
//  Created by Marcus Painter on 10/05/2025.
//

extension ComplexDouble: Numeric {
    
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
        let x = a.real * b.real - a.imag * b.imag
        let y = a.real * b.imag + a.imag * b.real
        a.real = x
        a.imag = y
    }
    
    /// Magnitude.
    ///
    /// Needed for `SignedNumeric` protocol.
    public var magnitude: Double {
        return (real * real + imag * imag).squareRoot()
    }
    
}
