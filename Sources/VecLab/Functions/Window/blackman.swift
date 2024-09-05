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
public func blackman(_ L: Int, type: WindowType = .symmetric) -> RealDoubleArray {
    guard L > 0 else { return [] }

    let a0: Double = 0.42
    let a1: Double = 0.5
    let a2: Double = 0.08

    let denominator = (type == .symmetric) ? (L - 1) : (L)
    let piDen = .pi / Double(denominator)
    let s1 = 2 * piDen
    let s2 = 4 * piDen

    return (0..<L).map { n in
        let k = Double(n)
       return a0 - a1 * cos(s1 * k) + a2 * cos(s2 * k)
    }
}
