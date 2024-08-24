//
//  multiply.swift
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
public func * (a: RealArray, b: RealArray) -> RealArray {
    assertSameSize(a, b)
    // return zip(a, b).map { $0 * $1 }
    return vDSP.multiply(a, b)
}

/// Multiplication.
/// - Parameters:
///   - a: Real array.
///   - b: Real number.
/// - Returns: The result of the multiplication.
public func * (a: RealArray, b: Real) -> RealArray {
    // return a.map { $0 * b }
    return vDSP.multiply(b, a)
}

/// Multiplication.
/// - Parameters:
///   - a: Real.
///   - b: Real array.
/// - Returns: The result of the multiplication.
public func * (a: Real, b: RealArray) -> RealArray {
    // return b.map { a * $0  }
    return vDSP.multiply(a, b)
}

/// Multiplication.
/// - Parameters:
///   - a: Complex number.
///   - b: Complex number.
/// - Returns: The result of the multiplication.
public func * (a: Complex, b: Complex) -> Complex {
    return (a.0 * b.0 - a.1 * b.1, a.0 * b.1 + a.1 * b.0)
}

/// Multiplication.
/// - Parameters:
///   - a: Complex number.
///   - b: Real number.
/// - Returns: The result of the multiplication.
public func * (a: Complex, b: Real) -> Complex {
    return (a.0 * b, a.1 * b)
}

/// Multiplication.
/// - Parameters:
///   - a: Real number.
///   - b: Complex number.
/// - Returns: The result of the multiplication.
public func * (a: Real, b: Complex) -> Complex {
    return b * a
}

// MARK: Complex array

/// Multiplication.
/// - Parameters:
///   - a: Complex array.
///   - b: Complex array.
/// - Returns: The result of the multiplication.
public func * (a: ComplexArray, b: ComplexArray) -> ComplexArray {
    assertSameSize(a, b)
    return vectorMultiplyComplexArray(a, b)
}

/// Multiplication.
/// - Parameters:
///   - a: Complex array.
///   - b: Complex number.
/// - Returns: The result of the multiplication.
public func * (a: ComplexArray, b: Complex) -> ComplexArray {
    var c = a
    for k in 0 ..< a.0.count {
        (c.0[k], c.1[k]) = complexMultiply((a.0[k], a.1[k]), b)
    }
    return c
}

/// Multiplication.
/// - Parameters:
///   - a: Complex number.
///   - b: Complex array.
/// - Returns: The result of the multiplication.
public func * (a: Complex, b: ComplexArray) -> ComplexArray {
    var c = b
    for k in 0 ..< b.0.count {
        (c.0[k], c.1[k]) = complexMultiply(a, (b.0[k], b.1[k]))
    }
    return c
}

/// Multiplication.
/// - Parameters:
///   - a: Complex array.
///   - b: Real array.
/// - Returns: The result of the multiplication.
public func * (a: ComplexArray, b: RealArray) -> ComplexArray {
    assertSameSize(a, b)
    let r = vDSP.multiply(a.0, b)
    let i = vDSP.multiply(a.1, b)
    return (r, i)
}

/// Multiplication.
/// - Parameters:
///   - a: Real array.
///   - b: Complex array.
/// - Returns: The result of the multiplication.
public func * (a: RealArray, b: ComplexArray) -> ComplexArray {
    assertSameSize(a, b)
    let r = vDSP.multiply(b.0, a)
    let i = vDSP.multiply(b.1, a)
    return (r, i)
}

/// Multiplication.
/// - Parameters:
///   - a: Complex array.
///   - b: Real number.
/// - Returns: The result of the multiplication.
public func * (a: ComplexArray, b: Real) -> ComplexArray {
    let r = vDSP.multiply(b, a.0)
    let i = vDSP.multiply(b, a.1)
    return (r, i)
}

/// Multiplication.
/// - Parameters:
///   - a: Real number.
///   - b: Complex array.
/// - Returns: The result of the multiplication.
public func * (a: Real, b: ComplexArray) -> ComplexArray {
    let r = vDSP.multiply(a, b.0)
    let i = vDSP.multiply(a, b.1)
    return (r, i)
}

/// Multiplication.
/// - Parameters:
///   - a: Complex number.
///   - b: Real array.
/// - Returns: The result of the multiplication.
public func * (a: Complex, b: RealArray) -> ComplexArray {
    let r = vDSP.multiply(a.0, b)
    let i = vDSP.multiply(a.1, b)
    return (r, i)
}

/// Multiplication.
/// - Parameters:
///   - a: Real array.
///   - b: Complex number.
/// - Returns: The result of the multiplication.
public func * (a: RealArray, b: Complex) -> ComplexArray {
    let r = vDSP.multiply(b.0, a)
    let i = vDSP.multiply(b.1, a)
    return (r, i)
}
