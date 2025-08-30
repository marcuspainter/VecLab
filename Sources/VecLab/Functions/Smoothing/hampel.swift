//
//  hampel.swift
//  
//
//  Created by Marcus Painter on 12/09/2023.
//

import Foundation

/// Hampel filter for outlier detection and removal.
///
/// The `hampel` function is used for outlier detection and filtering. It's a robust technique to filter
/// out outliers based on the median of a sliding window. When a data point deviates from the
/// median by more than a given threshold (usually provided as a number of standard deviations),
/// it is replaced by the median.
/// - Parameters:
///   - x: Input data array.
///   - k: Half-width of the window (number of elements on each side of the center element).
///   - sigma: Number of standard deviations to use as a threshold.
/// - Returns: Filtered data array.
public func hampel(_ x: RealArray, k: Int = 3, sigma: Real = 3.0) -> RealArray {
    guard x.count > 2 * k + 1 else {
        // Consider replacing with a different error handling mechanism.
        fatalError("Input data length should be greater than 2k+1.")
    }

    var y = x

    for i in k..<x.count-k {
        let window = Array(x[(i-k)...(i+k)])
        let medianValue = median(window)
        let deviation = window.map { abs($0 - medianValue) }
        let medianDeviation = median(deviation)

        // Replace outlier with median value of the window
        if abs(x[i] - medianValue) > sigma * medianDeviation {
            y[i] = medianValue
        }
    }

    return y
}

/*
In this implementation:

The hampel function goes through each element of the input data x and considers a sliding window of size 2k+1 around
the current element.
For each window, it computes the median of the window's values and also the median absolute deviation from the median.
If the current element's deviation from the median exceeds `sigma` times the median absolute deviation, the value is
considered an outlier and is replaced by the median.
The median function computes the median of a given array of numbers.
 */
