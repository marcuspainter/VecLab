//
//  sinc.swift
//
//
//  Created by Marcus Painter on 12/09/2023.
//

// https://uk.mathworks.com/help/signal/ref/sinc.html

import Foundation

/// Sinc function.
/// - Parameter x: Input value.
/// - Returns: Sinc value.
public func sinc(_ x: Real) -> Real {
    return (x == 0 ? 1 : Darwin.sin(Real.pi * x) / (Real.pi * x))
}

/// Sinc function.
/// - Parameter x: Input array.
/// - Returns: Sinc values.
public func sinc(_ x: RealArray) -> RealArray {
    return x.map { sinc($0) }
}
