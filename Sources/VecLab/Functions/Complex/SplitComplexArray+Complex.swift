//
//  SplitComplexArray+Complex.swift
//  VecLab
//
//  Created by Marcus Painter on 21/09/2025.
//

/// Magnitudes  of a complex array.
///
/// - Parameter x: Split Complex array.
/// - Returns: Real array of  magnitudes.
public func abs(_ x: SplitComplexArray) -> RealArray {
    validateSize(x)
    return vectorAbsSplitComplexArray(x)
}

/// Phase angles of a complex array.
/// - Parameter x:Complex array.
/// - Returns: The phase angles in radians.
public func angle(_ x: SplitComplexArray) -> RealArray {
    validateSize(x)
    return vectorAngleSplitComplexArray(x)
}
