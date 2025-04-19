//
//  ComplexDoubleArray+Math+Double.swift
//  VecLab
//
//  Created by Marcus Painter on 19/04/2025.
//

import Accelerate

/// Double extensions
extension ComplexDoubleArray {
    
    /// Complex addition.
    /// - Parameters:
    ///   - a: Complex array.
    ///   - b: Real number.
    /// - Returns: The result of the addition.
    public static func + (a: ComplexDoubleArray, b: Double) -> ComplexDoubleArray {
        assertSameSize(a)
        let real = vDSP.add(b, a.real)
        return ComplexDoubleArray(real, a.imag)
    }
    
    /// Complex addition.
    /// - Parameters:
    ///   - a: Real number.
    ///   - b: Complex array.
    /// - Returns: The result of the addition.
    public static func + (a: Double, b: ComplexDoubleArray) -> ComplexDoubleArray {
        assertSameSize(b)
        let real = vDSP.add(a, b.real)
        return ComplexDoubleArray(real, b.imag)
    }
    
    /// Complex subtraction.
    /// - Parameters:
    ///   - a: Complex array.
    ///   - b: Real number.
    /// - Returns: The result of the ComplexDoubleArray, b: Double) -> ComplexDoubleArray {
    public static func - (a: ComplexDoubleArray, b: Double) -> ComplexDoubleArray {
        assertSameSize(a)
        return ComplexDoubleArray(a.real - b, a.imag)
    }
   
    /// Complex subtraction.
    /// - Parameters:
    ///   - a: Real number.
    ///   - b: Complex array.
    /// - Returns: The result of the subtraction.
    public static func - (a: Double, b: ComplexDoubleArray) -> ComplexDoubleArray {
        assertSameSize(b)
        return ComplexDoubleArray(a - b.real, -b.imag)
    }
    
    /// Complex multiplication.
    /// - Parameters:
    ///   - a: Complex array.
    ///   - b: Real number.
    /// - Returns: The result of the multiplication.
    public static func * (a: ComplexDoubleArray, b: Double) -> ComplexDoubleArray {
        assertSameSize(a)
        let real = vDSP.multiply(b, a.real)
        let imag = vDSP.multiply(b, a.imag)
        return ComplexDoubleArray(real, imag)
    }
    
    /// Complex multiplication.
    /// - Parameters:
    ///   - a: Real number.
    ///   - b: Complex array.
    /// - Returns: The result of the multiplication.
    public static func * (a: Double, b: ComplexDoubleArray) -> ComplexDoubleArray {
        let real = vDSP.multiply(a, b.real)
        let imag = vDSP.multiply(a, b.imag)
        return ComplexDoubleArray(real, imag)
    }
    
    /// Complex division.
    /// - Parameters:
    ///   - a: Complex array.
    ///   - b: Real number.
    /// - Returns: The result of the division.
    public static func / (a: ComplexDoubleArray, b: Double) -> ComplexDoubleArray {
        assertSameSize(a)
        return vectorDivideComplexArrayReal(a, b)
    }
    
    /// Complex division.
    /// - Parameters:
    ///   - a: Real number.
    ///   - b: Complex array.
    /// - Returns: The result of the division.
    public static func / (a: Double, b: ComplexDoubleArray) -> ComplexDoubleArray {
        assertSameSize(b)
        return vectorDivideRealComplexArray(a, b)
    }
}
