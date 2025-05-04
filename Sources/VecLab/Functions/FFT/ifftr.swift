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
public func ifftr(_ x: ComplexArray) -> RealArray {
    validateSize(x)
    guard let dft = try? vDSP.DiscreteFourierTransform(previous: nil,
                                                       count: x.count,
                                                       direction: .inverse,
                                                       transformType: .complexComplex,
                                                       ofType: Real.self) else {
        print("ifftr failed")
        return ([Real](repeating: Real.nan, count: x.count))
    }

    var splitComplexOutput = dft.transform(real: x.real, imaginary: x.imag)
    splitComplexOutput.real = vDSP.divide(splitComplexOutput.real, Real(x.count))

    return splitComplexOutput.real
}
