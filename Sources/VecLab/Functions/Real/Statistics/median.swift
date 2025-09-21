//
//  median.swift
//
//
//  Created by Marcus Painter on 12/09/2023.
//

import Foundation

/// Median value of an array.
///
/// The median is the value separating the higher half from the lower half of the data set.
/// If the data set has an odd number of observations, the number in the middle is the median.
/// For an even number of observations, it's the average of the two middle numbers.
///
/// - Parameter data: Input array of real numbers.
/// - Returns: The median value of the array.
public func median(_ data: RealArray) -> Real {
    let sortedData = data.sorted()
    let middle = sortedData.count / 2
    if sortedData.count.isMultiple(of: 2) {
        return (sortedData[middle - 1] + sortedData[middle]) / 2
    } else {
        return sortedData[middle]
    }
}
