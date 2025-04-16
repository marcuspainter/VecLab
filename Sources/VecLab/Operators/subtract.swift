//
//  subtract.swift
//
//
//  Created by Marcus Painter on 09/09/2023.
//

import Accelerate
import Foundation

/// Subtraction.
/// - Parameters:
///   - a: Real array.
///   - b: Real array.
/// - Returns: The result of the subtraction.
public func - (a: RealArray, b: RealArray) -> RealArray {
    assertSameSize(a, b)
    return vDSP.subtract(a, b)
}

/// Subtraction.
/// - Parameters:
///   - a: Real array.
///   - b: Real number.
/// - Returns: The result of the subtraction.
public func - (a: RealArray, b: Real) -> RealArray {
    let minusb = -b
    return vDSP.add(minusb, a)
}

/// Subtraction.
/// - Parameters:
///   - a: Real number.
///   - b: Real array.
/// - Returns: The result of the subtraction
public func - (a: Real, b: RealArray) -> RealArray {
    let minusb = -b
    return vDSP.add(a, minusb)
}

// MARK: Complex

/// Subtraction.
/// - Parameters:
///   - a: Complex number.
///   - b: Complex number.
/// - Returns: The result of the subtraction.
public func - (a: Complex, b: Complex) -> Complex {
    return Complex(a.real - b.real, a.imag - b.imag)
}

/// Subtraction.
/// - Parameters:
///   - a: Complex number.
///   - b: Real number.
/// - Returns: The result of the subtraction.
public func - (a: Complex, b: Real) -> Complex {
    return Complex(a.real - b, a.imag)
}

/// Subtraction.
/// - Parameters:
///   - a: Real number.
///   - b: Complex number.
/// - Returns: The result of the subtraction.
public func - (a: Real, b: Complex) -> Complex {
    return Complex(a - b.real, -b.imag)
}

/// Subtraction.
/// - Parameters:
///   - a: Complex array.
///   - b: Complex array.
/// - Returns: The result of the subtraction.
public func - (a: ComplexArray, b: ComplexArray) -> ComplexArray {
    assertSameSize(a, b)
    return vectorSubtractComplexArray(a, b)
}

/// Subtraction.
/// - Parameters:
///   - a: Complex array.
///   - b: Complex number.
/// - Returns: The result of the subtraction.
public func - (a: ComplexArray, b: Complex) -> ComplexArray {
    assertSameSize(a)
    return ComplexArray(a.real - b.real, a.imag - b.imag)
}

/// Subtraction.
/// - Parameters:
///   - a: Complex number.
///   - b: Complex array.
/// - Returns: The result of the subtraction.
public func - (a: Complex, b: ComplexArray) -> ComplexArray {
    assertSameSize(b)
    return b - a
}

/// Subtraction.
/// - Parameters:
///   - a: Complex array.
///   - b: Real array.
/// - Returns: The result of the subtraction.
public func - (a: ComplexArray, b: RealArray) -> ComplexArray {
    assertSameSize(a, b)
    return ComplexArray(a.real - b, a.imag)
}

/// Subtraction.
/// - Parameters:
///   - a: Real array.
///   - b: Complex array.
/// - Returns: The result of the subtraction.
public func - (a: RealArray, b: ComplexArray) -> ComplexArray {
    assertSameSize(a, b)
    return b - a
}

/// Subtraction.
/// - Parameters:
///   - a: Complex array.
///   - b: Real number.
/// - Returns: The result of the subtraction.
public func - (a: ComplexArray, b: Real) -> ComplexArray {
    assertSameSize(a)
    return ComplexArray(a.real - b, a.imag)
}

/// Subtraction.
/// - Parameters:
///   - a: Real number.
///   - b: Complex array.
/// - Returns: The result of the subtraction
public func - (a: Real, b: ComplexArray) -> ComplexArray {
    assertSameSize(b)
    return ComplexArray(a - b.real, -b.imag)
}

/// Subtraction.
/// - Parameters:
///   - a: Complex number.
///   - b: Real array.
/// - Returns: The result of the subtraction
public func - (a: Complex, b: RealArray) -> ComplexArray {
    let r = a.real - b
    let i = RealArray(repeating: Real(a.imag), count: b.count)
    return ComplexArray(r, i)
}

/// Subtraction.
/// - Parameters:
///   - a: Real array.
///   - b: Complex number.
/// - Returns: The result of the subtraction
public func - (a: RealArray, b: Complex) -> ComplexArray {
    let r = a - b.real
    let i = RealArray(repeating: -Real(b.imag), count: a.count)
    return ComplexArray(r, i)
}
