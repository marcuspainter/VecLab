//
//  File.swift
//  
//
//  Created by Marcus Painter on 29/08/2024.
//

import Accelerate
import Foundation
import simd

///  Fractional part of number.
/// - Parameter x: Input array.
/// - Returns: The fractional part array.
public func frac(_ x: Real) -> Real {
    let absx = abs(x)
    return sign(x) * (absx - floor(absx))
}

///  Fractional part of number.
/// - Parameter x: Input array.
/// - Returns: The fractional part array.
public func frac(_ x: RealArray) -> RealArray {
    //var c = x
    //vectorFrac(x, &c)
    // vDSP uses truncate for fractional part !!!
    let c = vDSP.trunc(x)
    return c
}

func vectorFrac(_ x: [Double],_ c: inout [Double]) {
    vDSP_vfracD(x, 1, &c, 1, vDSP_Length(x.count))
}

func vectorFrac(_ x: [Float],_ c: inout [Float]) {
    vDSP_vfrac(x, 1, &c, 1, vDSP_Length(x.count))
}
