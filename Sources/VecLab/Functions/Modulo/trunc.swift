//
//  trunc.swift
//  
//
//  Created by Marcus Painter on 12/09/2023.
//

import Foundation

/// Round towards zero (equivalent of fix).
///
///  Swift equivalent of ``fix(_:)``.
/// - Parameter x: Input array.
/// - Returns: The rounded array.
public func trunc(_ x: RealArray) -> RealArray {
    return x.map { trunc($0) }
}
