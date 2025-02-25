//
//  nextpow2.swift
//  
//
//  Created by Marcus Painter on 09/09/2023.
//

import Foundation

/// Exponent of next higher power of 2.
///
/// By convention, `nextpow2(0)` returns zero. You can use `nextpow2` to pad the signal you pass to fft.
/// Doing so can speed up the computation of the FFT when the signal length is not an exact power of 2.
/// - Parameter n: Integer number.
/// - Returns: The next power of 2 greater than `n`.
public func nextpow2(_ n: Int) -> Int {
    guard n > 0 else {
        return 0
    }
    return Int(ceil(log2(Double(n))))
}
