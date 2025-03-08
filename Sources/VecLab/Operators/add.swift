//
//  add.swift
//
//
//  Created by Marcus Painter on 09/09/2023.
//

// FULLY VECTORIZED

import Accelerate
import Foundation

// MARK: Real array

/// Addition.
/// - Parameters:
///   - a: Real array.
///   - b: Real array.
/// - Returns: The result of the addition.
public func + (a: RealArray, b: RealArray) -> RealArray {
    assert(a.count == b.count,
           "Incompatible sizes \(a.count) \(b.count). Use cat() to join arrays.", file: #file, line: #line)
    return vDSP.add(a, b)
}

/// Addition.
/// - Parameters:
///   - a: Real array.
///   - b: Real number.
/// - Returns: The result of the addition.
public func + (a: RealArray, b: Real) -> RealArray {
    return vDSP.add(b, a)
}

/// Addition.
/// - Parameters:
///   - a: Real number.
///   - b: Real array.
/// - Returns: The result of the addition.
public func + (a: Real, b: RealArray) -> RealArray {
    return vDSP.add(a, b)
}

// MARK: Complex

/// Addition.
/// - Parameters:
///   - a: Complex number.
///   - b: Complex number.
/// - Returns: The result of the addition.
public func + (a: Complex, b: Complex) -> Complex {
    return (a.0 + b.0, a.1 + b.1)
}

/// Addition.
/// - Parameters:
///   - a: Complex number.
///   - b: Real number.
/// - Returns: The result of the addition.
public func + (a: Complex, b: Real) -> Complex {
    return (a.0 + b, a.1)
}

/// Addition.
/// - Parameters:
///   - a: Real number.
///   - b: Complex number.
/// - Returns: The result of the addition.
public func + (a: Real, b: Complex) -> Complex {
    return b + a
}

// MARK: Complex array

/// Addition.
/// - Parameters:
///   - a: Complex array.
///   - b: Complex array.
/// - Returns: The result of the addition.
public func + (a: ComplexArray, b: ComplexArray) -> ComplexArray {
    assertSameSize(a, b)
    return vectorAddComplexArray(a, b) // Not needed ???
}

/// Addition.
/// - Parameters:
///   - a: Complex array.
///   - b: Complex number.
/// - Returns: The result of the addition.
public func + (a: ComplexArray, b: Complex) -> ComplexArray {
    assertSameSize(a)
    let r = vDSP.add(b.0, a.0)
    let i = vDSP.add(b.1, a.1)
    return (r, i)
}

/// Addition.
/// - Parameters:
///   - a: Complex number.
///   - b: Complex array.
/// - Returns: The result of the addition.
public func + (a: Complex, b: ComplexArray) -> ComplexArray {
    assertSameSize(b)
    let r = vDSP.add(a.0, b.0)
    let i = vDSP.add(a.1, b.1)
    return (r, i)
}

/// Addition.
/// - Parameters:
///   - a: Complex array.
///   - b: Real array.
/// - Returns: The result of the addition.
public func + (a: ComplexArray, b: RealArray) -> ComplexArray {
    assertSameSize(a, b)
    let r = vDSP.add(a.0, b)
    return (r, a.1)
}

/// Addition.
/// - Parameters:
///   - a: Real array.
///   - b: Complex array.
/// - Returns: The result of the addition.
public func + (a: RealArray, b: ComplexArray) -> ComplexArray {
    assertSameSize(a, b)
    let r = vDSP.add(b.0, a)
    return (r, b.1)
}

/// Addition.
/// - Parameters:
///   - a: Complex array.
///   - b: Real.
/// - Returns: The result of the addition.
public func + (a: ComplexArray, b: Real) -> ComplexArray {
    assertSameSize(a)
    let r = vDSP.add(b, a.0)
    return (r, a.1)
}

/// Addition.
/// - Parameters:
///   - a: Real number.
///   - b: Complex array.
/// - Returns: The result of the addition.
public func + (a: Real, b: ComplexArray) -> ComplexArray {
    assertSameSize(b)
    let r = vDSP.add(a, b.0)
    return (r, b.1)
}

// MARK: Complex & Real Array

/// Addition.
/// - Parameters:
///   - a: Complex number.
///   - b: Real array.
/// - Returns: The result of the addition.
public func + (a: Complex, b: RealArray) -> ComplexArray {
    let r = vDSP.add(a.0, b)
    var i = b
    vectorFillRealArray(a.1, c: &i)
    return (r, i)
}

/// Addition.
/// - Parameters:
///   - a: Real array.
///   - b: Complex number.
/// - Returns: The result of the addition.
public func + (a: RealArray, b: Complex) -> ComplexArray {
    let r = vDSP.add(b.0, a)
    var i = a
    vectorFillRealArray(b.1, c: &i)
    return (r, i)
}
