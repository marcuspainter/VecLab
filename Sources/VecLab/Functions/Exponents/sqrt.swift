//
//  sqrt.swift
//
//
//  Created by Marcus Painter on 09/09/2023.
//

// https://github.com/dankogai/swift-complex/blob/master/Sources/Complex/Complex.swift

import Accelerate
import Foundation

// NOT VECTORIZED

/// Square root of a real array.
/// - Parameter x: Real array.
/// - Returns: The square roots.
public func sqrt(_ x: RealArray) -> RealArray {
    return vForce.sqrt(x)
}

/// Square root of a complex number.
/// - Parameter x: Complex number.
/// - Returns: The complex square root.
public func sqrt(_ x: Complex) -> Complex {
    return complexSqrt(x)
}

/// Square root of a complex array.
/// - Parameter x: Complex array.
/// - Returns: The complex square roots.
public func sqrt(_ x: ComplexArray) -> ComplexArray {
    validateSize(x)
    var c = ComplexArray(count: x.count)
    for k in 0..<x.count {
        c[k] = sqrt(x[k])
    }
    return c
}
