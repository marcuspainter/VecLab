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
public func abs(_ x: RealArray) -> RealArray {
    return vDSP.absolute(x)
}
