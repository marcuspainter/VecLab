//
//  File.swift
//  
//
//  Created by Marcus Painter on 03/04/2024.
//

import Foundation
import Accelerate

/// Inverse FFT of complex array with real result.
///
/// The FFT size can be any factor of 2, 3, and 5, not just a power of 2.
/// - Parameter x: Complex array.
/// - Returns: Real array result.
public func ifftr(_ x: ComplexArray) -> RealArray {
    guard let dft = try? vDSP.DiscreteFourierTransform(previous: nil,
                                                       count: x.0.count,
                                                       direction: .inverse,
                                                       transformType: .complexComplex,
                                                       ofType: Real.self) else {
        return ([Real](repeating: Real.nan, count: x.0.count))
    }

    var splitComplexOutput = dft.transform(real: x.0, imaginary: x.1)
    splitComplexOutput.real = vDSP.divide(splitComplexOutput.real, Real(x.0.count))

    return splitComplexOutput.real
}
