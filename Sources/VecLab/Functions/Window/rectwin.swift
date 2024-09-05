//
//  rectwin.swift
//  
//
//  Created by Marcus Painter on 12/09/2023.
//

import Foundation

/// Rectangular window.
/// - Parameters:
///   - L: Window length.
/// - Returns: Rectangular window, returned as a vector.
public func rectwin(_ L: Int) -> RealDoubleArray {
    guard L > 0 else { return [] }
    return [Double](repeating: 1, count: L)
}
