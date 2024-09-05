//
//  db2mag.swift
//  
//
//  Created by Marcus Painter on 09/09/2023.
//

import Foundation
import Accelerate

// VECTORIZED

/// Convert decibels (dB) to magnitude.
/// - Parameter db: Value in decibels.
/// - Returns: The magnitude value.
public func db2mag(_ db: RealDouble) -> RealDouble {
    return pow(10.0, db / 20.0)
}

/// Convert decibels (dB) to magnitude.
/// - Parameter db: Value in decibels.
/// - Returns: The magnitude value.
public func db2mag(_ db: RealDoubleArray) -> RealDoubleArray {
    var result = [Double](repeating: 0, count: db.count)
    let scaleFactor = Double(log(10.0) / 20.0)
    result = vDSP.multiply(scaleFactor, db)
    return vForce.exp(result)
}
