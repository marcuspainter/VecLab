//
//  Complex+Math+Array.swift
//  VecLab
//
//  Created by Marcus Painter on 19/04/2025.
//

import Accelerate
import Foundation

//
// Complex and Double array operators
//

extension Complex {

    /// Complex addition.
    /// - Parameters:
    ///   - a: Complex number.
    ///   - b: Real number.
    /// - Returns: The result of the addition.
    public static func + (a: Complex, b: [Double]) -> ComplexArray {
        let real = vDSP.add(a.real, b)
        var imag = b
        vectorFillRealArray(a.imag, c: &imag)
        return ComplexArray(real, imag)
    }

    /// Complex addition.
    /// - Parameters:
    ///   - a: Real number.
    ///   - b: Complex number.
    /// - Returns: The result of the addition.
    public static func + (a: [Double], b: Complex) -> ComplexArray {
        let real = vDSP.add(b.real, a)
        var imag = a
        vectorFillRealArray(b.imag, c: &imag)
        return ComplexArray(real, imag)
    }

    /// Complex subtraction.
    /// - Parameters:
    ///   - a: Complex number.
    ///   - b: Real number.
    /// - Returns: The result of the subtraction.
    public static func - (a: Complex, b: [Double]) -> ComplexArray {
        let real = a.real - b
        let imag = RealArray(repeating: Real(a.imag), count: b.count)
        return ComplexArray(real, imag)
    }

    /// Complex subtraction.
    /// - Parameters:
    ///   - a: Real number.
    ///   - b: Complex number.
    /// - Returns: The result of the subtraction.
    public static func - (a: [Double], b: Complex) -> ComplexArray {
        let real = a - b.real
        let imag = RealArray(repeating: -Real(b.imag), count: a.count)
        return ComplexArray(real, imag)
    }

    /// Complex multiplication.
    /// - Parameters:
    ///   - a: Complex number.
    ///   - b: Real number.
    /// - Returns: The result of the multiplication.
    public static func * (a: Complex, b: [Double]) -> ComplexArray {
        let real = vDSP.multiply(a.real, b)
        let imag = vDSP.multiply(a.imag, b)
        return ComplexArray(real, imag)
    }

    /// Complex multiplication.
    /// - Parameters:
    ///   - a: Real number.
    ///   - b: Complex number.
    /// - Returns: The result of the multiplication.
    public static func * (a: [Double], b: Complex) -> ComplexArray {
        let real = vDSP.multiply(b.real, a)
        let imag = vDSP.multiply(b.imag, a)
        return ComplexArray(real, imag)
    }

    /// Complex division.
    /// - Parameters:
    ///   - a: Complex number.
    ///   - b: Real number.
    /// - Returns: The result of the division.
    public static func / (a: Complex, b: [Double]) -> ComplexArray {
        return vectorDivideComplexRealArray(a, b)
    }

    /// Complex division.
    /// - Parameters:
    ///   - a: Real number.
    ///   - b: Complex number.
    /// - Returns: The result of the division.
    public static func / (a: [Double], b: Complex) -> ComplexArray {
        return vectorDivideRealArrayComplex(a, b)
    }
}
