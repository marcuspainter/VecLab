//
//  pow2db.swift
//
//
//  Created by Marcus Painter on 09/09/2023.
//

import Accelerate
import Foundation

// VECTORIZED

/// Power to decibels (dB).
/// - Parameter pow: Power value.
/// - Returns: Value in decibels.
public func pow2db(_ pow: Real) -> Real {
    return 10 * log10(pow)
}

/// Power to decibels (dB) for a real array.
/// - Parameter pow: Power array.
/// - Returns: Value in decibels.
public func pow2db(_ pow: RealArray) -> RealArray {
    return vDSP.powerToDecibels(pow, zeroReference: 1.0)
}
