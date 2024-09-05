//
//  linspace.swift
//  VecLab
//
//  Created by Marcus Painter on 07/09/2023.
//

import Foundation

/// Generate linearly spaced vector.
///
/// Point interval, specified as a pair of scalars. `x1` and `x2` define the interval over which `linspace` generates points. 
/// `x2` can be either larger or smaller than `x1`. If `x2` is smaller than `x1`, then the vector contains descending values.
/// ```swift
/// let values = linspace(0, 10, 5)
/// print(values)  // Output: [0.0, 2.5, 5.0, 7.5, 10.0]
/// ```
/// - Parameters:
///   - x1: Start of interval.
///   - x2: End of interval.
///   - n: Number of points.
/// - Returns:Returns an array of `n` evenly spaced points between `x1` and `x2`.
public func linspace(_ x1: RealDouble, _ x2: RealDouble, _ n: Int = 100) -> RealDoubleArray {
    if n <= 1 {
        return [x1]
    }

    let step: Double = (x2 - x1) / Double(n - 1)
    return (0 ..< n).map { x1 + Double($0) * step }
}


/// Generate linearly spaced vector.
///
/// Point interval, specified as a pair of scalars. `x1` and `x2` define the interval over which `linspace` generates points.
/// `x2` can be either larger or smaller than `x1`. If `x2` is smaller than `x1`, then the vector contains descending values.
/// ```swift
/// let values = linspace(0, 10, 5)
/// print(values)  // Output: [0.0, 2.5, 5.0, 7.5, 10.0]
/// ```
/// - Parameters:
///   - x1: Start of interval.
///   - x2: End of interval.
///   - n: Number of points.
/// - Returns:Returns an array of `n` evenly spaced points between `x1` and `x2`.
public func linspacef(_ x1: RealDouble, _ x2: RealDouble, _ n: Int = 100) -> RealFloatArray {
    if n <= 1 {
        return [Float(x1)]
    }

    // Keep internal as Double
    let step: Double = (x2 - x1) / Double(n - 1)
    // Convert to Float
    return (0 ..< n).map { Float(x1 + Double($0) * step) }
}


/*
// Example:
let values = linspace(0, 10, 5)
print(values)  // Output: [0.0, 2.5, 5.0, 7.5, 10.0]
*/
