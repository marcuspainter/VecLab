//
//  erf.swift
//  VecLab
//
//  Created by Marcus Painter on 11/03/2025.
//

import Foundation

// http://ab-initio.mit.edu/faddeeva/#Algorithms

/* Use _math.erf() */

public func erf2(_ x: Double) -> Double {
    // Constants for approximation
    let a1 =  0.254829592
    let a2 = -0.284496736
    let a3 =  1.421413741
    let a4 = -1.453152027
    let a5 =  1.061405429
    let p  =  0.3275911

    // Save the sign of x
    let sign = x < 0 ? -1.0 : 1.0
    let absX = abs(x)

    // Approximation
    let t = 1.0 / (1.0 + p * absX)
    let y = 1.0 - (((((a5 * t + a4) * t) + a3) * t + a2) * t + a1) * t * exp(-absX * absX)

    return sign * y
}

public func erf(_ x: Double) -> Double {
    // Handle special cases
    if x == 0.0 {
        return 0.0
    }

    let isNegative = x < 0.0
    let t = 1.0 / (1.0 + 0.3275911 * abs(x))

    // Coefficients from Abramowitz and Stegun approximation
    let a1 = 0.254829592
    let a2 = -0.284496736
    let a3 = 1.421413741
    let a4 = -1.453152027
    let a5 = 1.061405429

    // Polynomial calculation
    let polynomial = ((((a5 * t + a4) * t) + a3) * t + a2) * t + a1

    // Calculate the result using the approximation formula
    let result = 1.0 - polynomial * t * exp(-x * x)

    // Apply sign based on input
    return isNegative ? -result : result
}
