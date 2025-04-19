//
//  FilterTyoe.swift
//  VecLab
//
//  Created by Marcus Painter on 19/04/2025.
//

/// Biquad filter type
public enum BiquadType {
    /// Low pass.
    case lowpass
    /// High pass.
    case highpass
    /// High shelf.
    case highshelf
    /// Low shelf.
    case lowshelf
    /// Peak.
    case peak
    /// Notch.
    case notch
    /// Band pass Q.
    case bandpassQ
    /// Band pass 0.
    case bandpass0
    /// All pass.
    case allpass
}
