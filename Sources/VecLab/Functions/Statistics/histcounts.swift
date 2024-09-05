//
//  histcounts.swift
//  
//
//  Created by Marcus Painter on 12/09/2023.
//

import Foundation

/// Generates histogram counts using an automatic binning algorithm.
///
/// This function partitions the provided data into bins with uniform width, which is computed automatically. The automatic bin width is based on the Freedman-Diaconis rule that considers both the data spread (interquartile range) and the number of data points.
///
/// - Parameter data: Array of input data values.
/// - Returns: A tuple with the first value being an array (`counts`) detailing the number of data points in each bin, and the second value (`edges`) being an array representing the edges of each bin.
public func histcounts(_ data: RealDoubleArray) -> (counts: [Int], edges: RealDoubleArray) {
    let binWidth = autoBinWidth(data: data)
    let bins = Int((data.max()! - data.min()!) / binWidth)
    return histcounts(data, bins: bins)
}

/// Generates histogram counts based on the provided number of bins.
///
/// This function partitions the provided data into a specific number of bins (`nbins`). Each bin captures a range of data values, and the function computes how many data points fall into each bin.
///
/// - Parameters:
///   - data: Array of input data values.
///   - bins: Desired number of bins for partitioning the data.
/// - Returns: A tuple with the first value being an array (`counts`) detailing the number of data points in each bin, and the second value (`edges`) being an array representing the edges of each bin.
public func histcounts(_ data: RealDoubleArray, bins: Int) -> (counts: [Int], edges: RealDoubleArray) {
    guard !data.isEmpty else { return (counts: [], edges: []) }

    let minVal = data.min()!
    let maxVal = data.max()!

    // Calculate bin width
    let binWidth = (maxVal - minVal) / Double(bins)

    // Define bin edges
    var binEdges = RealDoubleArray(repeating: 0.0, count: bins + 1)
    for i in 0...bins {
        binEdges[i] = minVal + Double(i) * binWidth
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

/// Calculate bin widths
func autoBinWidth(data: RealDoubleArray) -> RealDouble {
    let sortedData = data.sorted()
    let N = Double(data.count)

    // Compute the interquartile range (IQR)
    let lowerQuartile = sortedData[Int(0.25 * N)]
    let upperQuartile = sortedData[Int(0.75 * N)]
    let IQR = upperQuartile - lowerQuartile

    // Calculate bin width using the Freedman-Diaconis rule
    let binWidth = 2.0 * IQR / pow(Double(N), 1.0/3.0)

    return binWidth
}

// MARK: Float

/// Generates histogram counts using an automatic binning algorithm.
///
/// This function partitions the provided data into bins with uniform width, which is computed automatically. The automatic bin width is based on the Freedman-Diaconis rule that considers both the data spread (interquartile range) and the number of data points.
///
/// - Parameter data: Array of input data values.
/// - Returns: A tuple with the first value being an array (`counts`) detailing the number of data points in each bin, and the second value (`edges`) being an array representing the edges of each bin.
public func histcounts(_ data: RealFloatArray) -> (counts: [Int], edges: RealFloatArray) {
    let binWidth = autoBinWidth(data: data)
    let bins = Int((data.max()! - data.min()!) / binWidth)
    return histcounts(data, bins: bins)
}

/// Generates histogram counts based on the provided number of bins.
///
/// This function partitions the provided data into a specific number of bins (`nbins`). Each bin captures a range of data values, and the function computes how many data points fall into each bin.
///
/// - Parameters:
///   - data: Array of input data values.
///   - bins: Desired number of bins for partitioning the data.
/// - Returns: A tuple with the first value being an array (`counts`) detailing the number of data points in each bin, and the second value (`edges`) being an array representing the edges of each bin.
public func histcounts(_ data: RealFloatArray, bins: Int) -> (counts: [Int], edges: RealFloatArray) {
    guard !data.isEmpty else { return (counts: [], edges: []) }

    let minVal = data.min()!
    let maxVal = data.max()!

    // Calculate bin width
    let binWidth = (maxVal - minVal) / Float(bins)

    // Define bin edges
    var binEdges = RealFloatArray(repeating: 0.0, count: bins + 1)
    for i in 0...bins {
        binEdges[i] = minVal + Float(i) * binWidth
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


func autoBinWidth(data: RealFloatArray) -> RealFloat {
    let sortedData = data.sorted()
    let N = Float(data.count)

    // Compute the interquartile range (IQR)
    let lowerQuartile = sortedData[Int(0.25 * N)]
    let upperQuartile = sortedData[Int(0.75 * N)]
    let IQR = upperQuartile - lowerQuartile

    // Calculate bin width using the Freedman-Diaconis rule
    let binWidth = 2.0 * IQR / pow(Float(N), 1.0/3.0)

    return Float(binWidth)
}
