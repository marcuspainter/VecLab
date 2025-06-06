//
//  real.swift
//
//
//  Created by Marcus Painter on 09/09/2023.
//

import Foundation

/// Real part of a complex number.
///
/// This function is retained for compatibility. Use the `real` property.
/// - Parameter x: Complex number.
/// - Returns: The real part.
@inlinable
public func real(_ x: Complex) -> Real {
    return x.real
}

/// Real parts of a complex array.
///
/// This function is retained for compatibility. Use the `real` property.
/// - Parameter x: Complex array.
/// - Returns: A real array of real part of a complex array.
public func real(_ x: ComplexArray) -> RealArray {
    validateSize(x)
    return x.real
}
