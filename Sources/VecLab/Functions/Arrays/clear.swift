//
//  clear.swift
//
//
//  Created by Marcus Painter on 28/08/2024.
//

import Foundation

/// Fills a real array with zeros in place.
/// - Parameters:
///   - c: Array.
public func clear(_ c: RealArray) {
    vectorClearRealArray(c)
}

/// Fills a complex array with zeros in place.
/// - Parameters:
///   - c: Array.
public func clear(_ c: ComplexArray) {
    vectorClearComplexArray(c)
}
