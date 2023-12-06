//
//  Array+Init+Range.swift
//
//  Created by Marcus Painter on 05/09/2023.
//

import Foundation

public extension Array where Element == Real {
    // Open range (..<) to
    init(_ range: Range<Int>, _ strideValue: Int = 1) {
        let stridedValues = stride(from: range.lowerBound, to: range.upperBound, by: strideValue)
        self = stridedValues.map { Real($0) }
    }

    init(_ range: Range<Real>, _ strideValue: Real = 1) {
        let stridedValues = stride(from: range.lowerBound, to: range.upperBound, by: strideValue)
        self = stridedValues.map { Real($0) }
    }

    // Closed range (...) through
    init(_ range: ClosedRange<Real>, _ strideValue: Real = 1) {
        let stridedValues = stride(from: range.lowerBound, through: range.upperBound, by: strideValue)
        self = stridedValues.map { Real($0) }
    }

    init(_ range: ClosedRange<Int>, _ strideValue: Int = 1) {
        let stridedValues = stride(from: range.lowerBound, through: range.upperBound, by: strideValue)
        self = stridedValues.map { Real($0) }
    }
}
