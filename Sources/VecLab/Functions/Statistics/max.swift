//
//  max.swift
//
//
//  Created by Marcus Painter on 09/09/2023.
//

import Accelerate
import Foundation

// VECTORIZED

/// Maximum value of an array.
///
/// - Parameter x: Input array of real numbers.
/// - Returns: The maximum value present in the array.
///
/// # Example:
/// ```
/// let dataPoints: RealArray = [1.2, 3.5, 2.9, 4.1, 3.8]
/// let maxValue = max(dataPoints)
/// print(maxValue)  // prints: 4.1
/// ```
///

public func max(_ x: RealArray) -> Real {
    return vDSP.maximum(x)
}

/// Maximum value and index in an array.
///
/// - Parameter x: Input array of real numbers.
/// - Returns: A tuple  `(value:,index:)`where the first component represents the maximum value and the second component indicates its position in the array.
///
/// # Example:
/// ```
/// let dataPoints: RealArray = [1.2, 3.5, 2.9, 4.1, 3.8]
/// let result = max(dataPoints)
/// print(result.value)  // prints: 4.1
/// print(result.index)  // prints: 3
/// ```
///
public func max(_ x: RealArray) -> (value: Real, index: Int) {
    // Note order: Returns (UInt, Real)
    let (index, value) = vDSP.indexOfMaximum(x)
    // Swap order for Matlab
    return (Real(value), Int(index))
}
