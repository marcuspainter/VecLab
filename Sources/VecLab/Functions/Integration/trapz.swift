//
//  trapz.swift
//  
//
//  Created by Marcus Painter on 18/09/2023.
//

import Foundation
import Accelerate

/// Trapezoidal numerical integration.
/// - Parameters:
///   - x: x-coordinates.
///   - y: y-coordinates.
/// - Returns: Integrates `y` with respect to the coordinates or scalar spacing specified by `x`.
public func trapz(_ x: RealArray, _ y: RealArray) -> Real {
    guard x.count == y.count else {
        fatalError("X and Y must have the same length")
    }

    var Q = Real(0.0)
    for i in 1..<x.count {
        let dx = x[i] - x[i-1]
        let avgY = (y[i] + y[i-1]) / 2
        Q += dx * avgY
    }

    return Q
}
