//
//  min.swift
//  
//
//  Created by Marcus Painter on 09/09/2023.
//

import Foundation
import Accelerate

// VECTORIZED

/// Minimum value of an array.
///
/// - Parameter x: Input array of real numbers.
/// - Returns: The minimum value present in the array.
public func min(_ x: RealDoubleArray) -> RealDouble {
    return vDSP.minimum(x)
}

/// Minimum value of an array.
///
/// - Parameter x: Input array of real numbers.
/// - Returns: The minimum value present in the array.
public func min(_ x: RealFloatArray) -> RealFloat {
    return vDSP.minimum(x)
}
