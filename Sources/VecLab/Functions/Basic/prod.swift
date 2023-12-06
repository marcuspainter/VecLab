//
//  prod.swift
//
//
//  Created by Marcus Painter on 12/09/2023.
//

import Foundation

/// Product of an array.
/// - Parameter x: Input array.
/// - Returns: The product of the array.
public func prod(_ x: RealArray) -> Real {
    var product = Real(x[0])
    for k in 1 ..< x.count {
        product *= x[k]
    }
    return product
}

/// Product of a complex array.
/// - Parameter x: Complex array.
/// - Returns: The product of the array.
public func prod(_ x: ComplexArray) -> Complex {
    var product = Complex(x.0[0], x.1[0])
    for k in 1 ..< x.0.count {
        product = complexMultiply((product.0, product.1), (x.0[k], x.1[k]))
    }
    return product
}
