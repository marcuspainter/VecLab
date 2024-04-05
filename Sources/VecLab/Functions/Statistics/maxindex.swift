//
//  File.swift
//  
//
//  Created by Marcus Painter on 05/04/2024.
//

import Foundation
import Accelerate

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
public func maxindex(_ x: RealArray) -> (value: Real, index: Int) {
    // Note order: Returns (UInt, Real)
    let (index, value) = vDSP.indexOfMaximum(x)
    // Swap order for Matlab
    return (Real(value), Int(index))
}
