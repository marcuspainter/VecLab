//
//  uminus+Float.swift
//
//
//  Created by Marcus Painter on 04/09/2024.
//

import Accelerate
import Foundation

// VECTORIZED

/// Unary minus.
/// - Parameter a: Real array.
/// - Returns: The result of -a
public prefix func - (a: RealFloatArray) -> RealFloatArray {
    return vDSP.negative(a)
}

/// Unary minus.
/// - Parameter a: Complex number.
/// - Returns: The result of -a.
public prefix func - (a: ComplexFloat) -> ComplexFloat {
    return (-a.0, -a.1)
}

/// Unary minus.
/// - Parameter a: Complex array.
/// - Returns: The result of -a.
public prefix func - (a: ComplexFloatArray) -> ComplexFloatArray {
    let r = vDSP.negative(a.0)
    let i = vDSP.negative(a.1)
    return (r, i)
}
