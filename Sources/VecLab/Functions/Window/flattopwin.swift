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
public func flattopwin(_ L: Int, type: WindowType = .symmetric) -> RealDoubleArray {
    guard L > 0 else { return [] }

    let a0: Double = 0.21557895
    let a1: Double = 0.41663158
    let a2: Double = 0.277263158
    let a3: Double = 0.083578947
    let a4: Double = 0.006947368

    let denominator = (type == .symmetric) ? (L - 1) : (L)
    let piDen = Double.pi / Double(denominator)
    let s1 = 2 * piDen
    let s2 = 4 * piDen
    let s3 = 6 * piDen
    let s4 = 8 * piDen

    return (0..<L).map { n in
        let k = Double(n)
        // Too complicated to type check
        var t = a0
        t += -a1 * cos(s1 * k)
        t += +a2 * cos(s2 * k)
        t += -a3 * cos(s3 * k)
        t += +a4 * cos(s4 * k)

        return t
    }
}
