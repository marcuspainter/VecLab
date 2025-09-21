//
//  Complex+Basic.swift
//  VecLab
//
//  Created by Marcus Painter on 21/09/2025.
//

/// Sign function (signum function) of a complex number.
///
/// `sign(x)` returns a value of: x./abs(x) if x is complex.
/// - Parameter x: Complex number.
/// - Returns: Sign of number.
public func sign(_ x: Complex) -> Complex {
    return x / abs(x)  // Overloaded
}
