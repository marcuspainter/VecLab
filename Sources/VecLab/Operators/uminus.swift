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
    return (-a.0, -a.1)
}

/// Unary minus.
/// - Parameter a: Complex array.
/// - Returns: The result of -a.
public prefix func - (a: ComplexArray) -> ComplexArray {
    let r = vDSP.negative(a.0)
    let i = vDSP.negative(a.1)
    return (r, i)
}
