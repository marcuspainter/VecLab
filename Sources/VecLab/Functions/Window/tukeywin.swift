//
//  File.swift
//
//
//  Created by Marcus Painter on 10/03/2024.
//

import Foundation

/// Tukey window.
/// - Parameters:
///   - L: Window length.
///  - alpha: Alpha parameter.
/// - Returns: Tuckey window, returned as a vector.
func tukeywin(_ L: Int, alpha r: Double) -> RealArray {
    guard L > 0 else {
        return []
    }

    var window = RealArray(repeating: 0.0, count: L)

    for n in 0 ..< L {
        let x = Real(n) / Real(L - 1)

        if x < r / 2.0 {
            let term = 0.5 * (1.0 + cos(.pi * ((2.0 * x / r) - 1.0)))
            window[n] = term
        } else if x < 1.0 - r / 2.0 {
            window[n] = 1.0
        } else {
            let term = 0.5 * (1.0 + cos(.pi * ((2.0 * x / r) - (2.0 / r) + 1.0)))
            window[n] = term
        }
    }
    return window
}
