//
//  RealArray+slice.swift
//  VecLab
//
//  Created by Marcus Painter on 21/09/2025.
//

// MARK: Open range (..<) to

/// Extract a range from an array.
/// - Parameters:
///   - x: The array.
///   - range:Index range.
///   - by: The index step size.
/// - Returns: The sub array.
public func slice(_ x: RealArray, _ range: Range<Int>, _ by: Int = 1) -> RealArray {
    if by == 1 {
        return Array(x[range])
    } else {
        let strideRange = stride(from: range.lowerBound, to: range.upperBound, by: by)
        return strideRange.map { x[$0] }
    }
}

// MARK: Closed range (...) to

/// Extract a closed range from a real array.
/// - Parameters:
///   - x: The array.
///   - range:Index range.
///   - by: The index step size.
/// - Returns: The sub array.
public func slice(_ x: RealArray, _ range: ClosedRange<Int>, _ by: Int = 1) -> RealArray {
    if by == 1 {
        return Array(x[range])
    } else {
        let strideRange = stride(from: range.lowerBound, to: range.upperBound, by: by)
        return strideRange.map { x[$0] }
    }
}
