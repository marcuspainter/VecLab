//
//  hann.swift
//  
//
//  Created by Marcus Painter on 09/09/2023.
//

// Reference:
// https://uk.mathworks.com/help/signal/ref/hann.html

import Foundation

/// Hann (Hanning) window.
/// - Parameters:
///   - L: Window length.
///   - type: Window sampling type.
/// - Returns: Hann window, returned as a vector.
public func hann(_ L: Int, type: WindowType = .symmetric) -> RealArray {
    guard L > 0 else { return [] }

    let a0: Real = 0.5
    let a1: Real = 0.5

    let denominator = (type == .symmetric) ? (L - 1) : (L)
    let piDen = .pi / Real(denominator)
    let s1 = 2 * piDen

    return (0..<L).map { n in
        let k = Real(n)
        return a0 - a1 * cos(s1 * k)
    }
}
