//
//  min.swift
//  
//
//  Created by Marcus Painter on 09/09/2023.
//

import Foundation
import Accelerate

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

/// Minimum value and index in an array.
///
/// - Parameter x: Input array of real numbers.
/// - Returns: A tuple  `(value:index:)`where the first component represents the minimum value and the second component indicates its position in the array.
///
/// # Example:
/// ```
/// let dataPoints: RealArray = [1.2, 3.5, 2.9, 4.1, 3.8]
/// let result = min(dataPoints)
/// print(result.value)  // prints: 1.2
/// print(result.index)  // prints: 0
/// ```
public func min(_ x: RealArray) -> (value: Real, index: Int) {
    // Note order: Returns (UInt, Real)
    let (index, value) = vDSP.indexOfMinimum(x)
    // Swap order for Matlab
    return (Real(value), Int(index))
}
