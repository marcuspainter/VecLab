//
//  besseli0.swift
//
//
//  Created by Marcus Painter on 12/09/2023.
//

import Foundation

/// Modified Bessel function of the first kind of order 0.
/// - Parameter x: Input value.
/// - Returns: The value of I0(x).
public func besseli0(_ x: Real) -> Real {
    let eps: Real = 1e-9  // Precision threshold
    let maxTerms: Int = 50  // Maximum number of terms to prevent infinite loops in case convergence is slow
    var term: Real = 1.0
    var sum: Real = 1.0
    var n: Real = 1.0

    let halfX = x / 2.0

    while abs(term) > eps && Int(n) < maxTerms {
        term *= halfX / n
        sum += term * term  // The series expansion involves squaring the terms
        n += 1.0
    }

    return sum
}
