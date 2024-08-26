//
//  File.swift
//  
//
//  Created by Marcus Painter on 26/08/2024.
//

import Accelerate
import Foundation

/// Converts a single-precision vector to a double-precision vector.
/// - Parameter d: The input vector.
/// - Returns: The output vector.
public func f2d(_ f: [Float]) -> [Double] {
    var d = [Double](repeating: 0, count: f.count)
    vDSP_vspdp(f, 1, &d, 1, vDSP_Length(d.count))
    return d
}

/// Converts a single-precision complex vector to a double-precision complex vector.
/// - Parameter d: The input vector.
/// - Returns: The output vector.
public func f2d(_ f: ([Float],[Float])) -> ([Double], [Double]) {
    let n = f.0.count
    var d0 = [Double](repeating: 0, count: n)
    var d1 = d0
    vDSP_vspdp(f.0, 1, &d0, 1, vDSP_Length(n))
    vDSP_vspdp(f.1, 1, &d1, 1, vDSP_Length(n))
    return (d0, d1)
}
