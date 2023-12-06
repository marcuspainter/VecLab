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
public func disp(_ x: RealArray) {
    x.forEach { print($0) }
}

/// Prints a complex array formatted in rows.
/// - Parameter x: Comlplex array.
public func disp(_ x: ComplexArray) {
    zip(x.0, x.1).forEach { print(String(format: "% 19.16f %+19.16fi", $0, $1)) }
}
