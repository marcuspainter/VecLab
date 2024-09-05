//
//  conj.swift
//  
//
//  Created by Marcus Painter on 09/09/2023.
//

import Foundation
import Accelerate

// VECTORIZED

/// Complex conjugate of a complex number.
/// - Parameter x: Complex number.
/// - Returns: The complex conjugate of `x`.
public func conj(_ x: ComplexDouble) -> ComplexDouble {
    return (x.0, -x.1)
}

/// Complex conjugate of a complex number.
/// - Parameter x: Complex number.
/// - Returns: The complex conjugate of `x`.
public func conj(_ x: ComplexFloat) -> ComplexFloat {
    return (x.0, -x.1)
}

/// Complex conjugates of a complex array.
/// - Parameter x: Complex array.
/// - Returns: The complex conjugate of `x`.
public func conj(_ x: ComplexDoubleArray) -> ComplexDoubleArray {
    let i = vDSP.negative(x.1)
    return (x.0, i)
 }

/// Complex conjugates of a complex array.
/// - Parameter x: Complex array.
/// - Returns: The complex conjugate of `x`.
public func conj(_ x: ComplexFloatArray) -> ComplexFloatArray {
    let i = vDSP.negative(x.1)
    return (x.0, i)
 }

// Not implemented for reals


