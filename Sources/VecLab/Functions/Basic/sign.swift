//
//  sign.swift
//
//
//  Created by Marcus Painter on 18/09/2023.
//

import Foundation

/// Sign function (signum function) of a real number.
///
/// `sign(x)` returns a value of:
/// 1 if the corresponding element of x is greater than 0.
/// 0 if the corresponding element of x equals 0.
/// -1 if the corresponding element of x is less than 0.
/// x./abs(x) if x is complex.
/// - Parameter x: Real number.
/// - Returns: Sign of number.
public func sign(_ x: Real) -> Real {
    if x > 0 {
        return Real(1.0)
    }
    if x < 0 {
        return Real(-1.0)
    }
    // x == 0
    return Real(0.0)
}

/// Sign function (signum function) of a real number.
///
/// `sign(x)` returns a value of:
/// 1 if the corresponding element of x is greater than 0.
/// 0 if the corresponding element of x equals 0.
/// -1 if the corresponding element of x is less than 0.
/// x./abs(x) if x is complex.
/// - Parameter x: Real number.
/// - Returns: Sign of number.
public func sign(_ x: RealArray) -> RealArray {
    return x.map { sign($0) }
}

/// Sign function (signum function) of a complex number.
///
/// `sign(x)` returns a value of: x./abs(x) if x is complex.
/// - Parameter x: Complex number.
/// - Returns: Sign of number.
public func sign(_ x: Complex) -> Complex {
    return x / abs(x)  // Overloaded
}

/// Sign function (signum function) of a complex array.
///
/// `sign(x)` returns a value of: x./abs(x) if x is complex.
/// - Parameter x: Complex array.
/// - Returns: Sign of number.
public func sign(_ x: ComplexArray) -> ComplexArray {
    validateSize(x)
    return x / abs(x)  // Overloaded
}
