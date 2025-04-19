//
//  conj.swift
//
//
//  Created by Marcus Painter on 09/09/2023.
//

import Accelerate
import Foundation

// VECTORIZED

/// Complex conjugate of a complex number.
/// - Parameter x: Complex number.
/// - Returns: The complex conjugate of `x`.
@inlinable
public func conj(_ x: Complex) -> Complex {
    return Complex(x.real, -x.imag)
}

/// Complex conjugates of a complex array.
/// - Parameter x: Complex array.
/// - Returns: The complex conjugate of `x`.
public func conj(_ x: ComplexArray) -> ComplexArray {
    assertSameSize(x)
    let imag = vDSP.negative(x.imag)
    return ComplexArray(x.real, imag)
}

// Not implemented for reals
