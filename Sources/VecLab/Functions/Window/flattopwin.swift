//
//  flattopwin.swift
//
//
//  Created by Marcus Painter on 09/09/2023.
//

// Reference:
// https://uk.mathworks.com/help/signal/ref/flattopwin.html

import Foundation

/// Flat top window.
/// - Parameters:
///   - L: Window length.
///   - type: Window sampling type.
/// - Returns: Flat top window, returned as a vector.
public func flattopwin(_ L: Int, type: WindowType = .symmetric) -> RealArray {
    guard L > 0 else { return [] }

    let a0: Real = 0.21557895
    let a1: Real = 0.41663158
    let a2: Real = 0.277263158
    let a3: Real = 0.083578947
    let a4: Real = 0.006947368

    let denominator = (type == .symmetric) ? (L - 1) : (L)
    let piDen = Real.pi / Real(denominator)
    let s1 = 2 * piDen
    let s2 = 4 * piDen
    let s3 = 6 * piDen
    let s4 = 8 * piDen

    return (0..<L).map { n in
        let k = Real(n)
        // Too complicated to type check
        var t = a0
        t += -a1 * cos(s1 * k)
        t += +a2 * cos(s2 * k)
        t += -a3 * cos(s3 * k)
        t += +a4 * cos(s4 * k)

        return t
    }
}
