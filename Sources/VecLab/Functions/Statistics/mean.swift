//
//  mean.swift
//  
//
//  Created by Marcus Painter on 11/09/2023.
//

import Foundation
import Accelerate

// VECTORIZED

/// Average (mean) value of an array.
///
/// - Parameter x: Input array of real numbers.
/// - Returns: The mean value of the array.
public func mean(_ x: RealDoubleArray) -> RealDouble {
    return vDSP.mean(x)
}

/// Average (mean) value of an array.
///
/// - Parameter x: Input array of real numbers.
/// - Returns: The mean value of the array.
public func mean(_ x: RealFloatArray) -> RealFloat {
    return vDSP.mean(x)
}
