//
//  File.swift
//  
//
//  Created by Marcus Painter on 04/04/2024.
//

import Foundation

/// DFT of real array.
/// - Parameter x: Real array.
/// - Returns: Complex array result.
public func dftr(_ x: RealArray) -> ComplexArray {
    let n = length(x)
    if n == 1 {
        return (x, [Real(0)])
    }

    var y = complex(sized: x)
    let q = RealArray(0..<n)
    let omega = -2 * Real.pi * Real.i * q  / Real(n)
    for p in 0..<x.count {
        let w = exp(omega * Real(p))
        (y.0[p], y.1[p]) = sum(x * w)
    }
    return y
}
