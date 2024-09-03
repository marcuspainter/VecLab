//
//  divide.swift
//
//
//  Created by Marcus Painter on 09/09/2023.
//

import Foundation
import Accelerate

// MARK: Real Array

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

// MARK: Complex Array

/// Division.
/// - Parameters:
///   - a: Complex number.
///   - b: Complex number.
/// - Returns: The result of the division
public func / (a: Complex, b: Complex) -> Complex {
    return complexDivide(a, b)
}

/// Division.
/// - Parameters:
///   - a: Complex number.
///   - b: Real number.
/// - Returns: The result of the division.
public func / (a: Complex, b: Real) -> Complex {
    return (a.0 / b, a.1 / b)
}

/// Division.
/// - Parameters:
///   - a: Real number.
///   - b: Complex number.
/// - Returns: The result of the division.
public func / (a: Real, b: Complex) -> Complex {
    return complexDivide((a, 0), b)
}

/// Division.
/// - Parameters:
///   - a: Complex array.
///   - b: Complex array.
/// - Returns: The result of the division.
public func / (a: ComplexArray, b: ComplexArray) -> ComplexArray {
    assertSameSize(a, b)
    return vectorDivideComplexArray(a, b)
}

/// Division.
/// - Parameters:
///   - a: Complex array.
///   - b: Complex number.
/// - Returns: The result of the division.
public func / (a: ComplexArray, b: Complex) -> ComplexArray {
    return vectorDivideComplexArrayComplex(a, b)
}

/// Division.
/// - Parameters:
///   - a: Complex number.
///   - b: Complex array.
/// - Returns: The result of the division.
public func / (a: Complex, b: ComplexArray) -> ComplexArray {
    return vectorDivideComplexComplexArray(a, b)
}

/// Division.
/// - Parameters:
///   - a: Complex array.
///   - b: Real array.
/// - Returns: The result of the division.
public func / (a: ComplexArray, b: RealArray) -> ComplexArray {
    assertSameSize(a, b)
    return vectorDivideComplexArrayRealArray(a, b)
}

/// Division.
/// - Parameters:
///   - a: Real array.
///   - b: Complex array.
/// - Returns: The result of the division.
public func / (a: RealArray, b: ComplexArray) -> ComplexArray {
    assertSameSize(a, b)
    return vectorDivideRealArrayComplexArray(a, b)
}

/// Division.
/// - Parameters:
///   - a: Complex array.
///   - b: Real number.
/// - Returns: The result of the division.
public func / (a: ComplexArray, b: Real) -> ComplexArray {
    return vectorDivideComplexArrayReal(a, b)
}

/// Division.
/// - Parameters:
///   - a: Real number.
///   - b: Complex array.
/// - Returns: The result of the division.
public func / (a: Real, b: ComplexArray) -> ComplexArray {
    return vectorDivideRealComplexArray(a, b)
}

/// Division.
/// - Parameters:
///   - a: Complex number.
///   - b: Real array.
/// - Returns: The result of the division
public func / (a: Complex, b: RealArray) -> ComplexArray {
    return vectorDivideComplexRealArray(a, b)
}

/// Division.
/// - Parameters:
///   - a: Real array.
///   - b: Complex number.
/// - Returns: The result of the division.
public func / (a: RealArray, b: Complex) -> ComplexArray {
    return vectorDivideRealArrayComplex(a, b)
}
