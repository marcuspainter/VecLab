//
//  ComplexDoubleArray+Math+Complex.swift
//  VecLab
//
//  Created by Marcus Painter on 19/04/2025.
//

import Accelerate

/// Complex  extensions
extension ComplexDoubleArray {

    /// Complex addition.
    /// - Parameters:
    ///   - a: Complex array.
    ///   - b: Complex number.
    /// - Returns: The result of the addition.
    public static func + (a: ComplexDoubleArray, b: ComplexDouble) -> ComplexDoubleArray {
        assertSameSize(a)
        let real = vDSP.add(b.real, a.real)
        let imag = vDSP.add(b.imag, a.imag)
        
        
        
        
        return ComplexDoubleArray(real, imag)
    }

    /// Complex addition.
    /// - Parameters:
    ///   - a: Complex number.
    ///   - b: Complex array.
    /// - Returns: The result of the addition.
    public static func + (a: ComplexDouble, b: ComplexDoubleArray) -> ComplexDoubleArray {
        assertSameSize(b)
        let real = vDSP.add(a.real, b.real)
        let imag = vDSP.add(a.imag, b.imag)
        return ComplexDoubleArray(real, imag)
    }

    /// Complex subtraction.
    /// - Parameters:
    ///   - a: Complex array.
    ///   - b: Complex number.
    /// - Returns: The result of the ComplexDoubleArray, b: Double) -> ComplexDoubleArray {
    public static func - (a: ComplexDoubleArray, b: ComplexDouble) -> ComplexDoubleArray {
        assertSameSize(a)
        return ComplexDoubleArray(a.real - b.real, a.imag - b.imag)
    }

    /// Complex subtraction.
    /// - Parameters:
    ///   - a: Complex number.
    ///   - b: Complex array.
    /// - Returns: The result of the subtraction.
    public static func - (a: ComplexDouble, b: ComplexDoubleArray) -> ComplexDoubleArray {
        assertSameSize(b)
        return b - a
    }

    /// Complex multiplication.
    /// - Parameters:
    ///   - a: Complex array.
    ///   - b: Complex number.
    /// - Returns: The result of the multiplication.
    public static func * (a: ComplexDoubleArray, b: ComplexDouble) -> ComplexDoubleArray {
        assertSameSize(a)
        return vectorMultiplyComplexArrayComplex(a, b)
    }

    /// Complex multiplication.
    /// - Parameters:
    ///   - a: Complex number.
    ///   - b: Complex array.
    /// - Returns: The result of the multiplication.
    public static func * (a: ComplexDouble, b: ComplexDoubleArray) -> ComplexDoubleArray {
        assertSameSize(b)
        return vectorMultiplyComplexComplexArray(a, b)
    }

    /// Complex division.
    /// - Parameters:
    ///   - a: Complex array.
    ///   - b: Complex number.
    /// - Returns: The result of the division.
    public static func / (a: ComplexDoubleArray, b: ComplexDouble) -> ComplexDoubleArray {
        assertSameSize(a)
        return vectorDivideComplexArrayComplex(a, b)
    }

    /// Complex division.
    /// - Parameters:
    ///   - a: Complex number.
    ///   - b: Complex array.
    /// - Returns: The result of the division.
    public static func / (a: ComplexDouble, b: ComplexDoubleArray) -> ComplexDoubleArray {
        assertSameSize(b)
        return vectorDivideComplexComplexArray(a, b)
    }
}
