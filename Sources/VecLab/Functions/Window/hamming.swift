//
//  hamming.swift
//  
//
//  Created by Marcus Painter on 09/09/2023.
//

// Reference:
// https://uk.mathworks.com/help/signal/ref/hamming.html

import Foundation

/// Hamming window
/// - Parameters:
///   - L: Window length.
///   - type: Window sampling type.
/// - Returns: Hamming window, returned as a vector.
public func hamming(_ L: Int, type: WindowType = .symmetric) -> RealDoubleArray {
    guard L > 0 else { return [] }

    let a0: Double = 0.54
    let a1: Double = 0.46

    let denominator = (type == .symmetric) ? (L - 1) : (L)
    let piDen = Double.pi / Double(denominator)
    let s1 = 2 * piDen

    return (0..<L).map { n in
        let k = Double(n)
        return a0 - a1 * cos(s1 * k)
    }
}
