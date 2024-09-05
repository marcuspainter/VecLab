//
//  fftshift.swift
//  
//
//  Created by Marcus Painter on 15/09/2023.
//

import Foundation

/// Shift zero-frequency component to center of spectrum.
/// - Parameters:
///   - x: Input array.
/// - Returns: Shifted array
public func fftshift(_ x: RealDoubleArray) -> RealDoubleArray {
    let n = x.count
    let shift: Int
    if n % 2 == 0 {
        shift = -(n / 2)
    } else {
        shift = -((n + 1) / 2)
    }
    return circshift(x, shift)
}

/// Shift zero-frequency component to center of spectrum.
/// - Parameters:
///   - x: Input array.
/// - Returns: Shifted array
public func fftshift(_ x: ComplexDoubleArray) -> ComplexDoubleArray {
    let r = fftshift(x.0)
    let i = fftshift(x.1)

    return (r, i)
}

// MARK: Float

/// Shift zero-frequency component to center of spectrum.
/// - Parameters:
///   - x: Input array.
/// - Returns: Shifted array
public func fftshift(_ x: RealFloatArray) -> RealFloatArray {
    let n = x.count
    let shift: Int
    if n % 2 == 0 {
        shift = -(n / 2)
    } else {
        shift = -((n + 1) / 2)
    }
    return circshift(x, shift)
}

/// Shift zero-frequency component to center of spectrum.
/// - Parameters:
///   - x: Input array.
/// - Returns: Shifted array
public func fftshift(_ x: ComplexFloatArray) -> ComplexFloatArray {
    let r = fftshift(x.0)
    let i = fftshift(x.1)

    return (r, i)
}


