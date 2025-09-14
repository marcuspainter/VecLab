//
//  dftr.swift
//
//
//  Created by Marcus Painter on 04/04/2024.
//

import Accelerate
import Foundation

/// DFT of real array.
/// - Parameter x: Real array.
/// - Returns: Complex array result.
public func dftr(_ x: RealArray) -> SplitComplexArray {
    let n = length(x)
    if n == 1 {
        return SplitComplexArray(x, [Real(0)])
    }

    var y = SplitComplexArray(count: x.count)
    let k = vector(0..<n)
    let omega = -2 * Real.pi * Real.i * k / Real(n)
    for i in 0..<x.count {
        let w = exp(omega * Real(i))
        y[i] = sum(x * w)
    }
    return y
}
