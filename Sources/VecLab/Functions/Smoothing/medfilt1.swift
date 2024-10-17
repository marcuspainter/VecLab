//
//  medfilt1.swift
//  
//
//  Created by Marcus Painter on 12/09/2023.
//

import Foundation

/// One-dimensional median filter.
///
/// The `medfilt1` function is a one-dimensional median filter. It replaces each entry in an input sequence with the median
/// of neighboring entries. The range of neighboring entries is specified by a window size parameter. It's essentially a special
/// case of the `hampel` function where you only consider the median and don't replace based on deviations.
///
/// - Parameters:
///   - x: Input data array.
///   - k: Half-width of the window (number of elements on each side of the center element).
///   - padding: Padding.
/// - Returns: Filtered data array.
public func medfilt1(_ x: RealArray, k: Int = 3, padding: String = "zeropad") -> RealArray {
    switch padding {
    case "truncate":
        return medfilt1Truncate(x, k: k)
    case "zeropad": // "zeropad"
        return medfilt1ZeroPad(x, k: k)
    default:
        fatalError("Invalid padding option.")
    }
}

private func medfilt1ZeroPad(_ x: RealArray, k: Int) -> RealArray {
    var y = RealArray(repeating: 0, count: x.count)
    let paddingLength = k / 2
    let zeros = RealArray(repeating: 0.0, count: paddingLength)
    let paddedX = cat(zeros, x, zeros)

    for i in 0..<x.count {
        let start = i
        let end = i + k

        let windowSlice = paddedX[start..<end]
        y[i] = median(Array(windowSlice))
    }

    return y
}

private func medfilt1Truncate(_ x: RealArray, k: Int) -> RealArray {
    var y = RealArray(repeating: 0, count: x.count)

    for i in 0..<x.count {
        let halfK = k / 2
        let start = max(0, i - halfK)
        let end = min(x.count - 1, i + halfK)

        let windowSlice = x[start...end]
        y[i] = median(Array(windowSlice))
    }

    return y
}

/*
 This function is similar in structure to hampel, but instead of checking for outliers, it simply replaces each value in the array with the median of its surrounding values. Note that this version of medfilt1 is designed to handle the edge cases by reducing the window size near the start and end of the array.
 */
