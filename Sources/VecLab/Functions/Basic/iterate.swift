//
//  iterate.swift
//
//
//  Created by Marcus Painter on 09/09/2023.
//

import Foundation

/// Real array iterator.
/// - Parameters:
///   - x: Real array.
///   - body: Closure to execute.
/// - Returns: Output array.
public func iterate(_ x: RealArray, _ body: (Real) -> Real) -> RealArray {
    var y = RealArray(repeating: 0, count: x.count)
    for index in 0 ..< x.count {
        y[index] = body(x[index])
    }
    return y
}

/// Real array iterator with index.
/// - Parameters:
///   - x: Real array.
///   - body: Closure to execute.
/// - Returns: Output array.
public func iterate(_ x: RealArray, _ body: (Int, Real) -> Real) -> RealArray {
    var y = RealArray(repeating: 0, count: x.count)
    for index in 0 ..< x.count {
        y[index] = body(index, x[index])
    }
    return y
}

/// Complex array iterator.
/// - Parameters:
///   - x: Real array.
///   - body: Closure to execute.
/// - Returns: Output array.
public func iterate(_ x: ComplexArray, _ body: (Complex) -> Complex) -> ComplexArray {
    validateSize(x)
    var y = ComplexArray(repeating: 0, count: x.count)
    for index in 0 ..< x.count {
        y[index] = body(x[index])
    }
    return y
}

/// Complex array iterator with index.
/// - Parameters:
///   - x: Complex array.
///   - body: Closure to execute.
/// - Returns: Output array.
public func iterate(_ x: ComplexArray, _ body: (Int, Complex) -> Complex) -> ComplexArray {
    validateSize(x)
    var y = ComplexArray(repeating: 0, count: x.count)
    for index in 0 ..< x.count {
        y[index] = body(index, x[index])
    }
    return y
}
