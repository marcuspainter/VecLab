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
public func iterate(_ x: RealDoubleArray, _ body: (RealDouble) -> RealDouble) -> RealDoubleArray {
    var y = x
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
public func iterate(_ x: RealDoubleArray, _ body: (RealDouble, Int) -> RealDouble) -> RealDoubleArray {
    var y = x
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
public func iterate(_ x: ComplexDoubleArray, _ body: (ComplexDouble) -> ComplexDouble) -> ComplexDoubleArray {
    var y = x
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
public func iterate(_ x: ComplexDoubleArray, _ body: (ComplexDouble, Int) -> ComplexDouble) -> ComplexDoubleArray {
    var y = x
    for k in 0 ..< x.0.count {
        (y.0[k], y.1[k]) = body((x.0[k], x.1[k]), k)
    }
    return y
}

// MARK: Float

/// Real array iterator.
/// - Parameters:
///   - x: Real array.
///   - body: Closure to execute.
/// - Returns: Output array.
public func iterate(_ x: RealFloatArray, _ body: (RealFloat) -> RealFloat) -> RealFloatArray {
    var y = x
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
public func iterate(_ x: RealFloatArray, _ body: (RealFloat, Int) -> RealFloat) -> RealFloatArray {
    var y = x
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
public func iterate(_ x: ComplexFloatArray, _ body: (ComplexFloat) -> ComplexFloat) -> ComplexFloatArray {
    var y = x
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
public func iterate(_ x: ComplexFloatArray, _ body: (ComplexFloat, Int) -> ComplexFloat) -> ComplexFloatArray {
    var y = x
    for k in 0 ..< x.0.count {
        (y.0[k], y.1[k]) = body((x.0[k], x.1[k]), k)
    }
    return y
}

