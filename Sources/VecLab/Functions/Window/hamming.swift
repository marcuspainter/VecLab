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
public func hamming(_ L: Int, type: WindowType = .symmetric) -> RealArray {
    guard L > 0 else { return [] }

    let a0: Real = 0.54
    let a1: Real = 0.46

    let denominator = (type == .symmetric) ? (L - 1) : (L)
    let piDen = .pi / Real(denominator)
    let s1 = 2 * piDen

    return (0..<L).map { n in
        let k = Real(n)
        return a0 - a1 * cos(s1 * k)
    }
}
