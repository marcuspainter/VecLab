//
//  subtract+Float.swift
//
//
//  Created by Marcus Painter on 04/09/2024.
//


import Accelerate
import Foundation

// NOT VECTORIZED

/// Subtraction.
/// - Parameters:
///   - a: Real array.
///   - b: Real array.
/// - Returns: The result of the subtraction.
public func - (a: RealFloatArray, b: RealFloatArray) -> RealFloatArray {
    return vDSP.subtract(a, b)
}

/// Subtraction.
/// - Parameters:
///   - a: Real array.
///   - b: Real number.
/// - Returns: The result of the subtraction.
public func - (a: RealFloatArray, b: RealFloat) -> RealFloatArray {
    let minusb = -b
    return vDSP.add(minusb, a)
}

/// Subtraction.
/// - Parameters:
///   - a: Real number.
///   - b: Real array.
/// - Returns: The result of the subtraction
public func - (a: RealFloat, b: RealFloatArray) -> RealFloatArray {
    let minusb = vDSP.negative(b)
    return vDSP.add(a, minusb)
}

// MARK: Complex

/// Subtraction.
/// - Parameters:
///   - a: Complex number.
///   - b: Complex number.
/// - Returns: The result of the subtraction.
public func - (a: ComplexFloat, b: ComplexFloat) -> ComplexFloat {
    return (a.0 - b.0, a.1 - b.1)
}

/// Subtraction.
/// - Parameters:
///   - a: Complex number.
///   - b: Real number.
/// - Returns: The result of the subtraction.
public func - (a: ComplexFloat, b: RealFloat) -> ComplexFloat {
    return (a.0 - b, a.1)
}

/// Subtraction.
/// - Parameters:
///   - a: RealFloat number.
///   - b: Complex number.
/// - Returns: The result of the subtraction.
public func - (a: RealFloat, b: ComplexFloat) -> ComplexFloat {
    return (a - b.0, -b.1)
}

/// Subtraction.
/// - Parameters:
///   - a: Complex array.
///   - b: Complex array.
/// - Returns: The result of the subtraction.
public func - (a: ComplexFloatArray, b: ComplexFloatArray) -> ComplexFloatArray {
    assertSameSize(a, b)
    return vectorSubtractComplexArray(a, b)
}

/// Subtraction.
/// - Parameters:
///   - a: Complex array.
///   - b: Complex number.
/// - Returns: The result of the subtraction.
public func - (a: ComplexFloatArray, b: ComplexFloat) -> ComplexFloatArray {
    return (a.0 - b.0, a.1 - b.1)
}

/// Subtraction.
/// - Parameters:
///   - a: Complex number.
///   - b: Complex array.
/// - Returns: The result of the subtraction.
public func - (a: ComplexFloat, b: ComplexFloatArray) -> ComplexFloatArray {
    return b - a
}

/// Subtraction.
/// - Parameters:
///   - a: Complex array.
///   - b: Real array.
/// - Returns: The result of the subtraction.
public func - (a: ComplexFloatArray, b: RealFloatArray) -> ComplexFloatArray {
    assertSameSize(a, b)
    return (a.0 - b, a.1)
}

/// Subtraction.
/// - Parameters:
///   - a: Real array.
///   - b: Complex array.
/// - Returns: The result of the subtraction.
public func - (a: RealFloatArray, b: ComplexFloatArray) -> ComplexFloatArray {
    assertSameSize(a, b)
    return b - a
}

/// Subtraction.
/// - Parameters:
///   - a: Complex array.
///   - b: Real number.
/// - Returns: The result of the subtraction.
public func - (a: ComplexFloatArray, b: RealFloat) -> ComplexFloatArray {
    return (a.0 - b, a.1)
}

/// Subtraction.
/// - Parameters:
///   - a: Real number.
///   - b: Complex array.
/// - Returns: The result of the subtraction
public func - (a: RealFloat, b: ComplexFloatArray) -> ComplexFloatArray {
    return (a - b.0, b.1)
}

/// Subtraction.
/// - Parameters:
///   - a: Complex number.
///   - b: Real array.
/// - Returns: The result of the subtraction
public func - (a: ComplexFloat, b: RealFloatArray) -> ComplexFloatArray {
    let r = a.0 - b
    let i = RealFloatArray(repeating: RealFloat(a.1), count: b.count)
    return (r, i)
}

/// Subtraction.
/// - Parameters:
///   - a: Real array.
///   - b: Complex number.
/// - Returns: The result of the subtraction
public func - (a: RealFloatArray, b: ComplexFloat) -> ComplexFloatArray {
    let r = a - b.0
    let i = RealFloatArray(repeating: -RealFloat(b.1), count: a.count)
    return (r, i)
}

