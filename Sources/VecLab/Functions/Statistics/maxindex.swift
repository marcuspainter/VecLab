//
//  File.swift
//  
//
//  Created by Marcus Painter on 05/04/2024.
//

import Foundation
import Accelerate

/// Maximum value and index in an array.
///
/// - Parameter x: Input array of real numbers.
/// - Returns: A tuple  `(value:,index:)`where the first component represents the maximum value and the second component indicates its position in the array.
public func maxindex(_ x: RealDoubleArray) -> (value: RealDouble, index: Int) {
    // Note order: Returns (UInt, Real)
    let (index, value) = vDSP.indexOfMaximum(x)
    // Swap order for Matlab
    return (RealDouble(value), Int(index))
}

/// Maximum value and index in an array.
///
/// - Parameter x: Input array of real numbers.
/// - Returns: A tuple  `(value:,index:)`where the first component represents the maximum value and the second component indicates its position in the array.
public func maxindex(_ x: RealFloatArray) -> (value: RealFloat, index: Int) {
    // Note order: Returns (UInt, Real)
    let (index, value) = vDSP.indexOfMaximum(x)
    // Swap order for Matlab
    return (RealFloat(value), Int(index))
}

