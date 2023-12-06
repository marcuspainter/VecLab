//
//  mag2db.swift
//  
//
//  Created by Marcus Painter on 09/09/2023.
//

import Foundation
import Accelerate

// VECTORIZED

/// Convert magnitude to decibels (dB).
/// - Parameter mag: Magnitude value.
/// - Returns: Value in decibels.
public func mag2db(_ mag: Real) -> Real {
    return 20 * log10(mag)
}

/// Convert magnitude to decibels (dB) for a real array.
/// - Parameter mag: Magnitude values.
/// - Returns: Values in decibels.
public func mag2db(_ mag: RealArray) -> RealArray {
    // return mag.map { mag2db($0) }
    var db = RealArray(repeating: 0, count: mag.count)
    vDSP.convert(amplitude: mag, toDecibels: &db, zeroReference: 1.0)
    return db
}
