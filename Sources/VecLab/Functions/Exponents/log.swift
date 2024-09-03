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
/// - Parameter a: Real number.
/// - Returns: The natural logarithm of `x`.
public func log(_ x: RealArray) -> RealArray {
    // return x.map { log($0) }
    return vForce.log(x)
}

/// Natural logarithm of a complex number.
/// - Parameter a: Complex number.
/// - Returns: The natural logarithm of `x`.
public func log(_ x: Complex) -> Complex {
    return complexLog(x)
}

/// Natural logarithm of a complex array.
/// - Parameter a: Complex array.
/// - Returns: The natural logarithm of `x`.
public func log(_ x: ComplexArray) -> ComplexArray {
    return vectorLogComplexArray(x)
}
