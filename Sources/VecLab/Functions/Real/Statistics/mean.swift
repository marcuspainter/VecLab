//
//  mean.swift
//
//
//  Created by Marcus Painter on 11/09/2023.
//

import Accelerate
import Foundation

// VECTORIZED

/// Average (mean) value of an array.
///
/// - Parameter x: Input array of real numbers.
/// - Returns: The mean value of the array.
///
/// # Example:
/// ```
/// let dataPoints: RealArray = [1.2, 3.5, 2.9, 4.1, 3.8]
/// let averageValue = mean(dataPoints)
/// print(averageValue)  // prints the average value of the data points
/// ```
public func mean(_ x: RealArray) -> Real {
    return vDSP.mean(x)
}
