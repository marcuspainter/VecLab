//
//  File.swift
//  
//
//  Created by Marcus Painter on 05/04/2024.
//

import Foundation
import Accelerate

/// Minimum value and index in an array.
///
/// - Parameter x: Input array of real numbers.
/// - Returns: A tuple  `(value:index:)`where the first component represents the minimum value and the second component indicates its position in the array.
public func minindex(_ x: RealDoubleArray) -> (value: RealDouble, index: Int) {
    // Note order: Returns (UInt, Real)
    let (index, value) = vDSP.indexOfMinimum(x)
    // Swap order for Matlab
    return (RealDouble(value), Int(index))
}

/// Minimum value and index in an array.
///
/// - Parameter x: Input array of real numbers.
/// - Returns: A tuple  `(value:index:)`where the first component represents the minimum value and the second component indicates its position in the array.
public func minindex(_ x: RealFloatArray) -> (value: RealFloat, index: Int) {
    // Note order: Returns (UInt, Real)
    let (index, value) = vDSP.indexOfMinimum(x)
    // Swap order for Matlab
    return (RealFloat(value), Int(index))
}
