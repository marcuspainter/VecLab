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
public func besseli0(_ x: RealDouble) -> RealDouble {
    let eps: Double = 1e-9 // Precision threshold
    let maxTerms: Int = 50 // Maximum number of terms to prevent infinite loops in case convergence is slow
    var term: Double = 1.0
    var sum: Double = 1.0
    var n: Double = 1.0

    let halfX = x / 2.0

    while abs(term) > eps && Int(n) < maxTerms {
        term *= halfX / n
        sum += term * term // The series expansion involves squaring the terms
        n += 1.0
    }

    return sum
}

/// Modified Bessel function of the first kind of order 0.
/// - Parameter x: Input value.
/// - Returns: The value of I0(x).
public func besseli0(_ x: RealFloat) -> RealFloat {
    let eps: Float = 1e-9 // Precision threshold
    let maxTerms: Int = 50 // Maximum number of terms to prevent infinite loops in case convergence is slow
    var term: Float = 1.0
    var sum: Float = 1.0
    var n: Float = 1.0

    let halfX = x / 2.0

    while abs(term) > eps && Int(n) < maxTerms {
        term *= halfX / n
        sum += term * term // The series expansion involves squaring the terms
        n += 1.0
    }

    return sum
}

