//
//  exp.swift
//  
//
//  Created by Marcus Painter on 09/09/2023.
//

import Foundation
import Accelerate

// VECTORIZED

/// Exponential of a real array.
/// - Parameter x: Real array.
/// - Returns: The exponential of `x`.
public func exp(_ x: RealArray) -> RealArray {
    // return x.map { log($0) }
    return vForce.exp(x)
}

/// Exponential of a complex number.
/// - Parameter x: Complex number.
/// - Returns: The exponential of `x`.
public func exp(_ x: Complex) -> Complex {
    return complexExp(x)
}

/// Exponential of a complex array.
/// - Parameter x: Complex array.
/// - Returns: The exponential of `x`.
public func exp(_ x: ComplexArray) -> ComplexArray {
    return vectorExpComplexArray(x)
}
