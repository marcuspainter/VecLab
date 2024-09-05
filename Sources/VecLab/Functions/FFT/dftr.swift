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
public func dftr(_ x: RealDoubleArray) -> ComplexDoubleArray {
    let n = length(x)
    if n == 1 {
        return (x, [Double(0)])
    }

    var y = (x, x)
    let k = RealDoubleArray(0..<n)
    let omega = -2 * Double.pi * Double.i * k  / Double(n)
    for i in 0..<x.count {
        let w = exp(omega * Double(i))
        (y.0[i], y.1[i]) = sum(x * w)
    }
    return y
}

/// DFT of real array.
/// - Parameter x: Real array.
/// - Returns: Complex array result.
public func dftr(_ x: RealFloatArray) -> ComplexFloatArray {
    let n = length(x)
    if n == 1 {
        return (x, [Float(0)])
    }

    var y = (x,x)
    let k = RealFloatArray(0..<n)
    let omega = -2 * Float.pi * Float.i * k  / Float(n)
    for i in 0..<x.count {
        let w = exp(omega * Float(i))
        (y.0[i], y.1[i]) = sum(x * w)
    }
    return y
}
