//
//  ifftshift.swift
//
//
//  Created by Marcus Painter on 15/09/2023.
//

import Foundation

/// Inverse of fftshift.
/// - Parameters:
///   - x: Input array.
/// - Returns: Shifted array
public func ifftshift(_ x: RealDoubleArray) -> RealDoubleArray {
    let n = x.count
    let shift: Int
    if n % 2 == 0 {
        shift = n / 2
    } else {
        shift = (n + 1) / 2
    }
    return circshift(x, shift)
}

/// Inverse of fftshift.
/// - Parameters:
///   - x: Input array.
/// - Returns: Shifted array
public func ifftshift(_ x: ComplexDoubleArray) -> ComplexDoubleArray {
    let r = ifftshift(x.0)
    let i = ifftshift(x.1)

    return (r, i)
}
// MARK: Float

// Inverse of fftshift.
/// - Parameters:
///   - x: Input array.
/// - Returns: Shifted array
public func ifftshift(_ x: RealFloatArray) -> RealFloatArray {
    let n = x.count
    let shift: Int
    if n % 2 == 0 {
        shift = n / 2
    } else {
        shift = (n + 1) / 2
    }
    return circshift(x, shift)
}

/// Inverse of fftshift.
/// - Parameters:
///   - x: Input array.
/// - Returns: Shifted array
public func ifftshift(_ x: ComplexFloatArray) -> ComplexFloatArray {
    let r = ifftshift(x.0)
    let i = ifftshift(x.1)

    return (r, i)
}
