//
//  uplus.swift
//
//
//  Created by Marcus Painter on 09/09/2023.
//

import Foundation

/// Unary plus.
/// - Parameter a: Real array.
/// - Returns: The result of +a.
public prefix func + (a: RealDoubleArray) -> RealDoubleArray {
    return a
}

/// Unary plus.
/// - Parameter a: Complex number.
/// - Returns: The result of +a.
public prefix func + (a: ComplexDouble) -> ComplexDouble {
    return a
}

/// Unary plus.
/// - Parameter a: Complex array.
/// - Returns: The result of +a.
public prefix func + (a: ComplexDoubleArray) -> ComplexDoubleArray {
    return a
}
