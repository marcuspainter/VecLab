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
public func ifftshift(_ x: RealArray) -> RealArray {
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
public func ifftshift(_ x: ComplexArray) -> ComplexArray {
    validateSize(x)
    let real = ifftshift(x.real)
    let imag = ifftshift(x.imag)

    return ComplexArray(real, imag)
}
