//
//  add+Double.swift
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
public func + (a: RealDoubleArray, b: RealDoubleArray) -> RealDoubleArray {
    assert(a.count == b.count,
           "Incompatible sizes \(a.count) \(b.count). Use cat() to join arrays.", file: #file, line: #line)
    return vDSP.add(a, b)
}

/// Addition.
/// - Parameters:
///   - a: Real array.
///   - b: Real number.
/// - Returns: The result of the addition.
public func + (a: RealDoubleArray, b: RealDouble) -> RealDoubleArray {
    return vDSP.add(b, a)
}

/// Addition.
/// - Parameters:
///   - a: Real number.
///   - b: Real array.
/// - Returns: The result of the addition.
public func + (a: RealDouble, b: RealDoubleArray) -> RealDoubleArray {
    return vDSP.add(a, b)
}

// MARK: Complex

/// Addition.
/// - Parameters:
///   - a: Complex number.
///   - b: Complex number.
/// - Returns: The result of the addition.
public func + (a: ComplexDouble, b: ComplexDouble) -> ComplexDouble {
    return (a.0 + b.0, a.1 + b.1)
}

/// Addition.
/// - Parameters:
///   - a: Complex number.
///   - b: Real number.
/// - Returns: The result of the addition.
public func + (a: ComplexDouble, b: RealDouble) -> ComplexDouble {
    return (a.0 + b, a.1)
}

/// Addition.
/// - Parameters:
///   - a: Real number.
///   - b: Complex number.
/// - Returns: The result of the addition.
public func + (a: RealDouble, b: ComplexDouble) -> ComplexDouble {
    return b + a
}

// MARK: Complex array

/// Addition.
/// - Parameters:
///   - a: Complex array.
///   - b: Complex array.
/// - Returns: The result of the addition.
public func + (a: ComplexDoubleArray, b: ComplexDoubleArray) -> ComplexDoubleArray {
    assertSameSize(a, b)
    return vectorAddComplexArray(a, b) // Not needed ???
}

/// Addition.
/// - Parameters:
///   - a: Complex array.
///   - b: Complex number.
/// - Returns: The result of the addition.
public func + (a: ComplexDoubleArray, b: ComplexDouble) -> ComplexDoubleArray {
    let r = vDSP.add(b.0, a.0)
    let i = vDSP.add(b.1, a.1)
    return (r, i)
}

/// Addition.
/// - Parameters:
///   - a: Complex number.
///   - b: Complex array.
/// - Returns: The result of the addition.
public func + (a: ComplexDouble, b: ComplexDoubleArray) -> ComplexDoubleArray {
    let r = vDSP.add(a.0, b.0)
    let i = vDSP.add(a.1, b.1)
    return (r, i)
}

/// Addition.
/// - Parameters:
///   - a: Complex array.
///   - b: Real array.
/// - Returns: The result of the addition.
public func + (a: ComplexDoubleArray, b: RealDoubleArray) -> ComplexDoubleArray {
    assertSameSize(a, b)
    let r = vDSP.add(a.0, b)
    return (r, a.1)
}

/// Addition.
/// - Parameters:
///   - a: Real array.
///   - b: Complex array.
/// - Returns: The result of the addition.
public func + (a: RealDoubleArray, b: ComplexDoubleArray) -> ComplexDoubleArray {
    assertSameSize(a, b)
    let r = vDSP.add(b.0, a)
    return (r, b.1)
}

/// Addition.
/// - Parameters:
///   - a: Complex array.
///   - b: Real.
/// - Returns: The result of the addition.
public func + (a: ComplexDoubleArray, b: RealDouble) -> ComplexDoubleArray {
    let r = vDSP.add(b, a.0)
    return (r, a.1)
}

/// Addition.
/// - Parameters:
///   - a: Real number.
///   - b: Complex array.
/// - Returns: The result of the addition.
public func + (a: RealDouble, b: ComplexDoubleArray) -> ComplexDoubleArray {
    let r = vDSP.add(a, b.0)
    return (r, b.1)
}

// MARK: Complex & Real Array

/// Addition.
/// - Parameters:
///   - a: Complex number.
///   - b: Real array.
/// - Returns: The result of the addition.
public func + (a: ComplexDouble, b: RealDoubleArray) -> ComplexDoubleArray {
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
public func + (a: RealDoubleArray, b: ComplexDouble) -> ComplexDoubleArray {
    let r = vDSP.add(b.0, a)
    var i = a
    vectorFillRealArray(b.1, c: &i)
    return (r, i)
}
