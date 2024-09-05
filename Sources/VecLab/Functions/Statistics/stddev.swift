//
//  stddev.swift
//  
//
//  Created by Marcus Painter on 12/09/2023.
//

import Foundation
import Accelerate

// VECTORIZED

/// Standard deviation of an array.
///
/// The standard deviation measures the amount of variation or dispersion in a set of values. A low standard deviation indicates that the values tend to be close to the mean, while a high standard deviation indicates that the values are spread out over a wider range.
///
/// - Parameter A: Input array of real numbers.
/// - Returns: The standard deviation of the values in the array.
public func stddev(_ A: RealDoubleArray) -> RealDouble {
    let varianceValue = variance(A)
    return Darwin.sqrt(varianceValue)
}

public func stddev(_ A: RealFloatArray) -> RealFloat {
    let varianceValue = variance(A)
    return Darwin.sqrt(varianceValue)
}
