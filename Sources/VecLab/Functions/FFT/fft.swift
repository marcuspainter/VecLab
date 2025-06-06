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
/// - Parameter length: Padded length (optional)
/// - Returns: Complex array result.
public func fft(_ x: ComplexArray, length: Int? = nil) -> ComplexArray {
    validateSize(x)
    var input: ComplexArray
    if let length {
        input = paddata(x, length: length)
    } else {
        input = x
    }
    
    guard let dft = try? vDSP.DiscreteFourierTransform(previous: nil,
                                                       count: input.count,
                                                       direction: .forward,
                                                       transformType: .complexComplex,
                                                       ofType: Double.self) else {
        return ComplexArray([Real](repeating: Real.nan, count: input.count),
                [Real](repeating: Real.nan, count: input.count))
    }

    let splitComplexOutput = dft.transform(real: input.real, imaginary: input.imag)

    return ComplexArray(splitComplexOutput.real, splitComplexOutput.imaginary)
}

@available(*, unavailable, renamed: "fftr", message: "Use fftr for Real arrays")
public func fft(_ x: RealArray, length: Int?) -> ComplexArray {
    return ComplexArray()
}

/// Setup fft functions for reuse.
/// - Parameters:
///   - count: FFT size.
///   - direction: Forward or inverse transform..
///   - transformType: Complex or real type.
/// - Returns: A DiscreteFourierTransform.
public func fftsetup(count: Int,
                direction: vDSP.FourierTransformDirection,
                transformType: vDSP.DFTTransformType = .complexComplex)
            -> vDSP.DiscreteFourierTransform<Double>? {
    do {
        let dft = try vDSP.DiscreteFourierTransform(previous: nil,
                                                 count: count,
                                                 direction: direction,
                                                 transformType: transformType,
                                                 ofType: Double.self)
        return dft
    } catch {
        print("fftsetup: \(error)")
        return nil
    }
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
