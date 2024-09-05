//
//  vector.swift
//
//
//  Created by Marcus Painter on 01/12/2023.
//

import Foundation

/// Create a real array.
/// - Parameter count: Number of elements in the array.
/// - Returns: A real array of length `count`.
public func vector(count: Int) -> RealDoubleArray {
    return RealDoubleArray(repeating: 0, count: count)
}

// MARK: Arrays

/// Create a real array from an integer array.
/// - Parameter x: Integer array.
/// - Returns: A real array.
public func vector(_ x: [Int]) -> RealDoubleArray {
    return x.map { Double($0) }
}

/// Create a real array from a Float array.
/// - Parameter x: Float array.
/// - Returns: A real array.
public func vector(_ x: [Float]) -> RealDoubleArray {
    return x.map { Double($0) }
}

/// Create a real array from a Double array.
/// - Parameter x: Double array.
/// - Returns: A real array.
public func vector(_ x: [Double]) -> RealDoubleArray {
    return x.map { Double($0) }
}

// MARK: Ranges

/// Create a real array from a range.
/// - Parameters:
///   - range: The range.
///   - strideValue: Optional stride value. Default 1.
/// - Returns: A real array.
public func vector(_ range: Range<Int>, _ strideValue: Int = 1) -> RealDoubleArray {
    let stridedValues = stride(from: range.lowerBound, to: range.upperBound, by: strideValue)
    return stridedValues.map { Double($0) }
}

/// Create a real array from a real range.
/// - Parameters:
///   - range: The range.
///   - strideValue: Optional stride value. Default 1.
/// - Returns: A real array.
public func vector(_ range: Range<RealDouble>, _ strideValue: RealDouble = 1) -> RealDoubleArray {
    let stridedValues = stride(from: range.lowerBound, to: range.upperBound, by: strideValue)
    return stridedValues.map { Double($0) }
}

/// Create a real array from a real closed range.
/// - Parameters:
///   - range: The range.
///   - strideValue: Optional stride value. Default 1.
/// - Returns: A real array.
public func vector(_ range: ClosedRange<RealDouble>, _ strideValue: RealDouble = 1) -> RealDoubleArray {
    let stridedValues = stride(from: range.lowerBound, through: range.upperBound, by: strideValue)
    return stridedValues.map { Double($0) }
}

/// Create a real array from an integer closed range.
/// - Parameters:
///   - range: The range.
///   - strideValue: Optional stride value. Default 1.
/// - Returns: A real array.
public func vector(_ range: ClosedRange<Int>, _ strideValue: Int = 1) -> RealDoubleArray {
    let stridedValues = stride(from: range.lowerBound, through: range.upperBound, by: strideValue)
    return stridedValues.map { Double($0) }
}

// MARK: Sized

/// Create a real array of the same size as a real array.
/// - Parameter sized: Real array.
/// - Returns: A real array the same size the real array.
public func vector(sized: RealDoubleArray) -> RealDoubleArray {
    return RealDoubleArray(repeating: 0, count: sized.count)
}

/// Create a real array of the same size as a complex array.
/// - Parameter sized: Complex array.
/// - Returns: A real array the same size as the complex array.
public func vector(sized: ComplexDoubleArray) -> RealDoubleArray {
    return RealDoubleArray(repeating: 0, count: sized.0.count)
}
