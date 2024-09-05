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
public func polyval(_ p: RealDoubleArray, _ x: RealDouble) -> RealDouble {
    let y = vDSP.evaluatePolynomial(usingCoefficients: p,
                                    withVariables: [x])
    if y.count != 1 {
        return Double.nan
    }
    return y[0]
}

/// Polynomial evaluation.
/// - Parameters:
///   - p: Polynomial coefficients.
///   - x: Query point.
/// - Returns: The value of the polynomial p at each point in x.
public func polyval(_ p: RealDoubleArray, _ x: RealDoubleArray) -> RealDoubleArray {
    return vDSP.evaluatePolynomial(usingCoefficients: p,
                                   withVariables: x)
}

/// Polynomial evaluation.
/// - Parameters:
///   - p:  Polynomial coefficients.
///   - x: Query point.
/// - Returns: The value of the polynomial p at each point in x.
public func polyval(_ p: RealDoubleArray, _ x: ComplexDouble) -> ComplexDouble {
    let n = length(p) // Get the number of coefficients
    var y = (p[0], Double(0)) // Initialize the result with the first coefficient

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
public func polyval(_ p: RealDoubleArray, _ x: ComplexDoubleArray) -> ComplexDoubleArray {
    return iterate(x) { polyval(p, $0) }
}

/// Polynomial evaluation.
/// - Parameters:
///   - p:  Polynomial coefficients.
///   - x: Query point.
/// - Returns: The value of the polynomial p at each point in x.
public func polyval(_ p: ComplexDoubleArray, _ x: ComplexDouble) -> ComplexDouble {
    let n = length(p) // Get the number of coefficients
    var y = (p.0[0], p.1[0]) // Initialize the result with the first coefficient

    // Horner's method: Iterate over the coefficients
    for i in 1 ..< n {
        y = y * x + (p.0[i], p.1[i])
    }
    return y
}

/// Polynomial evaluation.
/// - Parameters:
///   - p:  Polynomial coefficients.
///   - x: Query point.
/// - Returns: The value of the polynomial p at each point in x.
public func polyval(_ p: ComplexDoubleArray, _ x: ComplexDoubleArray) -> ComplexDoubleArray {
    return iterate(x) { polyval(p, $0) }
}

// MARK: Float

/// Polynomial evaluation.
/// - Parameters:
///   - p: Polynomial coefficients.
///   - x: Query point.
/// - Returns: The value of the polynomial p at each point in x.
public func polyval(_ p: RealFloatArray, _ x: RealFloat) -> RealFloat {
    let y = vDSP.evaluatePolynomial(usingCoefficients: p,
                                    withVariables: [x])
    if y.count != 1 {
        return Float.nan
    }
    return y[0]
}

/// Polynomial evaluation.
/// - Parameters:
///   - p: Polynomial coefficients.
///   - x: Query point.
/// - Returns: The value of the polynomial p at each point in x.
public func polyval(_ p: RealFloatArray, _ x: RealFloatArray) -> RealFloatArray {
    return vDSP.evaluatePolynomial(usingCoefficients: p,
                                   withVariables: x)
}

/// Polynomial evaluation.
/// - Parameters:
///   - p:  Polynomial coefficients.
///   - x: Query point.
/// - Returns: The value of the polynomial p at each point in x.
public func polyval(_ p: RealFloatArray, _ x: ComplexFloat) -> ComplexFloat {
    let n = length(p) // Get the number of coefficients
    var y = (p[0], Float(0)) // Initialize the result with the first coefficient

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
public func polyval(_ p: RealFloatArray, _ x: ComplexFloatArray) -> ComplexFloatArray {
    return iterate(x) { polyval(p, $0) }
}

/// Polynomial evaluation.
/// - Parameters:
///   - p:  Polynomial coefficients.
///   - x: Query point.
/// - Returns: The value of the polynomial p at each point in x.
public func polyval(_ p: ComplexFloatArray, _ x: ComplexFloat) -> ComplexFloat {
    let n = length(p) // Get the number of coefficients
    var y = (p.0[0], p.1[0]) // Initialize the result with the first coefficient

    // Horner's method: Iterate over the coefficients
    for i in 1 ..< n {
        y = y * x + (p.0[i], p.1[i])
    }
    return y
}

/// Polynomial evaluation.
/// - Parameters:
///   - p:  Polynomial coefficients.
///   - x: Query point.
/// - Returns: The value of the polynomial p at each point in x.
public func polyval(_ p: ComplexFloatArray, _ x: ComplexFloatArray) -> ComplexFloatArray {
    return iterate(x) { polyval(p, $0) }
}

