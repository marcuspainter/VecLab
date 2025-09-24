//
//  SplitComplexArray+FFT+Real.swift
//  VecLab
//
//  Created by Marcus Painter on 22/09/2025.
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

/// Inverse FFT of complex array with real result.
/// - Parameter x: Complex array.
/// - Parameter length: Zero-padded length (optional).
/// - Returns: Real array result.
public func ifftr(_ x: SplitComplexArray, length: Int? = nil) -> RealArray {
    validateSize(x)
    var input: SplitComplexArray
    if let length {
        input = paddata(x, length: length)
    } else {
        input = x
    }

    guard
        let dft = try? vDSP.DiscreteFourierTransform(
            previous: nil,
            count: input.count,
            direction: .inverse,
            transformType: .complexComplex,
            ofType: Real.self
        )
    else {
        print("ifftr error")
        return ([Real](repeating: Real.nan, count: input.count))
    }

    var splitComplexOutput = dft.transform(real: input.real, imaginary: input.imag)
    splitComplexOutput.real = vDSP.divide(splitComplexOutput.real, Real(input.count))

    return splitComplexOutput.real
}
