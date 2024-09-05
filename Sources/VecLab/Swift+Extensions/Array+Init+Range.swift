//
//  Array+Init+Range.swift
//
//  Created by Marcus Painter on 05/09/2023.
//

import Foundation

public extension Array where Element == Double {
    // Open range (..<) to
    init(_ range: Range<Int>, _ strideValue: Int = 1) {
        let stridedValues = stride(from: range.lowerBound, to: range.upperBound, by: strideValue)
        self = stridedValues.map { Double($0) }
    }

    init(_ range: Range<RealDouble>, _ strideValue: RealDouble = 1) {
        let stridedValues = stride(from: range.lowerBound, to: range.upperBound, by: strideValue)
        self = stridedValues.map { Double($0) }
    }

    // Closed range (...) through
    init(_ range: ClosedRange<RealDouble>, _ strideValue: RealDouble = 1) {
        let stridedValues = stride(from: range.lowerBound, through: range.upperBound, by: strideValue)
        self = stridedValues.map { Double($0) }
    }

    init(_ range: ClosedRange<Int>, _ strideValue: Int = 1) {
        let stridedValues = stride(from: range.lowerBound, through: range.upperBound, by: strideValue)
        self = stridedValues.map { Double($0) }
    }
}

public extension Array where Element == Float {
    // Open range (..<) to
    init(_ range: Range<Int>, _ strideValue: Int = 1) {
        let stridedValues = stride(from: range.lowerBound, to: range.upperBound, by: strideValue)
        self = stridedValues.map { Float($0) }
    }

    init(_ range: Range<RealFloat>, _ strideValue: RealFloat = 1) {
        let stridedValues = stride(from: range.lowerBound, to: range.upperBound, by: strideValue)
        self = stridedValues.map { Float($0) }
    }

    // Closed range (...) through
    init(_ range: ClosedRange<RealFloat>, _ strideValue: RealFloat = 1) {
        let stridedValues = stride(from: range.lowerBound, through: range.upperBound, by: strideValue)
        self = stridedValues.map { Float($0) }
    }

    init(_ range: ClosedRange<Int>, _ strideValue: Int = 1) {
        let stridedValues = stride(from: range.lowerBound, through: range.upperBound, by: strideValue)
        self = stridedValues.map { Float($0) }
    }
}
