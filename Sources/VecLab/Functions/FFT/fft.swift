//
//  FFT.swift
//  AudioUnitiOS
//
//  Created by Marcus Painter on 07/09/2023.
//

import Accelerate
import Foundation

/// FFT of complex array.
/// - Parameter x: Complex array.
/// - Returns: Complex array result.
public func fft(_ x: ComplexArray) -> ComplexArray {
    guard let dft = try? vDSP.DiscreteFourierTransform(previous: nil,
                                                       count: x.0.count,
                                                       direction: .forward,
                                                       transformType: .complexComplex,
                                                       ofType: Real.self) else {
        return ([Real](repeating: Real.nan, count: x.0.count),
                [Real](repeating: Real.nan, count: x.0.count))
    }

    let splitComplexOutput = dft.transform(real: x.0, imaginary: x.1)

    return (splitComplexOutput.real, splitComplexOutput.imaginary)
}

/// FFT of complex array.
/// - Parameter x: Complex array.
/// - Returns: Complex array result.
public func fft(_ x: RealArray) -> ComplexArray {

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

/*

 /// FFT of array.
 /// - Parameter x: Real array.
 /// - Returns: Complex array result.
 public func fft(_ x: [Double]) -> ([Double], [Double]) {
     let n = x.count
     let log2n = vDSP_Length(log2(Double(n)))

     //
     // Resuse complex fft for now
     //

     // Create mutable copies for real and imaginary parts
     var realPart = x
     var imagPart = [Double](repeating: 0, count: x.count)

     // Prepare FFT setup
     let setup = vDSP_create_fftsetupD(log2n, FFTRadix(kFFTRadix2))!

     realPart.withUnsafeMutableBufferPointer { realPtr in
         imagPart.withUnsafeMutableBufferPointer { imagPtr in
             var tempComplexSplit = DSPDoubleSplitComplex(realp: realPtr.baseAddress!,
                                                          imagp: imagPtr.baseAddress!)
             // Perform forward FFT
             vDSP_fft_zipD(setup, &tempComplexSplit, 1, log2n, FFTDirection(FFT_FORWARD))
         }
     }
     // Clean up FFT setup outside of the unsafe block
     vDSP_destroy_fftsetupD(setup)

     return (realPart, imagPart) // Return the modified real and imaginary parts
 }

 /// FFT of complex array.
 /// - Parameter x: Complex array.
 /// - Returns: Complex array result.
 public func fft(_ x: ([Double], [Double])) -> ([Double], [Double]) {
     let n = x.0.count
     let log2n = vDSP_Length(log2(Double(n)))

     // Create mutable copies for real and imaginary parts
     var realPart = x.0
     var imagPart = x.1

     // Prepare FFT setup
     let setup = vDSP_create_fftsetupD(log2n, FFTRadix(kFFTRadix2))!

     realPart.withUnsafeMutableBufferPointer { realPtr in
         imagPart.withUnsafeMutableBufferPointer { imagPtr in
             var tempComplexSplit = DSPDoubleSplitComplex(realp: realPtr.baseAddress!,
                                                          imagp: imagPtr.baseAddress!)
             // Perform forward FFT
             vDSP_fft_zipD(setup, &tempComplexSplit, 1, log2n, FFTDirection(FFT_FORWARD))

         }
     }
     // Clean up FFT setup outside of the unsafe block
     vDSP_destroy_fftsetupD(setup)

     return (realPart, imagPart) // Return the modified real and imaginary parts
 }

 /// FFT of array.
 /// - Parameter x: Real array.
 /// - Returns: Complex array result.
 public func fft(_ x: [Float]) -> ([Float], [Float]) {
     let n = x.count
     let log2n = vDSP_Length(log2(Float(n)))

     //
     // Resuse complex fft for now
     //

     // Create mutable copies for real and imaginary parts
     var realPart = x
     var imagPart = [Float](repeating: 0, count: x.count)

     // Prepare FFT setup
     let setup = vDSP_create_fftsetup(log2n, FFTRadix(kFFTRadix2))!

     realPart.withUnsafeMutableBufferPointer { realPtr in
         imagPart.withUnsafeMutableBufferPointer { imagPtr in
             var tempComplexSplit = DSPSplitComplex(realp: realPtr.baseAddress!,
                                                          imagp: imagPtr.baseAddress!)
             // Perform forward FFT
             vDSP_fft_zip(setup, &tempComplexSplit, 1, log2n, FFTDirection(FFT_FORWARD))
         }
     }
     // Clean up FFT setup outside of the unsafe block
     vDSP_destroy_fftsetup(setup)

     return (realPart, imagPart) // Return the modified real and imaginary parts
 }

 /// FFT of complex array.
 /// - Parameter x: Complex array.
 /// - Returns: Complex array result.
 public func fft(_ x: ([Float], [Float])) -> ([Float], [Float]) {
     let n = x.0.count
     let log2n = vDSP_Length(log2(Float(n)))

     // Create mutable copies for real and imaginary parts
     var realPart = x.0
     var imagPart = x.1

     // Prepare FFT setup
     let setup = vDSP_create_fftsetup(log2n, FFTRadix(kFFTRadix2))!

     realPart.withUnsafeMutableBufferPointer { realPtr in
         imagPart.withUnsafeMutableBufferPointer { imagPtr in
             var tempComplexSplit = DSPSplitComplex(realp: realPtr.baseAddress!,
                                                          imagp: imagPtr.baseAddress!)
             // Perform forward FFT
             vDSP_fft_zip(setup, &tempComplexSplit, 1, log2n, FFTDirection(FFT_FORWARD))

         }
     }
     // Clean up FFT setup outside of the unsafe block
     vDSP_destroy_fftsetup(setup)

     return (realPart, imagPart) // Return the modified real and imaginary parts
 }
 */

/*
 /// Inverse Fast Fourier Transform of a complex array.
 public func ifft(_ x: ComplexArray) -> ComplexArray {
     let splitComplexRealInput =  x.0
     let splitComplexImaginaryInput = x.1

     guard let splitComplexDFT = try? vDSP.DiscreteFourierTransform(previous: nil,
                                                                     count: x.0.count,
                                                                     direction: .inverse,
                                                                     transformType: .complexComplex,
                                                                     ofType: Real.self) else {

         return createComplexArray(repeating: (Real.nan, Real.nan), count: x.0.count)
     }

     let splitComplexOutput = splitComplexDFT.transform(real: splitComplexRealInput,
                                                               imaginary: splitComplexImaginaryInput)

     return (splitComplexOutput.real, splitComplexOutput.imaginary)
 }
 */
