//
//  ceil.swift
//
//
//  Created by Marcus Painter on 09/09/2023.
//

import Accelerate
import Foundation

/// Round towards positive infinity.
/// - Parameter x: Input array.
/// - Returns: The rounded array.
public func ceil(_ x: RealArray) -> RealArray {
    return vForce.ceil(x)
}
