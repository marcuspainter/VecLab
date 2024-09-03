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

/// Converts a double-precision complex vector to a single-precision complex vector.
/// - Parameter d: The input vector.
/// - Returns: The output vector.
public func d2f(_ d: ([Double], [Double])) -> ([Float], [Float]) {
    let n = d.0.count
    var f0 = [Float](repeating: 0, count: n)
    var f1 = f0
    vDSP_vdpsp(d.0, 1, &f0, 1, vDSP_Length(n))
    vDSP_vdpsp(d.1, 1, &f1, 1, vDSP_Length(n))
    return (f0, f1)
}
