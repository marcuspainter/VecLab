//
//  RealArray+vector.swift
//  VecLab
//
//  Created by Marcus Painter on 21/09/2025.
//

import Foundation
import Accelerate

/// Create a real array.
/// - Parameter count: Number of elements in the array.
/// - Returns: A real array of length `count`.
public func vector(count: Int) -> RealArray {
    return RealArray(repeating: 0, count: count)
}

// MARK: Arrays

/// Create a real array from an integer array.
/// - Parameter x: Integer array.
/// - Returns: A real array.
public func vector(_ x: [Int]) -> RealArray {
    return x.map { Real($0) }
}

/// Create a real array from a Float array.
/// - Parameter x: Float array.
/// - Returns: A real array.
public func vector(_ x: [Float]) -> RealArray {
    return RealArray(floatArray: x)
}

/// Create a real array from a Double array.
/// - Parameter x: Double array.
/// - Returns: A real array.
public func vector(_ x: [Double]) -> RealArray {
    return x
}

// MARK: Ranges

/// Create a real array from a range.
/// - Parameters:
///   - range: The range.
///   - step: Optional stride value. Default 1.
/// - Returns: A real array.
public func vector(_ range: Range<Int>, _ step: Int = 1) -> RealArray {
    guard step != 0 else { return [] } // avoid infinite loop

    let distance = range.upperBound - range.lowerBound
    let count = max(0, Int(distance / step)) // floor division to stay below upperBound

    return vDSP.ramp(withInitialValue: Double(range.lowerBound), increment: Double(step), count: count)
}

/// Create a real array from a real range.
/// - Parameters:
///   - range: The range.
///   - step: Optional stride value. Default 1.
/// - Returns: A real array.
public func vector(_ range: Range<Real>, _ step: Real = 1) -> RealArray {
    guard step != 0 else { return [] } // avoid infinite loop

    let distance = range.upperBound - range.lowerBound
    let count = max(0, Int(distance / step)) // floor division to stay below upperBound

    return vDSP.ramp(withInitialValue: range.lowerBound, increment: step, count: count)
}

/// Create a real array from a real closed range.
/// - Parameters:
///   - range: The range.
///   - step: Optional stride value. Default 1.
/// - Returns: A real array.
public func vector(_ range: ClosedRange<Real>, _ step: Real = 1) -> RealArray {
    guard step != 0 else { return [] } // avoid infinite loop

    let distance = range.upperBound - range.lowerBound
    let count = max(0, Int(floor(distance / step)) + 1)

    return vDSP.ramp(withInitialValue: range.lowerBound, increment: step, count: count)
}

/// Create a real array from an integer closed range.
/// - Parameters:
///   - range: The range.
///   - step: Optional stride value. Default 1.
/// - Returns: A real array.
public func vector(_ range: ClosedRange<Int>, _ step: Int = 1) -> RealArray {
    guard step != 0 else { return [] } // avoid infinite loop

    let distance = Double(range.upperBound - range.lowerBound)
    let count = max(0, Int(floor(distance / Double(step))) + 1)

    return vDSP.ramp(withInitialValue: Double(range.lowerBound), increment: Double(step), count: count)
}

// MARK: Sized

/// Create a real array of the same size as any array.
/// - Parameter sized: Real array.
/// - Returns: A real array the same size the array.
public func vector(sized: any Collection) -> RealArray {
    return RealArray(repeating: 0, count: sized.count)
}
