//
//  idftr.swift
//
//
//  Created by Marcus Painter on 04/04/2024.
//

import Foundation

/// Inverse DFT of complex array with real result.
/// - Parameter x: Complex array.
/// - Returns: Real array result.
public func idftr(_ x: ComplexArray) -> RealArray {
    assertSameSize(x)
    let n = length(x)

    // Init by copy
    var y = x
    let k = RealArray(0 ..< n)
    let omega = 2 * Real.pi * Real.i * k / Real(n)
    for i in 0 ..< x.0.count {
        let w = exp(omega * Real(i))
        (y.0[i], y.1[i]) = sum(x * w)
    }
    return y.0 / Real(n)
}
