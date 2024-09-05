//
//  mode.swift
//  
//
//  Created by Marcus Painter on 12/09/2023.
//

import Foundation

/// Computes the mode(s) of an array.
///
/// The mode is the value that appears most frequently in a dataset. A data set may have one mode, more than one mode, or no mode at all.
///
/// - Parameter data: Input array of real numbers.
/// - Returns: An array containing the mode or modes of the data. If the dataset doesn't have a mode, the returned array will be empty.
public func mode(_ data: RealDoubleArray) -> RealDoubleArray {
    var countMap = [RealDouble: Int]()

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

/// Computes the mode(s) of an array.
///
/// The mode is the value that appears most frequently in a dataset. A data set may have one mode, more than one mode, or no mode at all.
///
/// - Parameter data: Input array of real numbers.
/// - Returns: An array containing the mode or modes of the data. If the dataset doesn't have a mode, the returned array will be empty.
public func mode(_ data: RealFloatArray) -> RealFloatArray {
    var countMap = [RealFloat: Int]()

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
