//
//  min.swift
//
//
//  Created by Marcus Painter on 09/09/2023.
//

import Accelerate
import Foundation

// VECTORIZED

/// Minimum value of an array.
///
/// - Parameter x: Input array of real numbers.
/// - Returns: The minimum value present in the array.
///
/// # Example:
/// ```
/// let dataPoints: RealArray = [1.2, 3.5, 2.9, 4.1, 3.8]
/// let minValue = min(dataPoints)
/// print(minValue)  // prints: 1.2
/// ```
///
public func min(_ x: RealArray) -> Real {
    return vDSP.minimum(x)
}
