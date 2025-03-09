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
public func db2mag(_ db: Real) -> Real {
    return pow(10, db / 20.0)
}

/// Convert decibels (dB) to magnitude.
/// - Parameter db: Value in decibels.
/// - Returns: The magnitude value.
public func db2mag(_ db: RealArray) -> RealArray {
    let scaleFactor = Real(log(10.0) / 20.0)
    let result = vDSP.multiply(scaleFactor, db)
    return vForce.exp(result)
}
