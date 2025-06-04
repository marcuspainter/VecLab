//
//  ifftr.swift
//
//
//  Created by Marcus Painter on 03/04/2024.
//

import Foundation
import Accelerate

/// Inverse FFT of complex array with real result.
/// - Parameter x: Complex array.
/// - Returns: Real array result.
public func ifftr(_ x: ComplexArray, length: Int? = nil) -> RealArray {
    validateSize(x)
    var input: ComplexArray
    if let length {
        input = paddata(x, length: length)
    } else {
        input = x
    }
    
    guard let dft = try? vDSP.DiscreteFourierTransform(previous: nil,
                                                       count: input.count,
                                                       direction: .inverse,
                                                       transformType: .complexComplex,
                                                       ofType: Real.self) else {
        print("ifftr failed")
        return ([Real](repeating: Real.nan, count: input.count))
    }

    var splitComplexOutput = dft.transform(real: input.real, imaginary: input.imag)
    splitComplexOutput.real = vDSP.divide(splitComplexOutput.real, Real(input.count))

    return splitComplexOutput.real
}
