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
    validateSize(x)
    let n = length(x)

    // Init by copy
    var y = x
    let k = vector(0..<n)
    let omega = 2 * Real.pi * Real.i * k / Real(n)
    for k in 0..<x.count {
        let w = exp(omega * Real(k))
        y[k] = sum(x * w)
    }
    return y.real / Real(n)
}
