//
//  fix.swift
//  
//
//  Created by Marcus Painter on 12/09/2023.
//

import Foundation

/// Round towards zero.
/// - Parameter x: Input array.
/// - Returns: The rounded array.
public func fix(_ x: Real) -> Real {
    return trunc(x)
}

/// Round towards zero.
/// - Parameter x: Input array.
/// - Returns: The rounded array.
public func fix(_ x: RealArray) -> RealArray {
    return x.map { fix($0) }
}
