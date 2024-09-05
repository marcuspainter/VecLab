//
//  File.swift
//  
//
//  Created by Marcus Painter on 03/04/2024.
//

import Foundation
import Accelerate

/// FFT of real array.
/// - Parameter x: Real array.
/// - Returns: Complex array result.
public func fftr(_ x: RealDoubleArray) -> ComplexDoubleArray {

    guard let dft = try? vDSP.DiscreteFourierTransform(previous: nil,
                                                       count: x.count,
                                                       direction: .forward,
                                                       transformType: .complexComplex,
                                                       ofType: Double.self) else {
        print("fftr failed")
        return ([RealDouble](repeating: Double.nan, count: x.count),
                [RealDouble](repeating: Double.nan, count: x.count))
    }
    let zeros = [RealDouble](repeating: 0.0, count: x.count)
    let splitComplexOutput = dft.transform(real: x, imaginary: zeros)

    return (splitComplexOutput.real, splitComplexOutput.imaginary)
}

/// FFT of real array.
/// - Parameter x: Real array.
/// - Returns: Complex array result.
public func fftr(_ x: RealFloatArray) -> ComplexFloatArray {

    guard let dft = try? vDSP.DiscreteFourierTransform(previous: nil,
                                                       count: x.count,
                                                       direction: .forward,
                                                       transformType: .complexComplex,
                                                       ofType: Float.self) else {
        print("fftr failed")
        return ([RealFloat](repeating: Float.nan, count: x.count),
                [RealFloat](repeating: Float.nan, count: x.count))
    }
    let zeros = [RealFloat](repeating: 0.0, count: x.count)
    let splitComplexOutput = dft.transform(real: x, imaginary: zeros)

    return (splitComplexOutput.real, splitComplexOutput.imaginary)
}
