//
//  cumprod.swift
//  VecLab
//
//  Created by Marcus Painter on 11/05/2025.
//

/// Cumulative product.
/// - Parameter x: Real array.
/// - Returns: Real array.
public func cumprod(_ x: RealArray) -> RealArray {
    guard !x.isEmpty else { return [] }
    var result = [Double](repeating: 1.0, count: x.count)
    result[0] = x[0]
    for i in 1..<x.count {
        result[i] = result[i - 1] * x[i]
    }
    return result
}

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
