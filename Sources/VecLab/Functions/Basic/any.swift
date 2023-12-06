//
//  any.swift
//
//
//  Created by Marcus Painter on 11/09/2023.
//

import Accelerate
import Foundation

/// Determines if any element of the array is non-zero.
///
/// This function returns `true` if at least one element in the provided array is non-zero. It's a vectorized equivalent to MATLAB's `any()` function.
///
/// - Parameter x: Input array.
/// - Returns: `true` if any element is non-zero, otherwise `false`.
///
/// # Example:
/// ```
/// let dataSet: RealArray = [0.0, 0.0, 1.5, 0.0]
/// let result = any(dataSet)
/// print(result)  // prints: true
/// ```
public func any(_ x: RealArray) -> Bool {
    let absx: RealArray = vDSP.absolute(x)
    return vDSP.sum(absx) > 0
}

/// Determines if any element of a complex array is non-zero.
///
/// This function returns `true` if at least one element in the provided array is non-zero. It's a vectorized equivalent to MATLAB's `any()` function.
///
/// - Parameter x: Comlex array.
/// - Returns: `true` if any element is non-zero, otherwise `false`.
///
/// # Example:
/// ```
/// let dataSet: ComplexArray = ([0.0, 0.0, 0.0, 0.0], [0.0, 0.0, 1.5, 0.0])
/// let result = any(dataSet)
/// print(result)  // prints: true
/// ```
public func any(_ x: ComplexArray) -> Bool {
    return any(x.0) || any(x.0)
}
