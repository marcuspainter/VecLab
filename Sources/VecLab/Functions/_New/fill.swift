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
public func fill(_ c: RealDoubleArray, _ a: RealDouble) {
    fillRealArray(c, a)
}

/// Fills a a complex array with a value in place.
/// - Parameters:
///   - c: Array.
///   - a: Value.
public func fill(_ c: ComplexDoubleArray, _ a: ComplexDouble) {
    fillComplexArray(c, a)
}

// MARK: Float

/// Fills a real array with a value in place.
/// - Parameters:
///   - c: Array.
///   - a: Value.
public func fill(_ c: RealFloatArray, _ a: RealFloat) {
    fillRealArray(c, a)
}

/// Fills a a complex array with a value in place.
/// - Parameters:
///   - c: Array.
///   - a: Value.
public func fill(_ c: ComplexFloatArray, _ a: ComplexFloat) {
    fillComplexArray(c, a)
}
