//
//  flip.swift
//
//
//  Created by Marcus Painter on 11/09/2023.
//

import Accelerate
import Foundation

// VECTORIZED

/// Flip order of array.
/// - Parameter x: Real array.
/// - Returns: Flipped array with elements reversed.
public func flip(_ x: RealArray) -> RealArray {
    // Copy
    var y = x
    // Inplace reverse
    vDSP.reverse(&y)
    return y
}

/// Flip order of complex array.
/// - Parameter x: Complex array.
/// - Returns: Flipped array with elements reversed.
public func flip(_ x: ComplexArray) -> ComplexArray {
    validateSize(x)
    // Copy
    var c = x
    // Inplace reverse
    vDSP.reverse(&c.real)
    vDSP.reverse(&c.imag)
    return c
}
