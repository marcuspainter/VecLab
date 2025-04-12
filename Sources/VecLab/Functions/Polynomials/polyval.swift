//
//  polyval.swift
//
//
//  Created by Marcus Painter on 27/08/2024.
//

import Accelerate
import Foundation

/// Polynomial evaluation.
/// - Parameters:
///   - p: Polynomial coefficients.
///   - x: Query point.
/// - Returns: The value of the polynomial p at each point in x.
public func polyval(_ p: RealArray, _ x: Real) -> Real {
    let y = vDSP.evaluatePolynomial(usingCoefficients: p,
                                    withVariables: [x])
    if y.count != 1 {
        return Real.nan
    }
    return y[0]
}

/// Polynomial evaluation.
/// - Parameters:
///   - p: Polynomial coefficients.
///   - x: Query point.
/// - Returns: The value of the polynomial p at each point in x.
public func polyval(_ p: RealArray, _ x: RealArray) -> RealArray {
    return vDSP.evaluatePolynomial(usingCoefficients: p,
                                   withVariables: x)
}

/// Polynomial evaluation.
/// - Parameters:
///   - p:  Polynomial coefficients.
///   - x: Query point.
/// - Returns: The value of the polynomial p at each point in x.
public func polyval(_ p: RealArray, _ x: Complex) -> Complex {
    let n = length(p) // Get the number of coefficients
    var y = Complex(p[0], Real(0)) // Initialize the result with the first coefficient

    // Horner's method: Iterate over the coefficients
    for i in 1 ..< n {
        y = y * x + p[i]
    }
    return y
}

/// Polynomial evaluation.
/// - Parameters:
///   - p:  Polynomial coefficients.
///   - x: Query point.
/// - Returns: The value of the polynomial p at each point in x.
public func polyval(_ p: RealArray, _ x: ComplexArray) -> ComplexArray {
    assertSameSize(x)
    return iterate(x) { polyval(p, $0) }
}

/// Polynomial evaluation.
/// - Parameters:
///   - p:  Polynomial coefficients.
///   - x: Query point.
/// - Returns: The value of the polynomial p at each point in x.
public func polyval(_ p: ComplexArray, _ x: Complex) -> Complex {
    assertSameSize(p)
    let n = length(p) // Get the number of coefficients
    var y = Complex(p.real[0], p.imag[0]) // Initialize the result with the first coefficient

    // Horner's method: Iterate over the coefficients
    for i in 1 ..< n {
        y = y * x + Complex(p.real[i], p.imag[i])
    }
    return y
}

/// Polynomial evaluation.
/// - Parameters:
///   - p:  Polynomial coefficients.
///   - x: Query point.
/// - Returns: The value of the polynomial p at each point in x.
public func polyval(_ p: ComplexArray, _ x: ComplexArray) -> ComplexArray {
    assertSameSize(p)
    assertSameSize(x)
    return iterate(x) { polyval(p, $0) }
}
