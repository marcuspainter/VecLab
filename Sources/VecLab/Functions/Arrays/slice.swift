//
//  slice.swift
//
//
//  Created by Marcus Painter on 12/09/2023.
//

import Foundation

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

/// Extract a range from a complex array.
/// - Parameters:
///   - x: The array.
///   - range:Index range.
///   - by: The index step size.
/// - Returns: The sub array.
public func slice(_ x: ComplexArray, _ range: Range<Int>, _ by: Int = 1) -> ComplexArray {
    validateSize(x)
    if by == 1 {
        return ComplexArray(Array(x.real[range]), Array(x.imag[range]))
    } else {
        let indexRange = stride(from: range.lowerBound, to: range.upperBound, by: by)
        let real = indexRange.map { x.real[$0] }
        let imag = indexRange.map { x.imag[$0] }
        return ComplexArray(real, imag)
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

/// Extract a closed range from a complex array.
/// - Parameters:
///   - x: The array.
///   - range:Index range.
///   - by: The index step size.
/// - Returns: The sub array.
public func slice(_ x: ComplexArray, _ range: ClosedRange<Int>, _ by: Int = 1) -> ComplexArray {
    validateSize(x)
    if by == 1 {
        return ComplexArray(Array(x.real[range]), Array(x.imag[range]))
    } else {
        let indexRange = stride(from: range.lowerBound, to: range.upperBound, by: by)
        let real = indexRange.map { x.real[$0] }
        let imag = indexRange.map { x.imag[$0] }
        return ComplexArray(real, imag)
    }
}
