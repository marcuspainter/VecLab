//
//  fill.swift
//
//
//  Created by Marcus Painter on 28/08/2024.
//

import Accelerate
import Foundation

/// Fills a real array with a value in place.
/// - Parameters:
///   - c: Array.
///   - a: Value.
public func fill(_ c: RealArray, _ a: Real) {
    fillRealArray(c, a)
}

/// Fills a a complex array with a value in place.
/// - Parameters:
///   - c: Array.
///   - a: Value.
public func fill(_ c: ComplexArray, _ a: Complex) {
    fillComplexArray(c, a)
}
