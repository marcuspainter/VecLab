//
//  mode.swift
//  
//
//  Created by Marcus Painter on 12/09/2023.
//

import Foundation

/// Computes the mode(s) of an array.
///
/// The mode is the value that appears most frequently in a dataset.
/// A data set may have one mode, more than one mode, or no mode at all.
///
/// - Parameter data: Input array of real numbers.
/// - Returns: An array containing the mode or modes of the data.
/// If the dataset doesn't have a mode, the returned array will be empty.
///
/// # Example:
/// ```
/// let dataSet1: RealArray = [1.2, 3.5, 2.9, 3.5, 3.8]
/// let modeValue1 = mode(dataSet1)
/// print(modeValue1)  // prints: [3.5]
///
/// let dataSet2: RealArray = [1.2, 3.5, 2.9, 4.1, 3.5, 2.9]
/// let modeValue2 = mode(dataSet2)
/// print(modeValue2)  // prints: [2.9, 3.5] (order might vary)
/// ```
public func mode(_ data: RealArray) -> RealArray {
    var countMap = [Real: Int]()

    // Count the occurrence of each value in the dataset
    for value in data {
        countMap[value, default: 0] += 1
    }

    // Find the maximum count
    guard let maxCount = countMap.values.max() else {
        return []
    }

    // Filter the values that match the maximum count
    let modes = countMap.filter { $1 == maxCount }.keys
    let result = Array(modes).sorted()

    return result
}

/*

// Example usage
let dataSet = [1.0, 2.0, 3.0, 3.0, 4.0, 5.0, 3.0, 2.0]
print(mode(dataSet))  // Output: [3.0]

*/

/*
 In this mode function, first create a dictionary (countMap) to count the occurrence of each value in the dataset.
 I then find the value(s) that have the maximum count and return them as the mode. If there are multiple values
 with the same highest count, all of them are returned.
 */
