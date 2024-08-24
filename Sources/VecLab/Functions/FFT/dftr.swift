//
//  File.swift
//  
//
//  Created by Marcus Painter on 04/04/2024.
//

import Foundation
import Accelerate

/// DFT of real array.
/// - Parameter x: Real array.
/// - Returns: Complex array result.
public func dftr(_ x: RealArray) -> ComplexArray {
    let n = length(x)
    if n == 1 {
        return (x, [Real(0)])
    }

    var y = complex(sized: x)
    let k = RealArray(0..<n)
    let omega = -2 * Real.pi * Real.i * k  / Real(n)
    for i in 0..<x.count {
        let w = exp(omega * Real(i))
        (y.0[i], y.1[i]) = sum(x * w)
    }
    return y
}

