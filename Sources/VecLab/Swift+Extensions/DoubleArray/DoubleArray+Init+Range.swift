//
//  DoubleArray+Init+Range.swift
//
//  Created by Marcus Painter on 05/09/2023.
//

import Foundation

public extension Array where Element == Double {
    /// Initialize a real array with an integer open range.
    /// - Parameters:
    ///   - range: Open integer range.
    ///   - step: Step value, default = 1.
    init(_ range: Range<Int>, _ step: Int = 1) {
        let  strideValue = stride(from: range.lowerBound, to: range.upperBound, by: step)
        self = strideValue.map { Element($0) }
    }

    /// Initialize a real array with a real open range.
    /// - Parameters:
    ///   - range: Open real range.
    ///   - step: Step value, default = 1.
    init(_ range: Range<Double>, _ step: Double = 1) {
        let strideValue = stride(from: range.lowerBound, to: range.upperBound, by: step)
        self = strideValue.map { $0 }
    }

    /// Initialize a real array with a real closed range.
    /// - Parameters:
    ///   - range: Closed real range.
    ///   - step: Step value, default = 1.
    init(_ range: ClosedRange<Double>, _ step: Double = 1) {
        let strideValue = stride(from: range.lowerBound, through: range.upperBound, by: step)
        self = strideValue.map { ($0) }
    }

    /// Initialize a real array with a real closed range.
    /// - Parameters:
    ///   - range: Closed integer range.
    ///   - step: Stride value, default = 1.
    init(_ range: ClosedRange<Int>, _ step: Int = 1) {
        let strideValue = stride(from: range.lowerBound, through: range.upperBound, by: step)
        self = strideValue.map { Element($0) }
    }
}
