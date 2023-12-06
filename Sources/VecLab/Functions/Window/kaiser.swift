//
//  kaiser.swift
//  
//
//  Created by Marcus Painter on 12/09/2023.
//

// Reference:
// https://uk.mathworks.com/help/signal/ref/kaiser.html

import Foundation

/// Kaiser window.
/// - Parameters:
///   - L: Window length.
///   - beta: Controls the trade-off between the main-lobe width and sidelobe level.
/// - Returns: Kaiser window, returned as an array of real numbers.
public func kaiser(_ L: Int, beta: Real = 0.5) -> RealArray {
    guard L > 1 else { return [1.0] } // Single-point window

    let M = Real(L - 1)
    let i0Beta = besseli0(beta) // Compute once for normalization

    return (0..<L).map { n in
        let x = (2.0 * Real(n) / M) - 1.0 // Map n to the range [-1, 1]
        return besseli0(beta * sqrt(1 - x * x)) / i0Beta
    }
}
