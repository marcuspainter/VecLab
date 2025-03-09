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
    for k in 0 ..< x.count {
        y[k] = body(x[k])
    }
    return y
}

/// Real array iterator with index.
/// - Parameters:
///   - x: Real array.
///   - body: Closure to execute.
/// - Returns: Output array.
public func iterate(_ x: RealArray, _ body: (Real, Int) -> Real) -> RealArray {
    var y = RealArray(repeating: 0, count: x.count)
    for k in 0 ..< x.count {
        y[k] = body(x[k], k)
    }
    return y
}

/// Complex array iterator.
/// - Parameters:
///   - x: Real array.
///   - body: Closure to execute.
/// - Returns: Output array.
public func iterate(_ x: ComplexArray, _ body: (Complex) -> Complex) -> ComplexArray {
    assertSameSize(x)
    var y = complex(sized: x)
    for k in 0 ..< x.0.count {
        (y.0[k], y.1[k]) = body((x.0[k], x.1[k]))
    }
    return y
}

/// Complex array iterator with index.
/// - Parameters:
///   - x: Complex array.
///   - body: Closure to execute.
/// - Returns: Output array.
public func iterate(_ x: ComplexArray, _ body: (Complex, Int) -> Complex) -> ComplexArray {
    assertSameSize(x)
    var y = complex(sized: x)
    for k in 0 ..< x.0.count {
        (y.0[k], y.1[k]) = body((x.0[k], x.1[k]), k)
    }
    return y
}
