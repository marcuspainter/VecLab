//
//  File.swift
//  
//
//  Created by Marcus Painter on 03/04/2024.
//

import Foundation
import Accelerate

/// Inverse FFT of complex array with real result.
/// - Parameter x: Complex array.
/// - Returns: Real array result.
public func ifftr(_ x: ComplexDoubleArray) -> RealDoubleArray {
    guard let dft = try? vDSP.DiscreteFourierTransform(previous: nil,
                                                       count: x.0.count,
                                                       direction: .inverse,
                                                       transformType: .complexComplex,
                                                       ofType: Double.self) else {
        print("ifftr failed")
        return ([Double](repeating: Double.nan, count: x.0.count))
    }

    var splitComplexOutput = dft.transform(real: x.0, imaginary: x.1)
    splitComplexOutput.real = vDSP.divide(splitComplexOutput.real, Double(x.0.count))

    return splitComplexOutput.real
}

/// Inverse FFT of complex array with real result.
/// - Parameter x: Complex array.
/// - Returns: Real array result.
public func ifftr(_ x: ComplexFloatArray) -> RealFloatArray {
    guard let dft = try? vDSP.DiscreteFourierTransform(previous: nil,
                                                       count: x.0.count,
                                                       direction: .inverse,
                                                       transformType: .complexComplex,
                                                       ofType: Float.self) else {
        print("ifftr failed")
        return ([Float](repeating: Float.nan, count: x.0.count))
    }

    var splitComplexOutput = dft.transform(real: x.0, imaginary: x.1)
    splitComplexOutput.real = vDSP.divide(splitComplexOutput.real, Float(x.0.count))

    return splitComplexOutput.real
}
