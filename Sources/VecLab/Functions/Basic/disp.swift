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
public func disp(_ x: ArraySlice<Real>) {
    let xx = Array(x)
    disp(xx)
}

/// Prints a real array.
/// - Parameter x: Real array.
public func disp(_ x: RealArray) {
    x.forEach { print(String(format: "% 19.15f", $0)) }
}

/// Prints a complex array formatted in rows.
/// - Parameter x: Complex array.
public func disp(_ x: ComplexArray) {
    validateSize(x)
    x.forEach { print(String(format: "% 19.15f %+19.15fi", $0.real, $0.imag)) }
}
