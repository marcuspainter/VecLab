//
//  pow2db.swift
//  
//
//  Created by Marcus Painter on 09/09/2023.
//

import Foundation
import Accelerate

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
    // return mag.map { pow2db($0) }
    var db = RealArray(repeating: 0, count: pow.count)
    vDSP.convert(power: pow, toDecibels: &db, zeroReference: 1.0)
    return db
}
