//
//  sum.swift
//
//
//  Created by Marcus Painter on 09/09/2023.
//

import Accelerate
import Foundation

// VECTORIZED

/// Sum of array.
/// - Parameter x: Input array.
/// - Returns: The sum of the array.
public func sum(_ x: RealArray) -> Real {
    return vDSP.sum(x)
}

/// Sum of a complex array.
/// - Parameter x: Complex array.
/// - Returns: The sum of the array.
public func sum(_ x: ComplexArray) -> Complex {
    assertSameSize(x)
    return Complex(vDSP.sum(x.real), vDSP.sum(x.imag))
}
