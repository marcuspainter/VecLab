//
//  WindowType.swift
//  
//
//  Created by Marcus Painter on 09/09/2023.
//

import Foundation

/// Window sampling type.
///
/// Specifies the type of window to create when using window functions.
/// Window sampling, specified as one of the following:

/// - `symmetric` — Use this option when using windows for filter design.
/// - `periodic` — This option is useful for spectral analysis because it enables a windowed
/// signal to have the perfect periodic extension implicit in the discrete Fourier transform.
/// 
/// When `periodic` is specified, the window function computes a window of length L + 1 and returns the first L points.
///
public enum WindowType {
    /// Symmetric Window.
    ///
    /// Use this option when using windows for filter design.
    case symmetric
    /// Periodic Window.
    ///
    /// Use this option when using windows for spectral analysis.
    case periodic
}
