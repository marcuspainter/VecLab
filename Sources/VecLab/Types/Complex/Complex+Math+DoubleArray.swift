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
    public static func + (a: Complex, b: [Double]) -> SplitComplexArray {
        let real = vDSP.add(a.real, b)
        var imag = b
        vectorFillRealArray(a.imag, c: &imag)
        return SplitComplexArray(real, imag)
    }

    /// Complex addition.
    /// - Parameters:
    ///   - a: Real number.
    ///   - b: Complex number.
    /// - Returns: The result of the addition.
    public static func + (a: [Double], b: Complex) -> SplitComplexArray {
        let real = vDSP.add(b.real, a)
        var imag = a
        vectorFillRealArray(b.imag, c: &imag)
        return SplitComplexArray(real, imag)
    }

    /// Complex subtraction.
    /// - Parameters:
    ///   - a: Complex number.
    ///   - b: Real number.
    /// - Returns: The result of the subtraction.
    public static func - (a: Complex, b: [Double]) -> SplitComplexArray {
        let real = a.real - b
        let imag = RealArray(repeating: Real(a.imag), count: b.count)
        return SplitComplexArray(real, imag)
    }

    /// Complex subtraction.
    /// - Parameters:
    ///   - a: Real number.
    ///   - b: Complex number.
    /// - Returns: The result of the subtraction.
    public static func - (a: [Double], b: Complex) -> SplitComplexArray {
        let real = a - b.real
        let imag = RealArray(repeating: -Real(b.imag), count: a.count)
        return SplitComplexArray(real, imag)
    }

    /// Complex multiplication.
    /// - Parameters:
    ///   - a: Complex number.
    ///   - b: Real number.
    /// - Returns: The result of the multiplication.
    public static func * (a: Complex, b: [Double]) -> SplitComplexArray {
        let real = vDSP.multiply(a.real, b)
        let imag = vDSP.multiply(a.imag, b)
        return SplitComplexArray(real, imag)
    }

    /// Complex multiplication.
    /// - Parameters:
    ///   - a: Real number.
    ///   - b: Complex number.
    /// - Returns: The result of the multiplication.
    public static func * (a: [Double], b: Complex) -> SplitComplexArray {
        let real = vDSP.multiply(b.real, a)
        let imag = vDSP.multiply(b.imag, a)
        return SplitComplexArray(real, imag)
    }

    /// Complex division.
    /// - Parameters:
    ///   - a: Complex number.
    ///   - b: Real number.
    /// - Returns: The result of the division.
    public static func / (a: Complex, b: [Double]) -> SplitComplexArray {
        return vectorDivideComplexRealArray(a, b)
    }

    /// Complex division.
    /// - Parameters:
    ///   - a: Real number.
    ///   - b: Complex number.
    /// - Returns: The result of the division.
    public static func / (a: [Double], b: Complex) -> SplitComplexArray {
        return vectorDivideRealArrayComplex(a, b)
    }
    
}
