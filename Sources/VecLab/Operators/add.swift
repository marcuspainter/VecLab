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
/*
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
*/

// MARK: Complex

/// Addition.
/// - Parameters:
///   - a: Complex number.
///   - b: Complex number.
/// - Returns: The result of the addition.
//public func + (a: Complex, b: Complex) -> Complex {
//    return Complex(a.real + b.real, a.imag + b.imag)
//}

/// Addition.
/// - Parameters:
///   - a: Complex number.
///   - b: Real number.
/// - Returns: The result of the addition.
//public func + (a: Complex, b: Real) -> Complex {
//    return Complex(a.real + b, a.imag)
//}

/// Addition.
/// - Parameters:
///   - a: Real number.
///   - b: Complex number.
/// - Returns: The result of the addition.
//public func + (a: Real, b: Complex) -> Complex {
//    return b + a
//}

// MARK: Complex array

/// Addition.
/// - Parameters:
///   - a: Complex array.
///   - b: Complex array.
/// - Returns: The result of the addition.
//public func + (a: ComplexArray, b: ComplexArray) -> ComplexArray {
//    assertSameSize(a, b)
//    let result = vectorAddComplexArray(a, b) // Not needed ???
//    return result
//}

/// Addition.
/// - Parameters:
///   - a: Complex array.
///   - b: Complex number.
/// - Returns: The result of the addition.
//public func + (a: ComplexArray, b: Complex) -> ComplexArray {
//    assertSameSize(a)
//    let r = vDSP.add(b.real, a.real)
//    let i = vDSP.add(b.imag, a.imag)
//    return ComplexArray(r, i)
//}

/// Addition.
/// - Parameters:
///   - a: Complex number.
///   - b: Complex array.
/// - Returns: The result of the addition.
//public func + (a: Complex, b: ComplexArray) -> ComplexArray {
//    assertSameSize(b)
//    let r = vDSP.add(a.real, b.real)
//    let i = vDSP.add(a.imag, b.imag)
//    return ComplexArray(r, i)
//}

/// Addition.
/// - Parameters:
///   - a: Complex array.
///   - b: Real array.
/// - Returns: The result of the addition.
//public func + (a: ComplexArray, b: RealArray) -> ComplexArray {
//    assertSameSize(a, b)
//    let real = vDSP.add(a.real, b)
//    return ComplexArray(real, a.imag)
//}

/// Addition.
/// - Parameters:
///   - a: Real array.
///   - b: Complex array.
/// - Returns: The result of the addition.
//public func + (a: RealArray, b: ComplexArray) -> ComplexArray {
//    assertSameSize(a, b)
//    let real = vDSP.add(b.real, a)
//    return ComplexArray(real, b.imag)
//}

/// Addition.
/// - Parameters:
///   - a: Complex array.
///   - b: Real.
/// - Returns: The result of the addition.
//public func + (a: ComplexArray, b: Real) -> ComplexArray {
//    assertSameSize(a)
//    let real = vDSP.add(b, a.real)
//    return ComplexArray(real, a.imag)
//}

/// Addition.
/// - Parameters:
///   - a: Real number.
///   - b: Complex array.
/// - Returns: The result of the addition.
//public func + (a: Real, b: ComplexArray) -> ComplexArray {
//    assertSameSize(b)
//    let real = vDSP.add(a, b.real)
//    return ComplexArray(real, b.imag)
//}

// MARK: Complex & Real Array

/// Addition.
/// - Parameters:
///   - a: Complex number.
///   - b: Real array.
/// - Returns: The result of the addition.
//public func + (a: Complex, b: RealArray) -> ComplexArray {
//    let real = vDSP.add(a.real, b)
//    var imag = b
//    vectorFillRealArray(a.imag, c: &imag)
//    return ComplexArray(real, imag)
//}

/// Addition.
/// - Parameters:
///   - a: Real array.
///   - b: Complex number.
/// - Returns: The result of the addition.
//public func + (a: RealArray, b: Complex) -> ComplexArray {
//    let real = vDSP.add(b.real, a)
//    var imag = a
//    vectorFillRealArray(b.imag, c: &imag)
//    return ComplexArray(real, imag)
//}
