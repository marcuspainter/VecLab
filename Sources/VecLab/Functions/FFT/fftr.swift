//
//  fftr.swift
//
//
//  Created by Marcus Painter on 03/04/2024.
//

import Accelerate
import Foundation

/// FFT of real array.
/// - Parameter x: Real array.
/// - Parameter length: Zero-padded length (optional).
/// - Returns: Complex array result.
public func fftr(_ x: RealArray, length: Int? = nil) -> SplitComplexArray {
    var input: RealArray
    if let length {
        input = paddata(x, length: length)
    } else {
        input = x
    }

    guard
        let dft = try? vDSP.DiscreteFourierTransform(
            previous: nil,
            count: input.count,
            direction: .forward,
            transformType: .complexComplex,
            ofType: Real.self
        )
    else {
        print("fftr error")
        return SplitComplexArray(
            [Real](repeating: Real.nan, count: input.count),
            [Real](repeating: Real.nan, count: input.count)
        )
    }
    let zeros = [Real](repeating: 0.0, count: input.count)
    let splitComplexOutput = dft.transform(real: x, imaginary: zeros)

    return SplitComplexArray(splitComplexOutput.real, splitComplexOutput.imaginary)
}
