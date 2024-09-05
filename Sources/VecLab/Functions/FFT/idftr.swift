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
public func idftr(_ x: ComplexDoubleArray) -> RealDoubleArray {
    let n = length(x)
    
    // Init by copy
    var y = x
    let k = RealDoubleArray(0 ..< n)
    let omega = 2 * Double.pi * Double.i * k / Double(n)
    for i in 0 ..< x.0.count {
        let w = exp(omega * Double(i))
        (y.0[i], y.1[i]) = sum(x * w)
    }
    return y.0 / Double(n)
}


/// Inverse DFT of complex array with real result.
/// - Parameter x: Complex array.
/// - Returns: Real array result.
public func idftr(_ x: ComplexFloatArray) -> RealFloatArray {
    let n = length(x)
    
    // Init by copy
    var y = x
    let k = RealFloatArray(0 ..< n)
    let omega = 2 * Float.pi * Float.i * k / Float(n)
    for i in 0 ..< x.0.count {
        let w = exp(omega * Float(i))
        (y.0[i], y.1[i]) = sum(x * w)
    }
    return y.0 / Float(n)
}
