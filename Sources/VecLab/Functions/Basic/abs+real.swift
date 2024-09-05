//
//  abs+real.swift
//
//
//  Created by Marcus Painter on 16/09/2023.
//

import Accelerate
import Foundation

/// Absolute values of real array.
///
/// - Parameter x:Real array.
/// - Returns: Absolute values.
public func abs(_ x: RealDoubleArray) -> RealDoubleArray {
    return vDSP.absolute(x)
}

/// Absolute values of real array.
///
/// - Parameter x:Real array.
/// - Returns: Absolute values.
public func abs(_ x: RealFloatArray) -> RealFloatArray {
    return vDSP.absolute(x)
}
