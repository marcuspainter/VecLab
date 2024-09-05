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
public func fix(_ x: RealDouble) -> RealDouble {
    return trunc(x)
}

/// Round towards zero.
/// - Parameter x: Input array.
/// - Returns: The rounded array.
public func fix(_ x: RealDoubleArray) -> RealDoubleArray {
    return x.map { fix($0) }
}
