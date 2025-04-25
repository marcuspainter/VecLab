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
//@available(*, deprecated, message: "Use map() instead.")
public func iterate(_ x: RealArray, _ body: (Real) -> Real) -> RealArray {
    return x.map(body)
}

/// Real array iterator with index.
/// - Parameters:
///   - x: Real array.
///   - body: Closure to execute.
/// - Returns: Output array.
//@available(*, deprecated, message: "Use enumerated().map() instead.")
public func iterate(_ x: RealArray, _ body: (Real, Int) -> Real) -> RealArray {
    return x.enumerated().map { index, element in
        return body(element, index)
    }
}

/// Complex array iterator.
/// - Parameters:
///   - x: Real array.
///   - body: Closure to execute.
/// - Returns: Output array.
//@available(*, deprecated, message: "Use map() instead.")
public func iterate(_ x: ComplexArray, _ body: (Complex) -> Complex) -> ComplexArray {
    assertSameSize(x)
    return x.map(body)
}

/// Complex array iterator with index.
/// - Parameters:
///   - x: Complex array.
///   - body: Closure to execute.
/// - Returns: Output array.
//@available(*, deprecated, message: "Use enumerated().map() instead.")
public func iterate(_ x: ComplexArray, _ body: (Int, Complex) -> Complex) -> ComplexArray {
    assertSameSize(x)
    //return x.enumerated().map { index, element in
    //    return body(index, element)
    //}
    return ComplexArray()
}
