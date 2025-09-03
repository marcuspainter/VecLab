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
public func polyval(coefficients p: RealArray, point x: Real) -> Real {
    let y = vDSP.evaluatePolynomial(
        usingCoefficients: p,
        withVariables: [x]
    )
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
public func polyval(coefficients p: RealArray, points x: RealArray) -> RealArray {
    return vDSP.evaluatePolynomial(
        usingCoefficients: p,
        withVariables: x
    )
}

/// Polynomial evaluation.
/// - Parameters:
///   - p: Polynomial coefficients.
///   - x: Query point.
/// - Returns: The value of the polynomial p at each point in x.
public func polyval(coefficients p: RealArray, point x: Complex) -> Complex {
    let n = length(p)  // Get the number of coefficients
    var y = Complex(p[0], Real(0))  // Initialize the result with the first coefficient

    // Horner's method: Iterate over the coefficients
    for i in 1..<n {
        y = y * x + p[i]
    }
    return y
}

/// Polynomial evaluation.
/// - Parameters:
///   - p: Polynomial coefficients.
///   - x: Query point.
/// - Returns: The value of the polynomial p at each point in x.
public func polyval(coefficients p: RealArray, points x: ComplexArray) -> ComplexArray {
    validateSize(x)
    return x.map { polyval(coefficients: p, point: $0) }
}

/// Polynomial evaluation.
/// - Parameters:
///   - p: Polynomial coefficients.
///   - x: Query point.
/// - Returns: The value of the polynomial p at each point in x.
public func polyval(coefficients p: ComplexArray, point x: Complex) -> Complex {
    validateSize(p)
    let n = length(p)  // Get the number of coefficients
    var y = p[0]  // Initialize the result with the first coefficient

    // Horner's method: Iterate over the coefficients
    for i in 1..<n {
        y = y * x + p[i]
    }
    return y
}

/// Polynomial evaluation.
/// - Parameters:
///   - p:  Polynomial coefficients.
///   - x: Query point.
/// - Returns: The value of the polynomial p at each point in x.
public func polyval(_coefficients p: ComplexArray, points x: ComplexArray) -> ComplexArray {
    validateSize(p)
    validateSize(x)
    return x.map { polyval(coefficients: p, point: $0) }
}
