//
//  log.swift
//  
//
//  Created by Marcus Painter on 09/09/2023.
//

import Foundation
import Accelerate

// VECTORIZED

/// Natural logarithm of a real array.
/// - Parameter x: Real number.
/// - Returns: The natural logarithm of `x`.
public func log(_ x: RealArray) -> RealArray {
    return vForce.log(x)
}

/// Natural logarithm of a complex number.
/// - Parameter x: Complex number.
/// - Returns: The natural logarithm of `x`.
public func log(_ x: Complex) -> Complex {
    return complexLog(x)
}

/// Natural logarithm of a complex array.
/// - Parameter x: Complex array.
/// - Returns: The natural logarithm of `x`.
public func log(_ x: ComplexArray) -> ComplexArray {
    validateSize(x)
    return vectorLogComplexArray(x)
}
