//
//  ComplexArray+Basic.swift
//  VecLab
//
//  Created by Marcus Painter on 21/09/2025.
//

/// Cumulative product.
/// - Parameter x: Complex array.
/// - Returns: Complex array.
public func cumprod(_ x: ComplexArray) -> ComplexArray {
    guard !x.isEmpty else { return [] }
    var result = ComplexArray(repeating: Complex(1, 0), count: x.count)
    result[0] = x[0]
    for i in 1..<x.count {
        result[i] = result[i - 1] * x[i]
    }
    return result
}

/// Cumulative sum of complex array.
/// - Parameter x: Complex array.
/// - Returns: The cumulative sum of the array.
public func cumsum(_ x: ComplexArray) -> ComplexArray {
    var c = x
    var sum = Complex()
    for k in 0..<x.count {
        sum = sum + x[k]
        c[k] = sum
    }
    return c
}

/// Product of a complex array.
/// - Parameter x: Complex array.
/// - Returns: The product of the array.
public func prod(_ x: ComplexArray) -> Complex {
    var product = x[0]
    for k in 1..<x.count {
        product = product * x[k]
    }
    return product
}

/// Sign function (signum function) of a complex array.
///
/// `sign(x)` returns a value of: x./abs(x) if x is complex.
/// - Parameter x: Complex array.
/// - Returns: Sign of number.
public func sign(_ x: ComplexArray) -> ComplexArray {
    return x / abs(x)  // Overloaded
}
