//
//  subtract+Double.swift
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
public func - (a: RealDoubleArray, b: RealDoubleArray) -> RealDoubleArray {
    return vDSP.subtract(a, b)
}

/// Subtraction.
/// - Parameters:
///   - a: Real array.
///   - b: Real number.
/// - Returns: The result of the subtraction.
public func - (a: RealDoubleArray, b: RealDouble) -> RealDoubleArray {
    let minusb = -b
    return vDSP.add(minusb, a)
}

/// Subtraction.
/// - Parameters:
///   - a: Real number.
///   - b: Real array.
/// - Returns: The result of the subtraction
public func - (a: RealDouble, b: RealDoubleArray) -> RealDoubleArray {
    let minusb = -b
    return vDSP.add(a, minusb)
}

// MARK: Complex

/// Subtraction.
/// - Parameters:
///   - a: Complex number.
///   - b: Complex number.
/// - Returns: The result of the subtraction.
public func - (a: ComplexDouble, b: ComplexDouble) -> ComplexDouble {
    return (a.0 - b.0, a.1 - b.1)
}

/// Subtraction.
/// - Parameters:
///   - a: Complex number.
///   - b: Real number.
/// - Returns: The result of the subtraction.
public func - (a: ComplexDouble, b: RealDouble) -> ComplexDouble {
    return (a.0 - b, a.1)
}

/// Subtraction.
/// - Parameters:
///   - a: RealDouble number.
///   - b: Complex number.
/// - Returns: The result of the subtraction.
public func - (a: RealDouble, b: ComplexDouble) -> ComplexDouble {
    return (a - b.0, -b.1)
}

/// Subtraction.
/// - Parameters:
///   - a: Complex array.
///   - b: Complex array.
/// - Returns: The result of the subtraction.
public func - (a: ComplexDoubleArray, b: ComplexDoubleArray) -> ComplexDoubleArray {
    assertSameSize(a, b)
    return vectorSubtractComplexArray(a, b)
}

/// Subtraction.
/// - Parameters:
///   - a: Complex array.
///   - b: Complex number.
/// - Returns: The result of the subtraction.
public func - (a: ComplexDoubleArray, b: ComplexDouble) -> ComplexDoubleArray {
    return (a.0 - b.0, a.1 - b.1)
}

/// Subtraction.
/// - Parameters:
///   - a: Complex number.
///   - b: Complex array.
/// - Returns: The result of the subtraction.
public func - (a: ComplexDouble, b: ComplexDoubleArray) -> ComplexDoubleArray {
    return b - a
}

/// Subtraction.
/// - Parameters:
///   - a: Complex array.
///   - b: Real array.
/// - Returns: The result of the subtraction.
public func - (a: ComplexDoubleArray, b: RealDoubleArray) -> ComplexDoubleArray {
    assertSameSize(a, b)
    return (a.0 - b, a.1)
}

/// Subtraction.
/// - Parameters:
///   - a: Real array.
///   - b: Complex array.
/// - Returns: The result of the subtraction.
public func - (a: RealDoubleArray, b: ComplexDoubleArray) -> ComplexDoubleArray {
    assertSameSize(a, b)
    return b - a
}

/// Subtraction.
/// - Parameters:
///   - a: Complex array.
///   - b: Real number.
/// - Returns: The result of the subtraction.
public func - (a: ComplexDoubleArray, b: RealDouble) -> ComplexDoubleArray {
    return (a.0 - b, a.1)
}

/// Subtraction.
/// - Parameters:
///   - a: Real number.
///   - b: Complex array.
/// - Returns: The result of the subtraction
public func - (a: RealDouble, b: ComplexDoubleArray) -> ComplexDoubleArray {
    return (a - b.0, b.1)
}

/// Subtraction.
/// - Parameters:
///   - a: Complex number.
///   - b: Real array.
/// - Returns: The result of the subtraction
public func - (a: ComplexDouble, b: RealDoubleArray) -> ComplexDoubleArray {
    let r = a.0 - b
    let i = RealDoubleArray(repeating: RealDouble(a.1), count: b.count)
    return (r, i)
}

/// Subtraction.
/// - Parameters:
///   - a: Real array.
///   - b: Complex number.
/// - Returns: The result of the subtraction
public func - (a: RealDoubleArray, b: ComplexDouble) -> ComplexDoubleArray {
    let r = a - b.0
    let i = RealDoubleArray(repeating: -RealDouble(b.1), count: a.count)
    return (r, i)
}
