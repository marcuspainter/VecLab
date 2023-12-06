//
//  floor.swift
//  
//
//  Created by Marcus Painter on 09/09/2023.
//

import Foundation

/// Round towards negative infinity
/// - Parameter x: Input array.
/// - Returns: The rounded array.
public func floor(_ x: RealArray) -> RealArray {
    return x.map { floor($0) }
}
