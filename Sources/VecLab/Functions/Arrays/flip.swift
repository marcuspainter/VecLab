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
/// - Parameter x: Input array.
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
    // Copy
    var y = x
    // Inplace reverse
    vDSP.reverse(&y.0)
    vDSP.reverse(&y.1)
    return y
}
