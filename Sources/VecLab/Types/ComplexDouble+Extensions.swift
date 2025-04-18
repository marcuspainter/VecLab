//
//  ComplexDoube+Numeric.swift
//  VecLab
//
//  Created by Marcus Painter on 18/04/2025.
//

import Accelerate

extension ComplexDouble: ComplexArithmetic {
    
    /// Complex addition.
    /// - Parameters:
    ///   - a: Complex number.
    ///   - b: Complex number.
    /// - Returns: The result of the addition.
    public static func + (a: ComplexDouble, b: ComplexDouble) -> ComplexDouble {
        return ComplexDouble(a.real + b.real, a.imag + b.imag)
    }
    
    /// Complex subtraction.
    /// - Parameters:
    ///   - a: Complex number.
    ///   - b: Complex number.
    /// - Returns: The result of the subtraction.
    public static func - (a: ComplexDouble, b: ComplexDouble) -> ComplexDouble {
        return ComplexDouble(a.real - b.real, a.imag - b.imag)
    }
    
    /// Complex multiplication.
    /// - Parameters:
    ///   - a: Complex number.
    ///   - b: Complex number.
    /// - Returns: The result of the multiplication.
    public static func * (a: ComplexDouble, b: ComplexDouble) -> ComplexDouble {
        return ComplexDouble(a.real * b.real - a.imag * b.imag, a.real * b.imag + a.imag * b.real)
    }
    
    /// Complex division.
    /// - Parameters:
    ///   - a: Complex number.
    ///   - b: Complex number.
    /// - Returns: The result of the division.
    public static func / (a: ComplexDouble, b: ComplexDouble) -> ComplexDouble {
        return complexDivide(a, b)
    }
}

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
        return b + a // Overloaded
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
        return  ComplexDouble(a - b.real, -b.imag)
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
        return b * a // Overloaded
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

/// Complex  extensions
extension ComplexDouble {
    
    /// Complex addition.
    /// - Parameters:
    ///   - a: Complex number.
    ///   - b: Real number.
    /// - Returns: The result of the addition.
    public static func + (a: ComplexDouble, b: [Double]) -> ComplexDoubleArray {
        let real = vDSP.add(a.real, b)
        var imag = b
        vectorFillRealArray(a.imag, c: &imag)
        return ComplexDoubleArray(real, imag)
    }
    
    /// Complex addition.
    /// - Parameters:
    ///   - a: Real number.
    ///   - b: Complex number.
    /// - Returns: The result of the addition.
    public static func + (a: [Double], b: ComplexDouble) -> ComplexDoubleArray {
        let real = vDSP.add(b.real, a)
        var imag = a
        vectorFillRealArray(b.imag, c: &imag)
        return ComplexDoubleArray(real, imag)
    }
    
    /// Complex subtraction.
    /// - Parameters:
    ///   - a: Complex number.
    ///   - b: Real number.
    /// - Returns: The result of the subtraction.
    public static func - (a: ComplexDouble, b: [Double]) -> ComplexDoubleArray {
        let real = a.real - b
        let imag = RealArray(repeating: Real(a.imag), count: b.count)
        return ComplexDoubleArray(real, imag)
    }
    
    /// Complex subtraction.
    /// - Parameters:
    ///   - a: Real number.
    ///   - b: Complex number.
    /// - Returns: The result of the subtraction.
    public static func - (a: [Double], b: ComplexDouble) -> ComplexDoubleArray {
        let real = a - b.real
        let imag = RealArray(repeating: -Real(b.imag), count: a.count)
        return ComplexDoubleArray(real, imag)
    }
    
    /// Complex multiplication.
    /// - Parameters:
    ///   - a: Complex number.
    ///   - b: Real number.
    /// - Returns: The result of the multiplication.
    public static func * (a: ComplexDouble, b: [Double]) -> ComplexDoubleArray {
        let real = vDSP.multiply(a.real, b)
        let imag = vDSP.multiply(a.imag, b)
        return ComplexDoubleArray(real, imag)
    }
    
    /// Complex multiplication.
    /// - Parameters:
    ///   - a: Real number.
    ///   - b: Complex number.
    /// - Returns: The result of the multiplication.
    public static func * (a: [Double], b: ComplexDouble) -> ComplexDoubleArray {
        let real = vDSP.multiply(b.real, a)
        let imag = vDSP.multiply(b.imag, a)
        return ComplexDoubleArray(real, imag)
    }
    
    /// Complex division.
    /// - Parameters:
    ///   - a: Complex number.
    ///   - b: Real number.
    /// - Returns: The result of the division.
    public static func / (a: ComplexDouble, b: [Double]) -> ComplexDoubleArray {
        return vectorDivideComplexRealArray(a, b)
    }
    
    /// Complex division.
    /// - Parameters:
    ///   - a: Real number.
    ///   - b: Complex number.
    /// - Returns: The result of the division.
    public static func / (a: [Double], b: ComplexDouble) -> ComplexDoubleArray {
        return vectorDivideRealArrayComplex(a, b)
    }
}

/*
extension ComplexDouble: ExpressibleByIntegerLiteral {
    public init(integerLiteral value: Int) {
        self.real = Double(value)
        self.imag = 0.0
    }
}

extension ComplexDouble: ExpressibleByFloatLiteral {
    public init(floatLiteral value: Double) {
        self.real = value
        self.imag = 0.0
    }
}
*/

/*
extension ComplexDouble: SignedNumeric {
    public mutating func negate() {
        real = -real
        imag = -imag
    }
    
    public static prefix func - (operand: Complex) -> Complex {
        return Complex(-operand.real, -operand.imag)
    }
}
*/
