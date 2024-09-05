//
//  ceil.swift
//  
//
//  Created by Marcus Painter on 09/09/2023.
//

import Foundation
import Accelerate

/// Round towards positive infinity.
/// - Parameter x: Input array.
/// - Returns: The rounded array.
public func ceil(_ x: RealDoubleArray) -> RealDoubleArray {
    return x.map { ceil($0) }
}

/// Round towards positive infinity.
/// - Parameter x: Input array.
/// - Returns: The rounded array.
public func ceil(_ x: RealFloatArray) -> RealFloatArray {
    return x.map { ceil($0) }
}
