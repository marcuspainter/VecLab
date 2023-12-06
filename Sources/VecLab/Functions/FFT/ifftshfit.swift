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
    let shift = n % 2 == 0 ? n / 2 : (n - 1) / 2
    return circshift(x, shift)
}

/// Inverse of fftshift.
/// - Parameters:
///   - x: Input array.
/// - Returns: Shifted array
public func ifftshift(_ x: ComplexArray) -> ComplexArray {
    let n = x.0.count
    let shift = n % 2 == 0 ? n / 2 : (n - 1) / 2
    return circshift(x, shift)
}
