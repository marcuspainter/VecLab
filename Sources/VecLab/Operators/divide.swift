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
    return vectorComplexDivide(a, b)
}

/// Division.
/// - Parameters:
///   - a: Complex array.
///   - b: Complex number.
/// - Returns: The result of the division.
public func / (a: ComplexArray, b: Complex) -> ComplexArray {
    var c = a
    for k in 0 ..< a.0.count {
        (c.0[k], c.1[k]) = complexDivide((a.0[k], a.1[k]), (b.0, b.1))
    }
    return c
}

/// Division.
/// - Parameters:
///   - a: Complex number.
///   - b: Complex array.
/// - Returns: The result of the division.
public func / (a: Complex, b: ComplexArray) -> ComplexArray {
    var c = b
    for k in 0 ..< b.0.count {
        (c.0[k], c.1[k]) = complexDivide((a.0, a.1), (b.0[k], b.1[k]))
    }
    return c
}

/// Division.
/// - Parameters:
///   - a: Complex array.
///   - b: Real array.
/// - Returns: The result of the division.
public func / (a: ComplexArray, b: RealArray) -> ComplexArray {
    assertSameSize(a, b)
    return (a.0 / b, a.1 / b)
}

/// Division.
/// - Parameters:
///   - a: Real array.
///   - b: Complex array.
/// - Returns: The result of the division.
public func / (a: RealArray, b: ComplexArray) -> ComplexArray {
    assertSameSize(a, b)
    var c = b
    for k in 0 ..< a.count {
        (c.0[k], c.1[k]) = complexDivide((a[k], 0.0), (b.0[k], b.1[k]))
    }
    return c
}

/// Division.
/// - Parameters:
///   - a: Complex array.
///   - b: Real number.
/// - Returns: The result of the division.
public func / (a: ComplexArray, b: Real) -> ComplexArray {
    return (a.0 / b, a.1 / b)
}

/// Division.
/// - Parameters:
///   - a: Real number.
///   - b: Complex array.
/// - Returns: The result of the division.
public func / (a: Real, b: ComplexArray) -> ComplexArray {
    var c = b
    for k in 0 ..< b.0.count {
        (c.0[k], c.1[k]) = complexDivide((a, 0.0), (b.0[k], b.1[k]))
    }
    return c
}

/// Division.
/// - Parameters:
///   - a: Complex number.
///   - b: Real array.
/// - Returns: The result of the division
public func / (a: Complex, b: RealArray) -> ComplexArray {
    var c = (b, b)
    for k in 0 ..< b.count {
        (c.0[k], c.1[k]) = complexDivide((a.0, a.1), (b[k], Real(0)))
    }
    return c
}

/// Division.
/// - Parameters:
///   - a: Real array.
///   - b: Complex number.
/// - Returns: The result of the division.
public func / (a: RealArray, b: Complex) -> ComplexArray {
    var c = (a, a)
    for k in 0 ..< a.count {
        (c.0[k], c.1[k]) = complexDivide((a[k], Real(0)), (b.0, b.1))
    }
    return c
}
