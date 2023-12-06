//
//  round.swift
//
//
//  Created by Marcus Painter on 12/09/2023.
//

import Foundation

/// Round number to nearest integer.
/// - Parameter x: Input array.
/// - Returns: The rounded array.
public func round(_ x: RealArray) -> RealArray {
    return x.map { round($0) }
}
