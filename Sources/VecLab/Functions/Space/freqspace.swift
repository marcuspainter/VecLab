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
public func freqspace(_ n: Int, _ type: SpectrumWidth = .half) -> RealDoubleArray {
    switch type {
    case .whole:
        return Array(stride(from: 0.0, through: 2.0 * Double(n-1) / Double(n), by: 2.0 / Double(n)) )
    case .half:
        let halfPoints = n / 2 + 1
        return Array(stride(from: 0.0, through: 1.0, by: 1.0 / Double(halfPoints-1)))
    }
}

/// Frequency spacing for frequency response.
///
///  1.0 corresponds to half the sampling frequency, or π radians.
/// - Parameters:
///   - n: Number of points.
///   - type: Spectrum option.
/// - Returns:The frequency vector assuming `n` evenly spaced points
public func freqspacef(_ n: Int, _ type: SpectrumWidth = .half) -> RealFloatArray {
    switch type {
    case .whole:
        return Array(stride(from: 0.0, through: 2.0 * Float(n-1) / Float(n), by: 2.0 / Float(n)) )
    case .half:
        let halfPoints = n / 2 + 1
        return Array(stride(from: 0.0, through: 1.0, by: 1.0 / Float(halfPoints-1)))
    }
}
