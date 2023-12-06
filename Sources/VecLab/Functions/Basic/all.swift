//
//  all.swift
//
//
//  Created by Marcus Painter on 13/09/2023.
//

import Accelerate
import Foundation

/// Determines if all elements of an array are non-zero.
///
/// This function returns `true` only if every element in the provided array is non-zero. It's a vectorized equivalent to MATLAB's `all()` function.
///
/// - Parameter x: Input array.
/// - Returns: `true` if all elements are non-zero, otherwise `false`.
///
/// # Example:
/// ```
/// let dataSet: RealArray = [1.2, 2.5, 3.4, 4.1]
/// let result = all(dataSet)
/// print(result)  // prints: true
/// ```
public func all(_ x: RealArray) -> Bool {
    let absx = vDSP.absolute(x)
    let sumabsx = vDSP.sum(absx)
    let thresholded = vDSP.threshold(absx, to: 0, with: .zeroFill)
    return vDSP.sum(thresholded) == sumabsx && sumabsx != 0.0
}

/// Determines if all elements of a complex array are non-zero.
///
/// This function returns `true` only if every element in the provided array is non-zero.
///
/// - Parameter x: Complex array
/// - Returns: `true` if all elements are non-zero, otherwise `false`.
///
/// # Example:
/// ```
/// let dataSet: ComplexArray = ([0.0, 2.5, 3.4, 4.1], [1.2, 2.5, 3.5, 4.1])
/// let result = all(dataSet)
/// print(result)  // prints: false
/// ```
public func all(_ x: ComplexArray) -> Bool {
    return all(x.0) && all(x.1)
}
