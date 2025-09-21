//
//  RealArray+FFT+Shift.swift
//  VecLab
//
//  Created by Marcus Painter on 22/09/2025.
//

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


