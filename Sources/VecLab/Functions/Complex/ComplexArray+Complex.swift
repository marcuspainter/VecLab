//
//  ComplexArray+Complex.swift
//  VecLab
//
//  Created by Marcus Painter on 21/09/2025.
//

/// Magnitudes  of a complex array.
///
/// - Parameter x:Complex array.
/// - Returns: Real array of  magnitudes.
public func abs(_ x: [Complex]) -> [Real] {
    return x.map { abs($0) }
}

/// Phase angles of a complex array.
/// - Parameter x:Complex array.
/// - Returns: The phase angles in radians.
public func angle(_ x: [Complex]) -> RealArray {
    return x.map { angle($0) }
}
