//
//  db2pow.swift
//
//
//  Created by Marcus Painter on 09/09/2023.
//

import Accelerate
import Foundation

// VECTORIZED

/// Convert decibels (dB) to power.
/// - Parameter db: Value in decibels.
/// - Returns: The power value.
public func db2pow(_ db: RealDouble) -> RealDouble {
    return pow(10.0, db / 10.0)
}

/// Convert decibels (dB) to power for a real array.
/// - Parameter db: Value in decibels.
/// - Returns: The power value.
public func db2pow(_ db: RealDoubleArray) -> RealDoubleArray {
    var result = [Double](repeating: 0, count: db.count)
    let scaleFactor = Double(log(10.0) / 10.0)
    result = vDSP.multiply(scaleFactor, db)
    return vForce.exp(result)
}
