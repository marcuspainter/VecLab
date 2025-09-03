//
//  blackman.swift
//
//
//  Created by Marcus Painter on 09/09/2023.
//

// https://uk.mathworks.com/help/matlab/ref/blackman.html

import Foundation

/// Blackman window.
/// - Parameters:
///   - L: Window length.
///   - type: Window sampling type.
/// - Returns: Blackman window, returned as a vector.
public func blackman(_ L: Int, type: WindowType = .symmetric) -> RealArray {
    guard L > 0 else { return [] }

    let a0: Real = 0.42
    let a1: Real = 0.5
    let a2: Real = 0.08

    let denominator = (type == .symmetric) ? (L - 1) : (L)
    let piDen = .pi / Real(denominator)
    let s1 = 2 * piDen
    let s2 = 4 * piDen

    return (0..<L).map { n in
        let k = Real(n)
        return a0 - a1 * cos(s1 * k) + a2 * cos(s2 * k)
    }
}
