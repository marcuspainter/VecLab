//
//  gausswin.swift
//  
//
//  Created by Marcus Painter on 09/09/2023.
//

// Reference:
// https://uk.mathworks.com/help/signal/ref/gausswin.html

import Foundation

/// Gaussian window.
/// - Parameters:
///   - L: Window length.
///   - alpha:Width factor alpha.
/// - Returns: Gaussian window, returned as a vector.
public func gausswin(_ L: Int, alpha: RealDouble = 2.5) -> RealDoubleArray {
    guard L > 0 else { return [] }

    let midPoint = Double(L - 1) / 2.0
    let nValues = (0..<L).map { Double($0) - midPoint }

    return nValues.map { n in
        exp(-0.5 * pow(alpha * n / midPoint, 2))
    }
}
