//
//  f2d.swift
//
//
//  Created by Marcus Painter on 26/08/2024.
//

import Accelerate
import Foundation

/// Converts a single-precision vector to a double-precision vector.
/// - Parameter f: The input vector.
/// - Returns: The output vector.
public func f2d(_ f: [Float]) -> [Double] {
    var d = [Double](repeating: 0, count: f.count)
    vDSP_vspdp(f, 1, &d, 1, vDSP_Length(d.count))
    return d
}
