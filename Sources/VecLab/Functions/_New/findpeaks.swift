//
//  findpeaks.swift
//  VecLab
//
//  Created by Marcus Painter on 24/03/2025.
//

/// Find peaks
/// - Parameters:
///   - x: Real array.
///   - minPeakHeight: Minimum peak height.
///   - threshold: Threshold of neighbors.
/// - Returns: Peaks and locations.
public func findpeaks(_ x: RealArray, minPeakHeight: Real? = nil, threshold: Real? = nil)
    -> (peaks: RealArray, locations: [Int])
{
    guard x.count > 2 else {
        return ([], [])
    }

    var peaks = [Real]()
    var locations = [Int]()

    // Loop through array (excluding first and last elements)
    for i in 1..<x.count - 1 {
        let current = x[i]
        let left = x[i - 1]
        let right = x[i + 1]

        // Check if the current point is a local maximum
        if current > left && current > right {
            // Check if peak meets minimum height requirement
            if let minHeight = minPeakHeight, current < minHeight {
                continue
            }

            // Check if peak exceeds neighbors by the threshold amount
            if let thresholdValue = threshold {
                let leftExceedance = current - left
                let rightExceedance = current - right

                // Both sides must exceed the threshold
                if leftExceedance < thresholdValue || rightExceedance < thresholdValue {
                    continue
                }
            }

            // If we get here, the peak passes all criteria
            peaks.append(current)
            locations.append(i)
        }
    }

    return (peaks, locations)
}

// Usage example:
// let y = [0.0, 1.0, 2.0, 1.0, 3.0, 4.0, 3.0, 2.0, 5.0, 2.0]
//
// // Find peaks with height >= 3.0
// let (peaks1, locations1) = findPeaks(in: y, minPeakHeight: 3.0)
//
// // Find peaks that exceed neighbors by at least 1.0
// let (peaks2, locations2) = findPeaks(in: y, threshold: 1.0)
//
// // Find peaks with height >= 3.0 that exceed neighbors by at least 1.0
// let (peaks3, locations3) = findPeaks(in: y, minPeakHeight: 3.0, threshold: 1.0)
