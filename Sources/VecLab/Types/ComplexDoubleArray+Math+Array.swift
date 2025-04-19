//
//  ComplexDoubleArray+Math+Array.swift
//  VecLab
//
//  Created by Marcus Painter on 19/04/2025.
//

import Accelerate

/// [Double]  extensions
extension ComplexDoubleArray {
    
    /// Complex addition.
    /// - Parameters:
    ///   - a: Complex array.
    ///   - b: Real array.
    /// - Returns: The result of the addition.
    public static func + (a: ComplexDoubleArray, b: [Double]) -> ComplexDoubleArray {
        assertSameSize(a, b)
        let real = vDSP.add(a.real, b)
        return ComplexDoubleArray(real, a.imag)
    }
    
    /// Complex addition.
    /// - Parameters:
    ///   - a: Real array.
    ///   - b: Complex array.
    /// - Returns: The result of the addition.
    public static func + (a: [Double], b: ComplexDoubleArray) -> ComplexDoubleArray {
        assertSameSize(a, b)
        let real = vDSP.add(b.real, a)
        return ComplexDoubleArray(real, b.imag)
    }
    
    /// Complex subtraction.
    /// - Parameters:
    ///   - a: Complex array.
    ///   - b: Real array.
    /// - Returns: The result of the ComplexDoubleArray, b: Double) -> ComplexDoubleArray {
    public static func - (a: ComplexDoubleArray, b: [Double]) -> ComplexDoubleArray {
        assertSameSize(a, b)
        return ComplexDoubleArray(a.real - b, a.imag)
    }
   
    /// Complex subtraction.
    /// - Parameters:
    ///   - a: Real array.
    ///   - b: Complex array.
    /// - Returns: The result of the subtraction.
    public static func - (a: [Double], b: ComplexDoubleArray) -> ComplexDoubleArray {
        assertSameSize(a, b)
        return b - a
    }
    
    /// Complex multiplication.
    /// - Parameters:
    ///   - a: Complex array.
    ///   - b: Real array.
    /// - Returns: The result of the multiplication.
    public static func * (a: ComplexDoubleArray, b: [Double]) -> ComplexDoubleArray {
        assertSameSize(a, b)
        return vectorMultiplyComplexArrayRealArray(a, b)
    }
    
    /// Complex multiplication.
    /// - Parameters:
    ///   - a: Real array.
    ///   - b: Complex array.
    /// - Returns: The result of the multiplication.
    public static func * (a: [Double], b: ComplexDoubleArray) -> ComplexDoubleArray {
        assertSameSize(a, b)
        return vectorMultiplyComplexArrayRealArray(b, a)
    }
    
    /// Complex division.
    /// - Parameters:
    ///   - a: Complex array.
    ///   - b: Real array.
    /// - Returns: The result of the division.
    public static func / (a: ComplexDoubleArray, b: [Double]) -> ComplexDoubleArray {
        assertSameSize(a, b)
        return vectorDivideComplexArrayRealArray(a, b)
    }
    
    /// Complex division.
    /// - Parameters:
    ///   - a: Real array.
    ///   - b: Complex array.
    /// - Returns: The result of the division.
    public static func / (a: [Double], b: ComplexDoubleArray) -> ComplexDoubleArray {
        assertSameSize(a, b)
        return vectorDivideRealArrayComplexArray(a, b)
    }
}
