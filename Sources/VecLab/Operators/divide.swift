//
//  divide.swift
//
//
//  Created by Marcus Painter on 09/09/2023.
//

import Accelerate
import Foundation

// MARK: Real Array

/*
/// Division.
/// - Parameters:
///   - a: Real array.
///   - b: Real array.
/// - Returns: The result of the division.
public func / (a: RealArray, b: RealArray) -> RealArray {
    assertSameSize(a, b)
    return vDSP.divide(a, b)
}

/// Division.
/// - Parameters:
///   - a: Real array.
///   - b: Real number.
/// - Returns: The result of the division.
public func / (a: RealArray, b: Real) -> RealArray {
    return vDSP.divide(a, b)
}

/// Division
/// - Parameters:
///   - a: Real number
///   - b: Real array
/// - Returns: The result of the division
public func / (a: Real, b: RealArray) -> RealArray {
    return vDSP.divide(a, b)
}
*/
// MARK: Complex Array

/// Division.
/// - Parameters:
///   - a: Complex number.
///   - b: Complex number.
/// - Returns: The result of the division
//public func / (a: Complex, b: Complex) -> Complex {
//    return complexDivide(a, b)
//}

/// Division.
/// - Parameters:
///   - a: Complex number.
///   - b: Real number.
/// - Returns: The result of the division.
//public func / (a: Complex, b: Real) -> Complex {
//    return Complex(a.real / b, a.imag / b)
//}

/// Division.
/// - Parameters:
///   - a: Real number.
///   - b: Complex number.
/// - Returns: The result of the division.
//public func / (a: Real, b: Complex) -> Complex {
//    return complexDivide(Complex(a, 0), b)
//}

/// Division.
/// - Parameters:
///   - a: Complex array.
///   - b: Complex array.
/// - Returns: The result of the division.
//public func / (a: ComplexArray, b: ComplexArray) -> ComplexArray {
//   assertSameSize(a, b)
//    return vectorDivideComplexArray(a, b)
//}

/// Division.
/// - Parameters:
///   - a: Complex array.
///   - b: Complex number.
/// - Returns: The result of the division.
//public func / (a: ComplexArray, b: Complex) -> ComplexArray {
//    assertSameSize(a)
//    return vectorDivideComplexArrayComplex(a, b)
//}

/// Division.
/// - Parameters:
///   - a: Complex number.
///   - b: Complex array.
/// - Returns: The result of the division.
//public func / (a: Complex, b: ComplexArray) -> ComplexArray {
//    assertSameSize(b)
//    return vectorDivideComplexComplexArray(a, b)
//}

/// Division.
/// - Parameters:
///   - a: Complex array.
///   - b: Real array.
/// - Returns: The result of the division.
//public func / (a: ComplexArray, b: RealArray) -> ComplexArray {
//    assertSameSize(a, b)
//    return vectorDivideComplexArrayRealArray(a, b)
//}

/// Division.
/// - Parameters:
///   - a: Real array.
///   - b: Complex array.
/// - Returns: The result of the division.
//public func / (a: RealArray, b: ComplexArray) -> ComplexArray {
//    assertSameSize(a, b)
//    return vectorDivideRealArrayComplexArray(a, b)
//}

/// Division.
/// - Parameters:
///   - a: Complex array.
///   - b: Real number.
/// - Returns: The result of the division.
//public func / (a: ComplexArray, b: Real) -> ComplexArray {
//    assertSameSize(a)
//    return vectorDivideComplexArrayReal(a, b)
//}

/// Division.
/// - Parameters:
///   - a: Real number.
///   - b: Complex array.
/// - Returns: The result of the division.
//public func / (a: Real, b: ComplexArray) -> ComplexArray {
//    assertSameSize(b)
//    return vectorDivideRealComplexArray(a, b)
//}

/// Division.
/// - Parameters:
///   - a: Complex number.
///   - b: Real array.
/// - Returns: The result of the division
//public func / (a: Complex, b: RealArray) -> ComplexArray {
//    return vectorDivideComplexRealArray(a, b)
//}

/// Division.
/// - Parameters:
///   - a: Real array.
///   - b: Complex number.
/// - Returns: The result of the division.
//public func / (a: RealArray, b: Complex) -> ComplexArray {
//    return vectorDivideRealArrayComplex(a, b)
//}
