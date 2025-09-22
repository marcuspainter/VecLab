//
//  SplitComplexArray+slice.swift
//  VecLab
//
//  Created by Marcus Painter on 21/09/2025.
//

/// Extract a range from a complex array.
/// - Parameters:
///   - x: The array.
///   - range:Index range.
///   - by: The index step size.
/// - Returns: The sub array.
public func slice(_ x: SplitComplexArray, _ range: Range<Int>, _ by: Int = 1) -> SplitComplexArray {
    validateSize(x)
    if by == 1 {
        return SplitComplexArray(Array(x.real[range]), Array(x.imag[range]))
    } else {
        let indexRange = stride(from: range.lowerBound, to: range.upperBound, by: by)
        let real = indexRange.map { x.real[$0] }
        let imag = indexRange.map { x.imag[$0] }
        return SplitComplexArray(real, imag)
    }
}

/// Extract a closed range from a complex array.
/// - Parameters:
///   - x: The array.
///   - range:Index range.
///   - by: The index step size.
/// - Returns: The sub array.
public func slice(_ x: SplitComplexArray, _ range: ClosedRange<Int>, _ by: Int = 1) -> SplitComplexArray {
    validateSize(x)
    if by == 1 {
        return SplitComplexArray(Array(x.real[range]), Array(x.imag[range]))
    } else {
        let indexRange = stride(from: range.lowerBound, to: range.upperBound, by: by)
        let real = indexRange.map { x.real[$0] }
        let imag = indexRange.map { x.imag[$0] }
        return SplitComplexArray(real, imag)
    }
}
