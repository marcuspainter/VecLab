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
public func / (a: RealDoubleArray, b: RealDoubleArray) -> RealDoubleArray {
    assertSameSize(a, b)
    return vDSP.divide(a, b)
}

/// Division.
/// - Parameters:
///   - a: Real array.
///   - b: Real number.
/// - Returns: The result of the division.
public func / (a: RealDoubleArray, b: RealDouble) -> RealDoubleArray {
    return vDSP.divide(a, b)
}

/// Division
/// - Parameters:
///   - a: Real number
///   - b: Real array
/// - Returns: The result of the division
public func / (a: RealDouble, b: RealDoubleArray) -> RealDoubleArray {
    return vDSP.divide(a, b)
}

// MARK: Complex Array

/// Division.
/// - Parameters:
///   - a: Complex number.
///   - b: Complex number.
/// - Returns: The result of the division
public func / (a: ComplexDouble, b: ComplexDouble) -> ComplexDouble {
    return complexDivide(a, b)
}

/// Division.
/// - Parameters:
///   - a: Complex number.
///   - b: Real number.
/// - Returns: The result of the division.
public func / (a: ComplexDouble, b: RealDouble) -> ComplexDouble {
    return (a.0 / b, a.1 / b)
}

/// Division.
/// - Parameters:
///   - a: Real number.
///   - b: Complex number.
/// - Returns: The result of the division.
public func / (a: RealDouble, b: ComplexDouble) -> ComplexDouble {
    return complexDivide((a, 0), b)
}

/// Division.
/// - Parameters:
///   - a: Complex array.
///   - b: Complex array.
/// - Returns: The result of the division.
public func / (a: ComplexDoubleArray, b: ComplexDoubleArray) -> ComplexDoubleArray {
    assertSameSize(a, b)
    return vectorDivideComplexArray(a, b)
}

/// Division.
/// - Parameters:
///   - a: Complex array.
///   - b: Complex number.
/// - Returns: The result of the division.
public func / (a: ComplexDoubleArray, b: ComplexDouble) -> ComplexDoubleArray {
    return vectorDivideComplexArrayComplex(a, b)
}

/// Division.
/// - Parameters:
///   - a: Complex number.
///   - b: Complex array.
/// - Returns: The result of the division.
public func / (a: ComplexDouble, b: ComplexDoubleArray) -> ComplexDoubleArray {
    return vectorDivideComplexComplexArray(a, b)
}

/// Division.
/// - Parameters:
///   - a: Complex array.
///   - b: Real array.
/// - Returns: The result of the division.
public func / (a: ComplexDoubleArray, b: RealDoubleArray) -> ComplexDoubleArray {
    assertSameSize(a, b)
    return vectorDivideComplexArrayRealArray(a, b)
}

/// Division.
/// - Parameters:
///   - a: Real array.
///   - b: Complex array.
/// - Returns: The result of the division.
public func / (a: RealDoubleArray, b: ComplexDoubleArray) -> ComplexDoubleArray {
    assertSameSize(a, b)
    return vectorDivideRealArrayComplexArray(a, b)
}

/// Division.
/// - Parameters:
///   - a: Complex array.
///   - b: Real number.
/// - Returns: The result of the division.
public func / (a: ComplexDoubleArray, b: RealDouble) -> ComplexDoubleArray {
    return vectorDivideComplexArrayReal(a, b)
}

/// Division.
/// - Parameters:
///   - a: Real number.
///   - b: Complex array.
/// - Returns: The result of the division.
public func / (a: RealDouble, b: ComplexDoubleArray) -> ComplexDoubleArray {
    return vectorDivideRealComplexArray(a, b)
}

/// Division.
/// - Parameters:
///   - a: Complex number.
///   - b: Real array.
/// - Returns: The result of the division
public func / (a: ComplexDouble, b: RealDoubleArray) -> ComplexDoubleArray {
    return vectorDivideComplexRealArray(a, b)
}

/// Division.
/// - Parameters:
///   - a: Real array.
///   - b: Complex number.
/// - Returns: The result of the division.
public func / (a: RealDoubleArray, b: ComplexDouble) -> ComplexDoubleArray {
    return vectorDivideRealArrayComplex(a, b)
}
