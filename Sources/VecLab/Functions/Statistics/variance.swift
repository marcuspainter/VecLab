//
//  variance.swift
//
//
//  Created by Marcus Painter on 12/09/2023.
//

import Accelerate
import Foundation

// VECTORIZED

/// Variance of an array (var).
///
/// Variance measures how far a set of numbers are spread out from their average value.
/// It's calculated as the average of the squared differences from the mean
///
/// - Note:Renamed from `var` to `variance` due to Swift reserved word.
///
/// - Parameter A: Input array of real numbers.
/// - Returns: The variance of the values in the array.
public func variance(_ A: RealArray) -> Real {
    let N = Double(A.count)
    let meanA = vDSP.mean(A)
    let minusMeanA = -meanA
    let differences = vDSP.add(minusMeanA, A)
    let sumOfSquaredDifferences = vDSP.sumOfSquares(differences)
    return sumOfSquaredDifferences / Real(N - 1)
}
