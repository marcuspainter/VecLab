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
    let shift = n % 2 == 0 ? n / 2 : (n + 1) / 2
    return circshift(x, shift)
}

/// Shift zero-frequency component to center of spectrum.
/// - Parameters:
///   - x: Input array.
/// - Returns: Shifted array
public func fftshift(_ x: ComplexArray) -> ComplexArray {
    let n = x.0.count
    let shift = n % 2 == 0 ? n / 2 : (n + 1) / 2
    return circshift(x, shift)
}
