//
//  multiply.swift
//
//
//  Created by Marcus Painter on 09/09/2023.
//

import Accelerate
import Foundation

/*
/// Multiplication.
/// - Parameters:
///   - a: Real array.
///   - b: Real array.
/// - Returns: The result of the multiplication.
public func * (a: RealArray, b: RealArray) -> RealArray {
    assertSameSize(a, b)
    return vDSP.multiply(a, b)
}

/// Multiplication.
/// - Parameters:
///   - a: Real array.
///   - b: Real number.
/// - Returns: The result of the multiplication.
public func * (a: RealArray, b: Real) -> RealArray {
    return vDSP.multiply(b, a)
}

/// Multiplication.
/// - Parameters:
///   - a: Real.
///   - b: Real array.
/// - Returns: The result of the multiplication.
public func * (a: Real, b: RealArray) -> RealArray {
    return vDSP.multiply(a, b)
}
*/

/// Multiplication.
/// - Parameters:
///   - a: Complex number.
///   - b: Complex number.
/// - Returns: The result of the multiplication.
//public func * (a: Complex, b: Complex) -> Complex {
//    return Complex(a.real * b.real - a.imag * b.imag, a.real * b.imag + a.imag * b.real)
//}

/// Multiplication.
/// - Parameters:
///   - a: Complex number.
///   - b: Real number.
/// - Returns: The result of the multiplication.
//public func * (a: Complex, b: Real) -> Complex {
//    return Complex(a.real * b, a.imag * b)
//}

/// Multiplication.
/// - Parameters:
///   - a: Real number.
///   - b: Complex number.
/// - Returns: The result of the multiplication.
//public func * (a: Real, b: Complex) -> Complex {
//   return b * a
//}

// MARK: Complex array

/// Multiplication.
/// - Parameters:
///   - a: Complex array.
///   - b: Complex array.
/// - Returns: The result of the multiplication.
//public func * (a: ComplexArray, b: ComplexArray) -> ComplexArray {
//    assertSameSize(a, b)
//    return vectorMultiplyComplexArray(a, b)
//}

/// Multiplication.
/// - Parameters:
///   - a: Complex array.
///   - b: Complex number.
/// - Returns: The result of the multiplication.
//public func * (a: ComplexArray, b: Complex) -> ComplexArray {
//    assertSameSize(a)
//    return vectorMultiplyComplexArrayComplex(a, b)
//}

/// Multiplication.
/// - Parameters:
///   - a: Complex number.
///   - b: Complex array.
/// - Returns: The result of the multiplication.
//public func * (a: Complex, b: ComplexArray) -> ComplexArray {
//    assertSameSize(b)
//    return vectorMultiplyComplexComplexArray(a, b)
//}

/// Multiplication.
/// - Parameters:
///   - a: Complex array.
///   - b: Real array.
/// - Returns: The result of the multiplication.
//public func * (a: ComplexArray, b: RealArray) -> ComplexArray {
//    assertSameSize(a, b)
//    return vectorMultiplyComplexArrayRealArray(a, b)
//}

/// Multiplication.
/// - Parameters:
///   - a: Real array.
///   - b: Complex array.
/// - Returns: The result of the multiplication.
//public func * (a: RealArray, b: ComplexArray) -> ComplexArray {
//    assertSameSize(a, b)
//    return vectorMultiplyComplexArrayRealArray(b, a)
//}

/// Multiplication.
/// - Parameters:
///   - a: Complex array.
///   - b: Real number.
/// - Returns: The result of the multiplication.
//public func * (a: ComplexArray, b: Real) -> ComplexArray {
//    assertSameSize(a)
//    let real = vDSP.multiply(b, a.real)
//    let imag = vDSP.multiply(b, a.imag)
//    return ComplexArray(real, imag)
//}

/// Multiplication.
/// - Parameters:
///   - a: Real number.
///   - b: Complex array.
/// - Returns: The result of the multiplication.
//public func * (a: Real, b: ComplexArray) -> ComplexArray {
//    assertSameSize(b)
//    let real = vDSP.multiply(a, b.real)
//    let imag = vDSP.multiply(a, b.imag)
//    return ComplexArray(real, imag)
//}

/// Multiplication.
/// - Parameters:
///   - a: Complex number.
///   - b: Real array.
/// - Returns: The result of the multiplication.
//public func * (a: Complex, b: RealArray) -> ComplexArray {
//    let real = vDSP.multiply(a.real, b)
//    let imag = vDSP.multiply(a.imag, b)
//    return ComplexArray(real, imag)
//}

/// Multiplication.
/// - Parameters:
///   - a: Real array.
///   - b: Complex number.
/// - Returns: The result of the multiplication.
//public func * (a: RealArray, b: Complex) -> ComplexArray {
//    let real = vDSP.multiply(b.real, a)
//    let imag = vDSP.multiply(b.imag, a)
//    return ComplexArray(real, imag)
//}
