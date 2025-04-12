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

/// Converts a single-precision complex vector to a double-precision complex vector.
/// - Parameter f: The input vector.
/// - Returns: The output vector.
public func f2d(_ f: ComplexFloatArray) -> ComplexDoubleArray {
    let n = f.count
    var d0 = [Double](repeating: 0, count: n)
    var d1 = d0
    vDSP_vspdp(f.real, 1, &d0, 1, vDSP_Length(n))
    vDSP_vspdp(f.imag, 1, &d1, 1, vDSP_Length(n))
    return ComplexDoubleArray(d0, d1)
}
