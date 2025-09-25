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
    let fmt = NumberFormatter()
    fmt.numberStyle = .decimal
    fmt.minimumSignificantDigits = 14 // optional depending on needs
    fmt.maximumSignificantDigits = 14
    
    for item in x {
        let sr = item < 0 ? "-" : " "
        let r = fmt.string(for: abs(item))!
        let text =  "\(sr)\(r)"
        print(text)
    }
}

/// Prints a complex array formatted in rows.
/// - Parameter x: Complex array.
public func disp(_ x: SplitComplexArray) {
    validateSize(x)
    x.forEach { print(Complex($0.real, $0.imag)) }
}

/// Prints a complex array formatted in rows.
/// - Parameter x: Complex array.
public func disp(_ x: ComplexArray) {
    x.forEach { print($0) }
}
