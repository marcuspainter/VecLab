//
//  idft.swift
//
//
//  Created by Marcus Painter on 15/09/2023.
//

import Foundation

/// Inverse DFT of complex array.
/// - Parameter x:Complex array.
/// - Returns: Complex array result.
public func idft(_ x: ComplexArray) -> ComplexArray {
    assertSameSize(x)
    let n = length(x)
    if n == 1 {
        return x
    }

    // Init by copy
    var y = x
    let q = RealArray(0 ..< n)
    let omega = 2 * Real.pi * Real.i * q / Real(n)
    for p in 0 ..< x.0.count {
        let w = exp(omega * Real(p))
        (y.0[p], y.1[p]) = sum(x * w)
    }
    return y / Real(n)
}
