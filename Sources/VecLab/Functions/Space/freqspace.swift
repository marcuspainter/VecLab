//
//  freqspace.swift
//  
//
//  Created by Marcus Painter on 09/09/2023.
//

import Foundation

/// Frequency spacing for frequency response.
///
///  1.0 corresponds to half the sampling frequency, or π radians.
/// - Parameters:
///   - n: Number of points.
///   - type: Spectrum option.
/// - Returns:The frequency vector assuming `n` evenly spaced points
public func freqspace(_ n: Int, _ type: SpectrumWidth = .half) -> RealArray {
    switch type {
    case .whole:
        return Array(stride(from: 0.0, through: 2.0 * Real(n-1) / Real(n), by: 2.0 / Real(n)) )
    case .half:
        let halfPoints = n / 2 + 1
        return Array(stride(from: 0.0, through: 1.0, by: 1.0 / Real(halfPoints-1)))
    }
}
