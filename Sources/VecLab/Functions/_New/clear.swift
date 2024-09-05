//
//  clear.swift
//
//
//  Created by Marcus Painter on 28/08/2024.
//

import Accelerate
import Foundation

/// Fills a real array with zeros in place.
/// - Parameters:
///   - c: Array.
public func clear(_ c: RealDoubleArray) {
    vectorClearRealArray(c)
}

/// Fills a complex array with zeros in place.
/// - Parameters:
///   - c: Array.
public func clear(_ c: ComplexDoubleArray) {
    vectorClearComplexArray(c)
}

// MARK: Float

/// Fills a real array with zeros in place.
/// - Parameters:
///   - c: Array.
public func clear(_ c: RealFloatArray) {
    vectorClearRealArray(c)
}

/// Fills a complex array with zeros in place.
/// - Parameters:
///   - c: Array.
public func clear(_ c: ComplexFloatArray) {
    vectorClearComplexArray(c)
}

