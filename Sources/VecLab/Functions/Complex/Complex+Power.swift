//
//  Complex+Power.swift
//  VecLab
//
//  Created by Marcus Painter on 22/09/2025.
//

import Foundation

/// Power.
/// - Parameters:
///   - a: Complex number.
///   - b: Integer.
/// - Returns: Raises `a` to the power of `b`.
public func pow(_ a: Complex, _ b: Int) -> Complex {
    return pow(a, Real(b))
}

// MARK: Complex

/// Power.
/// - Parameters:
///   - a: Complex number.
///   - b: Real number.
/// - Returns: Raises `a` to the power of `b`.
public func pow(_ a: Complex, _ b: Real) -> Complex {
    return CoreComplex.pow(a, b)
}

/// Power.
/// - Parameters:
///   - a: Real number.
///   - b: Complex number.
/// - Returns: Raises `a` to the power of `b`
public func pow(_ a: Real, _ b: Complex) -> Complex {
    return CoreComplex.pow(a, b)
}

// Power.
/// - Parameters:
///   - a: Complex number.
///   - b: Complex number.
/// - Returns: Raises `a` to the power of `b
public func pow(_ a: Complex, _ b: Complex) -> Complex {
    return CoreComplex.pow(a, b)
}
