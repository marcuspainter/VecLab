//
//  polyval.swift
//
//
//  Created by Marcus Painter on 27/08/2024.
//

import Accelerate
import Foundation

/// Polynomial evaluation.
///
/// MATLAB's convention where coefficients are ordered from highest degree to lowest degree.
/// - Parameters:
///   - p: Polynomial coefficients.
///   - x: Query point.
/// - Returns: The value of the polynomial p at each point in x.
public func polyval(coefficients p: RealArray, point x: Real) -> Real {
    guard !p.isEmpty else {
        return Real.nan
    }
    let n = length(p)
    // Horner's method: Iterate over the coefficients
    var y = p[0]
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
    let n = length(p)   // Get the number of coefficients
    var y = p[0]        // Initialize the result with the first coefficient

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
public func polyval(coefficients p: ComplexArray, points x: ComplexArray) -> ComplexArray {
    validateSize(p)
    validateSize(x)
    return x.map { polyval(coefficients: p, point: $0) }
}

/// Polynomial evaluation.
/// - Parameters:
///   - p: Polynomial coefficients.
///   - x: Query point.
/// - Returns: The value of the polynomial p at each point in x.
public func polyval(coefficients p: ComplexArray, point x: Real) -> Complex {
    return polyval(coefficients: p, point: Complex(x, 0))
}

/// Polynomial evaluation.
/// - Parameters:
///   - p: Polynomial coefficients.
///   - x: Query point.
/// - Returns: The value of the polynomial p at each point in x.
public func polyval(coefficients p: ComplexArray, points x: RealArray) -> ComplexArray {
    return polyval(coefficients: p, points: ComplexArray(realOnly: x))
}
