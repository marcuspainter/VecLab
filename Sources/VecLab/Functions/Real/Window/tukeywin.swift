//
//  tukeywin.swift
//
//
//  Created by Marcus Painter on 10/03/2024.
//

import Foundation

/// Tukey window.
///
///  r = 0, rectangular window
///  r = 0.5, default
///  r = 1.0, Hann window
/// - Parameters:
///   - L: Window length.
///   - r: Cosine fraction parameter, default 0.5.
/// - Returns: Tukey window, returned as a vector.
public func tukeywin(_ L: Int, r: Real = 0.5) -> RealArray {
    guard L > 0 else {
        return []
    }

    var window = [Real](repeating: 0.0, count: L)

    for n in 0..<L {
        let x = Real(n) / Real(L - 1)

        if x < r / 2.0 {
            let term = 0.5 * (1.0 + cos(Real.pi * ((2.0 * x / r) - 1.0)))
            window[n] = term
        } else if x < 1.0 - r / 2.0 {
            window[n] = 1.0
        } else {
            let term = 0.5 * (1.0 + cos(Real.pi * ((2.0 * x / r) - (2.0 / r) + 1.0)))
            window[n] = term
        }
    }
    return window
}
