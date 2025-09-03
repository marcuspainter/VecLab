//
//  histcounts.swift
//
//
//  Created by Marcus Painter on 12/09/2023.
//

import Foundation

/// Generates histogram counts using an automatic binning algorithm.
///
/// This function partitions the provided data into bins with uniform width, which is computed automatically.
/// The automatic bin width is based on the Freedman-Diaconis rule that considers both the data spread
/// (interquartile range) and the number of data points.
///
/// - Parameter data: Array of input data values.
/// - Returns: A tuple with the first value being an array (`counts`) detailing the number of data points in
/// each bin, and the second value (`edges`) being an array representing the edges of each bin.
///
/// # Example:
/// ```
/// let dataPoints = [1.2, 2.1, 2.9, 3.4, 3.9, 5.0]
/// let result = histcounts(data: dataPoints)
/// print(result.counts)  // might print: [1, 2, 2, 1]
/// print(result.edges)   // bin edges depending on the calculated bin width
/// ```
///
public func histcounts(_ data: RealArray) -> (counts: [Int], edges: RealArray) {
    let binWidth = autoBinWidth(data: data)
    let bins = Int((data.max()! - data.min()!) / binWidth)
    return histcounts(data, bins: bins)
}

/// Generates histogram counts based on the provided number of bins.
///
/// This function partitions the provided data into a specific number of bins (`nbins`).
/// Each bin captures a range of data values, and the function computes how many
///  data points fall into each bin.
///
/// - Parameters:
///   - data: Array of input data values.
///   - bins: Desired number of bins for partitioning the data.
/// - Returns: A tuple with the first value being an array (`counts`) detailing
/// the number of data points in each bin, and the second value (`edges`) being an array
/// representing the edges of each bin.
///
/// # Example:
/// ```
/// let dataPoints = [1.2, 2.1, 2.9, 3.4, 3.9, 5.0]
/// let result = histcounts(dataPoints, 4)
/// print(result.counts)  // might print: [1, 2, 2, 1]
/// print(result.edges)   // might print: [1.2, 2.1, 3.0, 3.9, 5.0]
/// ```
public func histcounts(_ data: RealArray, bins: Int) -> (counts: [Int], edges: RealArray) {
    guard !data.isEmpty else { return (counts: [], edges: []) }

    let minVal = data.min()!
    let maxVal = data.max()!

    // Calculate bin width
    let binWidth = (maxVal - minVal) / Real(bins)

    // Define bin edges
    var binEdges = RealArray(repeating: 0.0, count: bins + 1)
    for i in 0...bins {
        binEdges[i] = minVal + Real(i) * binWidth
    }

    // Initialize counts array
    var counts = [Int](repeating: 0, count: bins)

    // Populate counts array
    for value in data {
        if value == maxVal {
            counts[bins - 1] += 1
        } else {
            let binIndex = Int((value - minVal) / binWidth)
            counts[binIndex] += 1
        }
    }

    return (counts: counts, edges: binEdges)
}

/*
// Example usage
let data = [1.5, 2.3, 3.1, 3.7, 4.5, 5.6]
let (counts, edges) = histcounts(data, 5)
print(counts)  // Output: [1, 1, 2, 1, 1]
print(edges)   // Output: [1.5, 2.31, 3.12, 3.93, 4.74, 5.6]
 */

/*
 One commonly used algorithm to automatically select the bin size for histograms is the Freedman-Diaconis rule.
 The rule calculates the bin width based on the interquartile range (IQR) and the number of data points. It's designed
 to minimize the difference between the estimated and true underlying distribution.

 */

/// Calculate bin widths
func autoBinWidth(data: RealArray) -> Real {
    let sortedData = data.sorted()
    let N = Real(data.count)

    // Compute the interquartile range (IQR)
    let lowerQuartile = sortedData[Int(0.25 * N)]
    let upperQuartile = sortedData[Int(0.75 * N)]
    let IQR = upperQuartile - lowerQuartile

    // Calculate bin width using the Freedman-Diaconis rule
    let binWidth = 2.0 * IQR / pow(N, 1.0 / 3.0)

    return binWidth
}
