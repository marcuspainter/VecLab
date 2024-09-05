//
//  dft.swift
//  
//
//  Created by Marcus Painter on 15/09/2023.
//

import Foundation

// MARK: Classic DFT

/// DFT of complex array.
/// - Parameter x: Complex array.
/// - Returns: Complex array result.
public func dft(_ x: ComplexDoubleArray) -> ComplexDoubleArray {
    let n = length(x)
    if n == 1 {
        return x
    }

    // Init by copy
    var y = x
    let q = RealDoubleArray(0..<n)
    let omega = -2 * Double.pi * Double.i * q  / Double(n)
    for p in 0..<x.0.count {
        let w = exp(omega * Double(p))
        (y.0[p], y.1[p]) = sum(x * w)
    }
    return y
}

/// DFT of complex array.
/// - Parameter x: Complex array.
/// - Returns: Complex array result.
public func dft(_ x: ComplexFloatArray) -> ComplexFloatArray {
    let n = length(x)
    if n == 1 {
        return x
    }

    // Init by copy
    var y = x
    let q = RealFloatArray(0..<n)
    let omega = -2 * Float.pi * Float.i * q  / Float(n)
    for p in 0..<x.0.count {
        let w = exp(omega * Float(p))
        (y.0[p], y.1[p]) = sum(x * w)
    }
    return y
}
