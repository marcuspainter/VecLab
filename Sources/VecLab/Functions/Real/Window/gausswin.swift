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
public func gausswin(_ L: Int, alpha: Real = 2.5) -> RealArray {
    guard L > 0 else { return [] }

    let midPoint = Real(L - 1) / 2.0
    let nValues = (0..<L).map { Real($0) - midPoint }

    return nValues.map { n in
        exp(-0.5 * pow(alpha * n / midPoint, 2))
    }
}
