//
//  median.swift
//  
//
//  Created by Marcus Painter on 12/09/2023.
//

import Foundation

/// Median value of an array.
///
/// The median is the value separating the higher half from the lower half of the data set. If the data set has an odd number of observations, the number in the middle is the median. For an even number of observations, it's the average of the two middle numbers.
///
/// - Parameter data: Input array of real numbers.
/// - Returns: The median value of the array.
///
/// #### Example:
/// ```
/// let dataSet1: [Real] = [1.2, 3.5, 2.9, 4.1, 3.8]
/// let medianValue1 = median(dataSet1)
/// print(medianValue1)  // prints: 3.5
///
/// let dataSet2: [Real] = [1.2, 3.5, 2.9, 3.8]
/// let medianValue2 = median(dataSet2)
/// print(medianValue2)  // prints: 3.65 (average of 3.5 and 3.8)
/// ```
///
public func median(_ data: RealArray) -> Real {
    let sortedData = data.sorted()
    let middle = sortedData.count / 2
    if sortedData.count.isMultiple(of: 2) {
        return (sortedData[middle - 1] + sortedData[middle]) / 2
    } else {
        return sortedData[middle]
    }
}
