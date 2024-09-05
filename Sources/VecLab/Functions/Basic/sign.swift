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
public func sign(_ x: RealDouble) -> RealDouble {
    if x > 0 {
        return Double(1.0)
    }
    if x < 0 {
        return Double(-1.0)
    }
    // x == 0
    return Double(0.0)
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
public func sign(_ x: RealDoubleArray) -> RealDoubleArray {
    return x.map { sign($0) }
}

/// Sign function (signum function) of a complex number.
///
/// `sign(x)` returns a value of: x./abs(x) if x is complex.
/// - Parameter x: Complex number.
/// - Returns: Sign of number.
public func sign(_ x: ComplexDouble) -> ComplexDouble {
    return x / abs(x) // Overloaded
}

/// Sign function (signum function) of a complex array.
///
/// `sign(x)` returns a value of: x./abs(x) if x is complex.
/// - Parameter x: Complex array..
/// - Returns: Sign of number.
public func sign(_ x: ComplexDoubleArray) -> ComplexDoubleArray {
    return x / abs(x) // Overloaded
}

// MARK: Float


/// Sign function (signum function) of a real number.
///
/// `sign(x)` returns a value of:
/// 1 if the corresponding element of x is greater than 0.
/// 0 if the corresponding element of x equals 0.
/// -1 if the corresponding element of x is less than 0.
/// x./abs(x) if x is complex.
/// - Parameter x: Real number.
/// - Returns: Sign of number.
public func sign(_ x: RealFloat) -> RealFloat {
    if x > 0 {
        return RealFloat(1.0)
    }
    if x < 0 {
        return RealFloat(-1.0)
    }
    // x == 0
    return RealFloat(0.0)
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
public func sign(_ x: RealFloatArray) -> RealFloatArray {
    return x.map { sign($0) }
}

/// Sign function (signum function) of a complex number.
///
/// `sign(x)` returns a value of: x./abs(x) if x is complex.
/// - Parameter x: Complex number.
/// - Returns: Sign of number.
public func sign(_ x: ComplexFloat) -> ComplexFloat {
    return x / abs(x) // Overloaded
}

/// Sign function (signum function) of a complex array.
///
/// `sign(x)` returns a value of: x./abs(x) if x is complex.
/// - Parameter x: Complex array..
/// - Returns: Sign of number.
public func sign(_ x: ComplexFloatArray) -> ComplexFloatArray {
    return x / abs(x) // Overloaded
}

