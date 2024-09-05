//
//  divide+Float.swift
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
public func / (a: RealFloatArray, b: RealFloatArray) -> RealFloatArray {
    assertSameSize(a, b)
    return vDSP.divide(a, b)
}

/// Division.
/// - Parameters:
///   - a: Real array.
///   - b: Real number.
/// - Returns: The result of the division.
public func / (a: RealFloatArray, b: RealFloat) -> RealFloatArray {
    return vDSP.divide(a, b)
}

/// Division
/// - Parameters:
///   - a: Real number
///   - b: Real array
/// - Returns: The result of the division
public func / (a: RealFloat, b: RealFloatArray) -> RealFloatArray {
    return vDSP.divide(a, b)
}

// MARK: Complex Array

/// Division.
/// - Parameters:
///   - a: Complex number.
///   - b: Complex number.
/// - Returns: The result of the division
public func / (a: ComplexFloat, b: ComplexFloat) -> ComplexFloat {
    return complexDivide(a, b)
}

/// Division.
/// - Parameters:
///   - a: Complex number.
///   - b: Real number.
/// - Returns: The result of the division.
public func / (a: ComplexFloat, b: RealFloat) -> ComplexFloat {
    return (a.0 / b, a.1 / b)
}

/// Division.
/// - Parameters:
///   - a: Real number.
///   - b: Complex number.
/// - Returns: The result of the division.
public func / (a: RealFloat, b: ComplexFloat) -> ComplexFloat {
    return complexDivide((a, 0), b)
}

/// Division.
/// - Parameters:
///   - a: Complex array.
///   - b: Complex array.
/// - Returns: The result of the division.
public func / (a: ComplexFloatArray, b: ComplexFloatArray) -> ComplexFloatArray {
    assertSameSize(a, b)
    return vectorDivideComplexArray(a, b)
}

/// Division.
/// - Parameters:
///   - a: Complex array.
///   - b: Complex number.
/// - Returns: The result of the division.
public func / (a: ComplexFloatArray, b: ComplexFloat) -> ComplexFloatArray {
    return vectorDivideComplexArrayComplex(a, b)
}

/// Division.
/// - Parameters:
///   - a: Complex number.
///   - b: Complex array.
/// - Returns: The result of the division.
public func / (a: ComplexFloat, b: ComplexFloatArray) -> ComplexFloatArray {
    return vectorDivideComplexComplexArray(a, b)
}

/// Division.
/// - Parameters:
///   - a: Complex array.
///   - b: Real array.
/// - Returns: The result of the division.
public func / (a: ComplexFloatArray, b: RealFloatArray) -> ComplexFloatArray {
    assertSameSize(a, b)
    return vectorDivideComplexArrayRealArray(a, b)
}

/// Division.
/// - Parameters:
///   - a: Real array.
///   - b: Complex array.
/// - Returns: The result of the division.
public func / (a: RealFloatArray, b: ComplexFloatArray) -> ComplexFloatArray {
    assertSameSize(a, b)
    return vectorDivideRealArrayComplexArray(a, b)
}

/// Division.
/// - Parameters:
///   - a: Complex array.
///   - b: Real number.
/// - Returns: The result of the division.
public func / (a: ComplexFloatArray, b: RealFloat) -> ComplexFloatArray {
    return vectorDivideComplexArrayReal(a, b)
}

/// Division.
/// - Parameters:
///   - a: Real number.
///   - b: Complex array.
/// - Returns: The result of the division.
public func / (a: RealFloat, b: ComplexFloatArray) -> ComplexFloatArray {
    return vectorDivideRealComplexArray(a, b)
}

/// Division.
/// - Parameters:
///   - a: Complex number.
///   - b: Real array.
/// - Returns: The result of the division
public func / (a: ComplexFloat, b: RealFloatArray) -> ComplexFloatArray {
    return vectorDivideComplexRealArray(a, b)
}

/// Division.
/// - Parameters:
///   - a: Real array.
///   - b: Complex number.
/// - Returns: The result of the division.
public func / (a: RealFloatArray, b: ComplexFloat) -> ComplexFloatArray {
    return vectorDivideRealArrayComplex(a, b)
}
