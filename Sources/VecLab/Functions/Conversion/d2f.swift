//
//  d2f.swift
//
//
//  Created by Marcus Painter on 26/08/2024.
//

import Accelerate
import Foundation

/// Converts a double-precision vector to a single-precision vector.
/// - Parameter d: The input vector.
/// - Returns: The output vector.
public func d2f(_ d: [Double]) -> [Float] {
    var f = [Float](repeating: 0, count: d.count)
    vDSP_vdpsp(d, 1, &f, 1, vDSP_Length(d.count))
    return f
}
