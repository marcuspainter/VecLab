//
//  Array+Init+Range.swift
//
//  Created by Marcus Painter on 05/09/2023.
//

import Foundation

public extension Array where Element == Real {
    /// Initialize a real array with an integer open range.
    /// - Parameters:
    ///   - range: Open integer range.
    ///   - strideValue: Stride value, default = 1.
    init(_ range: Range<Int>, _ strideValue: Int = 1) {
        let stridedValues = stride(from: range.lowerBound, to: range.upperBound, by: strideValue)
        self = stridedValues.map { Real($0) }
    }

    /// Initialize a real array with a real open range.
    /// - Parameters:
    ///   - range: Open real range.
    ///   - strideValue: Stride value, default = 1.
    init(_ range: Range<Real>, _ strideValue: Real = 1) {
        let stridedValues = stride(from: range.lowerBound, to: range.upperBound, by: strideValue)
        self = stridedValues.map { Real($0) }
    }

    /// Initialize a real array with a real closed range.
    /// - Parameters:
    ///   - range: Closed real range.
    ///   - strideValue: Stride value, default = 1.
    init(_ range: ClosedRange<Real>, _ strideValue: Real = 1) {
        let stridedValues = stride(from: range.lowerBound, through: range.upperBound, by: strideValue)
        self = stridedValues.map { Real($0) }
    }

    /// Initialize a real array with a real closed range.
    /// - Parameters:
    ///   - range: Closed integer range.
    ///   - strideValue: Stride value, default = 1.
    init(_ range: ClosedRange<Int>, _ strideValue: Int = 1) {
        let stridedValues = stride(from: range.lowerBound, through: range.upperBound, by: strideValue)
        self = stridedValues.map { Real($0) }
    }
}
