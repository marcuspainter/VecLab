//
//  File.swift
//  
//
//  Created by Marcus Painter on 03/04/2024.
//

import Foundation
import Accelerate


/// FFT of complex array.
/// - Parameter x: Complex array.
/// - Returns: Complex array result.
public func fftr(_ x: RealArray) -> ComplexArray {

    guard let dft = try? vDSP.DiscreteFourierTransform(previous: nil,
                                                       count: x.count,
                                                       direction: .forward,
                                                       transformType: .complexComplex,
                                                       ofType: Real.self) else {
        return ([Real](repeating: Real.nan, count: x.count),
                [Real](repeating: Real.nan, count: x.count))
    }
    let zeros = [Real](repeating: 0.0, count: x.count)
    let splitComplexOutput = dft.transform(real: x, imaginary: zeros)

    return (splitComplexOutput.real, splitComplexOutput.imaginary)
}
