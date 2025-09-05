//
//  dot.swift
//  VecLab
//
//  Created by Marcus Painter on 23/08/2024.
//

import Accelerate

/// Dot product.
/// - Parameters:
///   - a: Real array.
///   - b: Real array.
/// - Returns: The real dot product of a and b.
public func dot(_ a: RealArray, _ b: RealArray) -> Real {
    validateSize(a, b)
    return vDSP.dot(a, b)
}

/// Dot product.
///
/// The complex dot product is defined as:
///
/// dot(a,b) = sum( a \* conj(b))
///
/// - Parameters:
///   - a: Complex array.
///   - b: Complex array.
/// - Returns: The complex dot product of a and b.
public func dot(_ a: ComplexArray, _ b: ComplexArray) -> Complex {
    validateSize(a, b)
    let c = a *~ b
    let dotSum = sum(c)
    return dotSum
}

/// Dot product.
///
/// The complex dot product is defined as:
///
/// dot(a,b) = sum( a \* conj(b))
///
/// - Parameters:
///   - a: Real array.
///   - b: Complex array.
/// - Returns: The complex dot product of a and b.
public func dot(_ a: RealArray, _ b: ComplexArray) -> Complex {
    validateSize(a, b)
    let c = a * b
    let dotSum = sum(c)
    return dotSum
}

/// Dot product.
///
/// The complex dot product is defined as:
///
/// dot(a,b) = sum( a \* conj(b))
///
/// - Parameters:
///   - a: Complex array.
///   - b: Real array.
/// - Returns: The complex dot product of a and b.
public func dot(_ a: ComplexArray, _ b: RealArray) -> Complex {
    validateSize(a, b)
    let c = a ~* b
    let dotSum = sum(c)
    return dotSum
}
