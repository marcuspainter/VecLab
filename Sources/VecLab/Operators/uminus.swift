//
//  uminus.swift
//
//
//  Created by Marcus Painter on 09/09/2023.
//

import Accelerate
import Foundation

// VECTORIZED

/// Unary minus.
/// - Parameter a: Real array.
/// - Returns: The result of -a
public prefix func - (a: RealArray) -> RealArray {
    return vDSP.negative(a)
}

/// Unary minus.
/// - Parameter a: Complex number.
/// - Returns: The result of -a.
public prefix func - (a: Complex) -> Complex {
    return Complex(-a.real, -a.imag)
}

/// Unary minus.
/// - Parameter a: Complex array.
/// - Returns: The result of -a.
public prefix func - (a: ComplexArray) -> ComplexArray {
    let real = vDSP.negative(a.real)
    let imag = vDSP.negative(a.imag)
    return ComplexArray(real, imag)
}
