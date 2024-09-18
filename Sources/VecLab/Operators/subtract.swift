//
//  subtract.swift
//
//
//  Created by Marcus Painter on 09/09/2023.
//

import Accelerate
import Foundation

// NOT VECTORIZED

/// Subtraction.
/// - Parameters:
///   - a: Real array.
///   - b: Real array.
/// - Returns: The result of the subtraction.
public func - (a: RealArray, b: RealArray) -> RealArray {
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
    return (a.0 - b.0, a.1 - b.1)
}

/// Subtraction.
/// - Parameters:
///   - a: Complex number.
///   - b: Real number.
/// - Returns: The result of the subtraction.
public func - (a: Complex, b: Real) -> Complex {
    return (a.0 - b, a.1)
}

/// Subtraction.
/// - Parameters:
///   - a: Real number.
///   - b: Complex number.
/// - Returns: The result of the subtraction.
public func - (a: Real, b: Complex) -> Complex {
    return (a - b.0, -b.1)
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
    return (a.0 - b.0, a.1 - b.1)
}

/// Subtraction.
/// - Parameters:
///   - a: Complex number.
///   - b: Complex array.
/// - Returns: The result of the subtraction.
public func - (a: Complex, b: ComplexArray) -> ComplexArray {
    return b - a
}

/// Subtraction.
/// - Parameters:
///   - a: Complex array.
///   - b: Real array.
/// - Returns: The result of the subtraction.
public func - (a: ComplexArray, b: RealArray) -> ComplexArray {
    assertSameSize(a, b)
    return (a.0 - b, a.1)
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
    return (a.0 - b, a.1)
}

/// Subtraction.
/// - Parameters:
///   - a: Real number.
///   - b: Complex array.
/// - Returns: The result of the subtraction
public func - (a: Real, b: ComplexArray) -> ComplexArray {
    return (a - b.0, -b.1)
}

/// Subtraction.
/// - Parameters:
///   - a: Complex number.
///   - b: Real array.
/// - Returns: The result of the subtraction
public func - (a: Complex, b: RealArray) -> ComplexArray {
    let r = a.0 - b
    let i = RealArray(repeating: Real(a.1), count: b.count)
    return (r, i)
}

/// Subtraction.
/// - Parameters:
///   - a: Real array.
///   - b: Complex number.
/// - Returns: The result of the subtraction
public func - (a: RealArray, b: Complex) -> ComplexArray {
    let r = a - b.0
    let i = RealArray(repeating: -Real(b.1), count: a.count)
    return (r, i)
}
