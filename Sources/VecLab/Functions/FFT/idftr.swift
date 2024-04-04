//
//  File.swift
//  
//
//  Created by Marcus Painter on 04/04/2024.
//

import Foundation

/// Inverse DFT of complex array with real result.
/// - Parameter x: Complex array.
/// - Returns: Real array result.
public func idftr(_ x: ComplexArray) -> RealArray {
    let n = length(x)
    if n == 1 {
        return []
    }

    // Init by copy
    var y = x
    let q = RealArray(0 ..< n)
    let omega = 2 * Real.pi * Real.i * q / Real(n)
    for p in 0 ..< x.0.count {
        let w = exp(omega * Real(p))
        (y.0[p], y.1[p]) = sum(x * w)
    }
    return y.0 / Real(n)
}
