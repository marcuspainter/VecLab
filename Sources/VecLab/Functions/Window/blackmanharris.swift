//
//  blackmanharris.swift
//
//
//  Created by Marcus Painter on 12/09/2023.
//

import Foundation

/// Minimum four-term Blackman-Harris window.
///
/// - Parameters:
///   - L: Window length.
///   - type: Window sampling type.
/// - Returns: Blackman-Harris window, returned as an array.
public func blackmanharris(_ L: Int, type: WindowType = .symmetric) -> RealArray {
    guard L > 0 else { return [] }

    let a0: Real = 0.35875
    let a1: Real = 0.48829
    let a2: Real = 0.14128
    let a3: Real = 0.01168

    let denominator = (type == .symmetric) ? (L - 1) : (L)
    let piDen = Real.pi / Real(denominator)
    let s1 = 2 * piDen
    let s2 = 4 * piDen
    let s3 = 6 * piDen

    return (0..<L).map { n in
        let k = Real(n)
        // Too complicated to type check
        var t = a0
        t += -a1 * cos(s1 * k)
        t += +a2 * cos(s2 * k)
        t += -a3 * cos(s3 * k)

        return t
    }
}
