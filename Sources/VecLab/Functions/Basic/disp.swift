//
//  disp.swift
//
//
//  Created by Marcus Painter on 15/09/2023.
//

import Foundation

/// Prints any object
/// - Parameter x: Any
public func disp(_ x: Any) {
    print(x)
}

/// Prints a real array.
/// - Parameter x: Real array.
public func disp(_ x: ArraySlice<RealDouble>) {
    let xx = Array(x)
    disp(xx)
}

/// Prints a real array.
/// - Parameter x: Real array.
public func disp(_ x: RealDoubleArray) {
    x.forEach { print(String(format: "% 19.15f", $0)) }
}

/// Prints a complex array formatted in rows.
/// - Parameter x: Comlplex array.
public func disp(_ x: ComplexDoubleArray) {
    zip(x.0, x.1).forEach { print(String(format: "% 19.15f %+19.15fi", $0, $1)) }
}


/// Prints a real array.
/// - Parameter x: Real array.
public func disp(_ x: ArraySlice<RealFloat>) {
    let xx = Array(x)
    disp(xx)
}

/// Prints a real array.
/// - Parameter x: Real array.
public func disp(_ x: RealFloatArray) {
    x.forEach { print(String(format: "% 19.15f", $0)) }
}

/// Prints a complex array formatted in rows.
/// - Parameter x: Comlplex array.
public func disp(_ x: ComplexFloatArray) {
    zip(x.0, x.1).forEach { print(String(format: "% 19.15f %+19.15fi", $0, $1)) }
}
