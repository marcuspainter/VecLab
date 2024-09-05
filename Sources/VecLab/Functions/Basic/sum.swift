//
//  sum.swift
//
//
//  Created by Marcus Painter on 09/09/2023.
//

import Accelerate
import Foundation

// VECTORIZED

/// Sum of array.
/// - Parameter x: Input array.
/// - Returns: The sum of the array.
public func sum(_ x: RealDoubleArray) -> RealDouble {
    return vDSP.sum(x)
}

/// Sum of a complex array.
/// - Parameter x: Complex array.
/// - Returns: The sum of the array.
public func sum(_ x: ComplexDoubleArray) -> ComplexDouble {
    return (vDSP.sum(x.0), vDSP.sum(x.1))
}

// MARK: Float

/// Sum of array.
/// - Parameter x: Input array.
/// - Returns: The sum of the array.
public func sum(_ x: RealFloatArray) -> RealFloat {
    return vDSP.sum(x)
}

/// Sum of a complex array.
/// - Parameter x: Complex array.
/// - Returns: The sum of the array.
public func sum(_ x: ComplexFloatArray) -> ComplexFloat {
    return (vDSP.sum(x.0), vDSP.sum(x.1))
}

