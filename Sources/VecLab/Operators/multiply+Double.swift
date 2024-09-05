//
//  multiply+Double.swift
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
public func * (a: RealDoubleArray, b: RealDoubleArray) -> RealDoubleArray {
    assertSameSize(a, b)
    return vDSP.multiply(a, b)
}

/// Multiplication.
/// - Parameters:
///   - a: Real array.
///   - b: Real number.
/// - Returns: The result of the multiplication.
public func * (a: RealDoubleArray, b: RealDouble) -> RealDoubleArray {
    return vDSP.multiply(b, a)
}

/// Multiplication.
/// - Parameters:
///   - a: Real.
///   - b: Real array.
/// - Returns: The result of the multiplication.
public func * (a: RealDouble, b: RealDoubleArray) -> RealDoubleArray {
    return vDSP.multiply(a, b)
}

/// Multiplication.
/// - Parameters:
///   - a: Complex number.
///   - b: Complex number.
/// - Returns: The result of the multiplication.
public func * (a: ComplexDouble, b: ComplexDouble) -> ComplexDouble {
    return (a.0 * b.0 - a.1 * b.1, a.0 * b.1 + a.1 * b.0)
}

/// Multiplication.
/// - Parameters:
///   - a: Complex number.
///   - b: Real number.
/// - Returns: The result of the multiplication.
public func * (a: ComplexDouble, b: RealDouble) -> ComplexDouble {
    return (a.0 * b, a.1 * b)
}

/// Multiplication.
/// - Parameters:
///   - a: Real number.
///   - b: Complex number.
/// - Returns: The result of the multiplication.
public func * (a: RealDouble, b: ComplexDouble) -> ComplexDouble {
    return b * a
}

// MARK: Complex array

/// Multiplication.
/// - Parameters:
///   - a: Complex array.
///   - b: Complex array.
/// - Returns: The result of the multiplication.
public func * (a: ComplexDoubleArray, b: ComplexDoubleArray) -> ComplexDoubleArray {
    assertSameSize(a, b)
    return vectorMultiplyComplexArray(a, b)
}

/// Multiplication.
/// - Parameters:
///   - a: Complex array.
///   - b: Complex number.
/// - Returns: The result of the multiplication.
public func * (a: ComplexDoubleArray, b: ComplexDouble) -> ComplexDoubleArray {
    return vectorMultiplyComplexArrayComplex(a, b)
}

/// Multiplication.
/// - Parameters:
///   - a: Complex number.
///   - b: Complex array.
/// - Returns: The result of the multiplication.
public func * (a: ComplexDouble, b: ComplexDoubleArray) -> ComplexDoubleArray {
    return vectorMultiplyComplexComplexArray(a, b)
}

/// Multiplication.
/// - Parameters:
///   - a: Complex array.
///   - b: Real array.
/// - Returns: The result of the multiplication.
public func * (a: ComplexDoubleArray, b: RealDoubleArray) -> ComplexDoubleArray {
    assertSameSize(a, b)
    return vectorMultiplyComplexArrayRealArray(a, b)
}

/// Multiplication.
/// - Parameters:
///   - a: Real array.
///   - b: Complex array.
/// - Returns: The result of the multiplication.
public func * (a: RealDoubleArray, b: ComplexDoubleArray) -> ComplexDoubleArray {
    assertSameSize(a, b)
    return vectorMultiplyComplexArrayRealArray(b, a)
}

/// Multiplication.
/// - Parameters:
///   - a: Complex array.
///   - b: Real number.
/// - Returns: The result of the multiplication.
public func * (a: ComplexDoubleArray, b: RealDouble) -> ComplexDoubleArray {
    let r = vDSP.multiply(b, a.0)
    let i = vDSP.multiply(b, a.1)
    return (r, i)
}

/// Multiplication.
/// - Parameters:
///   - a: Real number.
///   - b: Complex array.
/// - Returns: The result of the multiplication.
public func * (a: RealDouble, b: ComplexDoubleArray) -> ComplexDoubleArray {
    let r = vDSP.multiply(a, b.0)
    let i = vDSP.multiply(a, b.1)
    return (r, i)
}

/// Multiplication.
/// - Parameters:
///   - a: Complex number.
///   - b: Real array.
/// - Returns: The result of the multiplication.
public func * (a: ComplexDouble, b: RealDoubleArray) -> ComplexDoubleArray {
    let r = vDSP.multiply(a.0, b)
    let i = vDSP.multiply(a.1, b)
    return (r, i)
}

/// Multiplication.
/// - Parameters:
///   - a: Real array.
///   - b: Complex number.
/// - Returns: The result of the multiplication.
public func * (a: RealDoubleArray, b: ComplexDouble) -> ComplexDoubleArray {
    let r = vDSP.multiply(b.0, a)
    let i = vDSP.multiply(b.1, a)
    return (r, i)
}
