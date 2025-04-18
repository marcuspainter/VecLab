//
//  ComplexDoubleArray+Extensions.swift
//  VecLab
//
//  Created by Marcus Painter on 18/04/2025.
//

import Accelerate

extension ComplexDoubleArray: ComplexArithmetic {
    
    /// Complex array addition.
    /// - Parameters:
    ///   - a: Complex array.
    ///   - b: Complex array.
    /// - Returns: The result of the addition.
    public static func + (a: ComplexDoubleArray, b: ComplexDoubleArray) -> ComplexDoubleArray {
        assertSameSize(a, b)
        let result = vectorAddComplexArray(a, b) // Not needed ???
        return result
    }
    
    /// Complex array subtraction.
    /// - Parameters:
    ///   - a: Complex array.
    ///   - b: Complex array.
    /// - Returns: The result of the subtraction.
    public static func - (a: ComplexDoubleArray, b: ComplexDoubleArray) -> ComplexDoubleArray {
        assertSameSize(a, b)
        return vectorSubtractComplexArray(a, b)
    }
    
    /// Complex array multiplication.
    /// - Parameters:
    ///   - a: Complex array.
    ///   - b: Complex array.
    /// - Returns: The result of the multiplication.
    public static func * (a: ComplexDoubleArray, b: ComplexDoubleArray) -> ComplexDoubleArray {
        assertSameSize(a, b)
        return vectorMultiplyComplexArray(a, b)
    }
    
    /// Complex array division.
    /// - Parameters:
    ///   - a: Complex array..
    ///   - b: Complex array.
    /// - Returns: The result of the division.
    public static func / (a: ComplexDoubleArray, b: ComplexDoubleArray) -> ComplexDoubleArray {
        assertSameSize(a, b)
        return vectorDivideComplexArray(a, b)
    }
}

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

/// Complex unary
extension ComplexDoubleArray {
    /// Unary minus.
    /// - Parameter a: Complex array.
    /// - Returns: The result of -a.
    public static prefix func - (a: ComplexDoubleArray) -> ComplexDoubleArray {
        let real = vDSP.negative(a.real)
        let imag = vDSP.negative(a.imag)
        return ComplexDoubleArray(real, imag)
    }
}


