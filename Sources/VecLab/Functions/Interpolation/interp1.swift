//
//  interp1.swift
//  
//
//  Created by Marcus Painter on 12/09/2023.
//

import Foundation

/// Linear interpolation
///
/// This function returns the linear interpolant to a function with given values at discrete data-points. 
/// It mimics MATLAB's `interp1` function for the linear interpolation method.
///
/// - Parameters:
///   - x: The x-coordinates of a set of data points. Assumes this array is sorted in increasing order.
///   - y: The y-coordinates of a set of data points.
///   - xi: The x-coordinates of the points where the function should be interpolated.
/// - Returns: The interpolated y-values corresponding to each value in `xi`.
///
/// - Note: The `x` array is expected to be sorted in increasing order. If a value in `xi` is outside the bounds of `x`,
///  it will be extrapolated using the nearest `y` value.
public func interp1(x: RealArray, y: RealArray, xi: RealArray) -> RealArray {
    var yi = [Double](repeating: 0.0, count: xi.count)

    for (i, xiValue) in xi.enumerated() {
        // Find the bracketing indices of xiValue in x
        var j = 0
        while j < x.count - 1, xiValue > x[j + 1] {
            j += 1
        }

        if j == x.count - 1 {
            // If xiValue is beyond the last value in x, use the last y value
            yi[i] = y.last!
        } else {
            // Linear interpolation
            let t = (xiValue - x[j]) / (x[j + 1] - x[j])
            yi[i] = y[j] + t * (y[j + 1] - y[j])
        }
    }

    return yi
}
