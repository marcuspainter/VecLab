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
public func fftshift(_ x: RealArray) -> RealArray {
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
public func fftshift(_ x: ComplexArray) -> ComplexArray {
    validateSize(x)
    let real = fftshift(x.real)
    let imag = fftshift(x.imag)

    return ComplexArray(real, imag)
}
