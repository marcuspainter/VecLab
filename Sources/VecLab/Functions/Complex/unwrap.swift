//
//  unwrap.swift
//
//
//  Created by Marcus Painter on 08/09/2023.
//

import Foundation

/// Unwrap phase angles.
///
/// Unwraps radian phase angles. Whenever the jump between consecutive angles is greater than
/// or equal to π radians, unwrap shifts the angles by adding multiples of ±2π until the jump is less than π.
///
/// - Parameters:
///   - phase: Phase angles in radians.
///   - tol: Tolerance.
/// - Returns: The unwrapped phase.
public func unwrap(_ phase: RealArray, tol: Real = .pi) -> RealArray {
    guard !phase.isEmpty else { return [] }

    var unwrapped = [Real](repeating: 0.0, count: phase.count)
    unwrapped[0] = phase[0]

    for i in 1..<phase.count {
        var delta = phase[i] - phase[i - 1]

        if abs(delta) > tol {
            delta = mod(delta + tol, 2 * tol) - tol
        }

        unwrapped[i] = unwrapped[i - 1] + delta
    }

    return unwrapped
}

/*
 func unwrap2(_ phase: RealArray) -> RealArray {
     var unwrapped = phase
     var previousValue = phase[0]
     for i in 1..<phase.count {
         var delta = phase[i] - previousValue
         while delta > .pi {
             delta -= 2 * .pi
         }
         while delta < -.pi {
             delta += 2 * .pi
         }
         unwrapped[i] = unwrapped[i - 1] + delta
         previousValue = phase[i]
     }
     return unwrapped
 }
 */
