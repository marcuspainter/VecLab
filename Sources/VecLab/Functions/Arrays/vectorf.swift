//
//  File.swift
//  
//
//  Created by Marcus Painter on 05/09/2024.
//

import Foundation


/// Create a real array.
/// - Parameter count: Number of elements in the array.
/// - Returns: A real array of length `count`.
public func vector(count: Int) -> RealFloatArray {
    return RealFloatArray(repeating: 0, count: count)
}

// MARK: Arrays

/// Create a real array from an integer array.
/// - Parameter x: Integer array.
/// - Returns: A real array.
public func vector(_ x: [Int]) -> RealFloatArray {
    return x.map { Float($0) }
}

/// Create a real array from a Float array.
/// - Parameter x: Float array.
/// - Returns: A real array.
public func vector(_ x: [Float]) -> RealFloatArray {
    return x.map { Float($0) }
}

/// Create a real array from a Double array.
/// - Parameter x: Double array.
/// - Returns: A real array.
public func vector(_ x: [Double]) -> RealFloatArray {
    return x.map { Float($0) }
}

// MARK: Ranges

/// Create a real array from a range.
/// - Parameters:
///   - range: The range.
///   - strideValue: Optional stride value. Default 1.
/// - Returns: A real array.
public func vector(_ range: Range<Int>, _ strideValue: Int = 1) -> RealFloatArray {
    let stridedValues = stride(from: range.lowerBound, to: range.upperBound, by: strideValue)
    return stridedValues.map { Float($0) }
}

/// Create a real array from a real range.
/// - Parameters:
///   - range: The range.
///   - strideValue: Optional stride value. Default 1.
/// - Returns: A real array.
public func vector(_ range: Range<RealFloat>, _ strideValue: RealFloat = 1) -> RealFloatArray {
    let stridedValues = stride(from: range.lowerBound, to: range.upperBound, by: strideValue)
    return stridedValues.map { Float($0) }
}

/// Create a real array from a real closed range.
/// - Parameters:
///   - range: The range.
///   - strideValue: Optional stride value. Default 1.
/// - Returns: A real array.
public func vector(_ range: ClosedRange<RealFloat>, _ strideValue: RealFloat = 1) -> RealFloatArray {
    let stridedValues = stride(from: range.lowerBound, through: range.upperBound, by: strideValue)
    return stridedValues.map { Float($0) }
}

/// Create a real array from an integer closed range.
/// - Parameters:
///   - range: The range.
///   - strideValue: Optional stride value. Default 1.
/// - Returns: A real array.
public func vector(_ range: ClosedRange<Int>, _ strideValue: Int = 1) -> RealFloatArray {
    let stridedValues = stride(from: range.lowerBound, through: range.upperBound, by: strideValue)
    return stridedValues.map { Float($0) }
}

// MARK: Sized

/// Create a real array of the same size as a real array.
/// - Parameter sized: Real array.
/// - Returns: A real array the same size the real array.
public func vector(sized: RealFloatArray) -> RealFloatArray {
    return RealFloatArray(repeating: 0, count: sized.count)
}

/// Create a real array of the same size as a complex array.
/// - Parameter sized: Complex array.
/// - Returns: A real array the same size as the complex array.
public func vector(sized: ComplexDoubleArray) -> RealFloatArray {
    return RealFloatArray(repeating: 0, count: sized.0.count)
}
