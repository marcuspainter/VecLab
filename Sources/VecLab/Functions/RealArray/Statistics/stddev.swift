//
//  stddev.swift
//
//
//  Created by Marcus Painter on 12/09/2023.
//

import Accelerate
import Foundation

// VECTORIZED

/// Standard deviation of an array.
///
/// The standard deviation measures the amount of variation or dispersion in a set of values.
/// A low standard deviation indicates that the values tend to be close to the mean, while a high
/// standard deviation indicates that the values are spread out over a wider range.
///
/// - Parameter A: Input array of real numbers.
/// - Returns: The standard deviation of the values in the array.
///
/// # Example:
/// ```
/// let dataPoints: RealArray = [2.0, 4.0, 4.0, 4.0, 5.0, 5.0, 7.0, 9.0]
/// let stddevValue = stddev(dataPoints)
/// print(stddevValue) //  2.138089935299395
/// ```
public func stddev(_ A: RealArray) -> Real {
    let varianceValue = variance(A)
    return Darwin.sqrt(varianceValue)
}
