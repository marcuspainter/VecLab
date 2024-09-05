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
public func prod(_ x: RealDoubleArray) -> RealDouble {
    var product = RealDouble(x[0])
    for k in 1 ..< x.count {
        product *= x[k]
    }
    return product
}

/// Product of a complex array.
/// - Parameter x: Complex array.
/// - Returns: The product of the array.
public func prod(_ x: ComplexDoubleArray) -> ComplexDouble {
    var product = ComplexDouble(x.0[0], x.1[0])
    for k in 1 ..< x.0.count {
        product = complexMultiply((product.0, product.1), (x.0[k], x.1[k]))
    }
    return product
}

// MARK: Float

/// Product of an array.
/// - Parameter x: Input array.
/// - Returns: The product of the array.
public func prod(_ x: RealFloatArray) -> RealFloat {
    var product = RealFloat(x[0])
    for k in 1 ..< x.count {
        product *= x[k]
    }
    return product
}

/// Product of a complex array.
/// - Parameter x: Complex array.
/// - Returns: The product of the array.
public func prod(_ x: ComplexFloatArray) -> ComplexFloat {
    var product = ComplexFloat(x.0[0], x.1[0])
    for k in 1 ..< x.0.count {
        product = complexMultiply((product.0, product.1), (x.0[k], x.1[k]))
    }
    return product
}
