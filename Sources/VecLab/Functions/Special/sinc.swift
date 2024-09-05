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
public func sinc(_ x: RealDouble) -> RealDouble {
    return (x == 0 ? 1 : Darwin.sin(Double.pi * x) / (Double.pi * x))
}

/// Sinc function.
/// - Parameter x: Input array.
/// - Returns: Sinc values.
public func sinc(_ x: RealDoubleArray) -> RealDoubleArray {
    return x.map { sinc($0) }
}

// Sinc function.
/// - Parameter x: Input value.
/// - Returns: Sinc value.
public func sinc(_ x: RealFloat) -> RealFloat {
    return (x == 0 ? 1 : Darwin.sin(Float.pi * x) / (Float.pi * x))
}

/// Sinc function.
/// - Parameter x: Input array.
/// - Returns: Sinc values.
public func sinc(_ x: RealFloatArray) -> RealFloatArray {
    return x.map { sinc($0) }
}
