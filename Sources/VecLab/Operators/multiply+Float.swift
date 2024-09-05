//
//  multiply+Float.swift
//
//
//  Created by Marcus Painter on 09/09/2023.
//

import Accelerate
import Foundation

/// Multiplication.
/// - Parameters:
///   - a: Real array.
///   - b: Real array.
/// - Returns: The result of the multiplication.
public func * (a: RealFloatArray, b: RealFloatArray) -> RealFloatArray {
    assertSameSize(a, b)
    return vDSP.multiply(a, b)
}

/// Multiplication.
/// - Parameters:
///   - a: Real array.
///   - b: Real number.
/// - Returns: The result of the multiplication.
public func * (a: RealFloatArray, b: RealFloat) -> RealFloatArray {
    return vDSP.multiply(b, a)
}

/// Multiplication.
/// - Parameters:
///   - a: Real.
///   - b: Real array.
/// - Returns: The result of the multiplication.
public func * (a: RealFloat, b: RealFloatArray) -> RealFloatArray {
    return vDSP.multiply(a, b)
}

/// Multiplication.
/// - Parameters:
///   - a: Complex number.
///   - b: Complex number.
/// - Returns: The result of the multiplication.
public func * (a: ComplexFloat, b: ComplexFloat) -> ComplexFloat {
    return (a.0 * b.0 - a.1 * b.1, a.0 * b.1 + a.1 * b.0)
}

/// Multiplication.
/// - Parameters:
///   - a: Complex number.
///   - b: Real number.
/// - Returns: The result of the multiplication.
public func * (a: ComplexFloat, b: RealFloat) -> ComplexFloat {
    return (a.0 * b, a.1 * b)
}

/// Multiplication.
/// - Parameters:
///   - a: Real number.
///   - b: Complex number.
/// - Returns: The result of the multiplication.
public func * (a: RealFloat, b: ComplexFloat) -> ComplexFloat {
    return b * a
}

// MARK: Complex array

/// Multiplication.
/// - Parameters:
///   - a: Complex array.
///   - b: Complex array.
/// - Returns: The result of the multiplication.
public func * (a: ComplexFloatArray, b: ComplexFloatArray) -> ComplexFloatArray {
    assertSameSize(a, b)
    return vectorMultiplyComplexArray(a, b)
}

/// Multiplication.
/// - Parameters:
///   - a: Complex array.
///   - b: Complex number.
/// - Returns: The result of the multiplication.
public func * (a: ComplexFloatArray, b: ComplexFloat) -> ComplexFloatArray {
    return vectorMultiplyComplexArrayComplex(a, b)
}

/// Multiplication.
/// - Parameters:
///   - a: Complex number.
///   - b: Complex array.
/// - Returns: The result of the multiplication.
public func * (a: ComplexFloat, b: ComplexFloatArray) -> ComplexFloatArray {
    return vectorMultiplyComplexComplexArray(a, b)
}

/// Multiplication.
/// - Parameters:
///   - a: Complex array.
///   - b: Real array.
/// - Returns: The result of the multiplication.
public func * (a: ComplexFloatArray, b: RealFloatArray) -> ComplexFloatArray {
    assertSameSize(a, b)
    return vectorMultiplyComplexArrayRealArray(a, b)
}

/// Multiplication.
/// - Parameters:
///   - a: Real array.
///   - b: Complex array.
/// - Returns: The result of the multiplication.
public func * (a: RealFloatArray, b: ComplexFloatArray) -> ComplexFloatArray {
    assertSameSize(a, b)
    return vectorMultiplyComplexArrayRealArray(b, a)
}

/// Multiplication.
/// - Parameters:
///   - a: Complex array.
///   - b: Real number.
/// - Returns: The result of the multiplication.
public func * (a: ComplexFloatArray, b: RealFloat) -> ComplexFloatArray {
    let r = vDSP.multiply(b, a.0)
    let i = vDSP.multiply(b, a.1)
    return (r, i)
}

/// Multiplication.
/// - Parameters:
///   - a: Real number.
///   - b: Complex array.
/// - Returns: The result of the multiplication.
public func * (a: RealFloat, b: ComplexFloatArray) -> ComplexFloatArray {
    let r = vDSP.multiply(a, b.0)
    let i = vDSP.multiply(a, b.1)
    return (r, i)
}

/// Multiplication.
/// - Parameters:
///   - a: Complex number.
///   - b: Real array.
/// - Returns: The result of the multiplication.
public func * (a: ComplexFloat, b: RealFloatArray) -> ComplexFloatArray {
    let r = vDSP.multiply(a.0, b)
    let i = vDSP.multiply(a.1, b)
    return (r, i)
}

/// Multiplication.
/// - Parameters:
///   - a: Real array.
///   - b: Complex number.
/// - Returns: The result of the multiplication.
public func * (a: RealFloatArray, b: ComplexFloat) -> ComplexFloatArray {
    let r = vDSP.multiply(b.0, a)
    let i = vDSP.multiply(b.1, a)
    return (r, i)
}
