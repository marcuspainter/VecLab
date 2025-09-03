//
//  prod.swift
//
//
//  Created by Marcus Painter on 12/09/2023.
//

import Foundation

/// Product of an array.
/// - Parameter x: Real array.
/// - Returns: The product of the array.
public func prod(_ x: RealArray) -> Real {
    var product = x[0]
    for k in 1..<x.count {
        product *= x[k]
    }
    return product
}

/// Product of a complex array.
/// - Parameter x: Complex array.
/// - Returns: The product of the array.
public func prod(_ x: ComplexArray) -> Complex {
    validateSize(x)
    var product = x[0]
    for k in 1..<x.count {
        product = product * x[k]
    }
    return product
}
