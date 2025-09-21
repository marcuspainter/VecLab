//
//  SplitComplexArray+FFT.swift
//  VecLab
//
//  Created by Marcus Painter on 22/09/2025.
//

import Accelerate
import Foundation

/// FFT of complex array.
/// - Parameter x: Complex array.
/// - Parameter length: Zero-padded length (optional).
/// - Returns: Complex array result.
public func fft(_ x: SplitComplexArray, length: Int? = nil) -> SplitComplexArray {
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
            direction: .forward,
            transformType: .complexComplex,
            ofType: Double.self
        )
    else {
        print("fft error")
        return SplitComplexArray(
            [Real](repeating: Real.nan, count: input.count),
            [Real](repeating: Real.nan, count: input.count)
        )
    }

    let splitComplexOutput = dft.transform(real: input.real, imaginary: input.imag)

    return SplitComplexArray(splitComplexOutput.real, splitComplexOutput.imaginary)
}

@available(*, unavailable, renamed: "fftr", message: "Use fftr for Real arrays")
public func fft(_ x: RealArray, length: Int?) -> SplitComplexArray {
    return SplitComplexArray()
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
 public func ifft(_ x: SplitComplexArray) -> SplitComplexArray {
     let splitComplexRealInput =  x.0
     let splitComplexImaginaryInput = x.1

     guard let splitComplexDFT = try? vDSP.DiscreteFourierTransform(previous: nil,
                                                                     count: x.0.count,
                                                                     direction: .inverse,
                                                                     transformType: .complexComplex,
                                                                     ofType: Real.self) else {

         return createSplitComplexArray(repeating: (Real.nan, Real.nan), count: x.0.count)
     }

     let splitComplexOutput = splitComplexDFT.transform(real: splitComplexRealInput,
                                                               imaginary: splitComplexImaginaryInput)

     return (splitComplexOutput.real, splitComplexOutput.imaginary)
 }
 */

// Inverse FFT of complex array with complex result.
/// - Parameter x: Complex array.
/// - Parameter length:Zero-padded length (optional).
/// - Returns: Complex array result.
public func ifft(_ x: SplitComplexArray, length: Int? = nil) -> SplitComplexArray {
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
        print("ifft error")
        return SplitComplexArray(
            [Real](repeating: Real.nan, count: input.count),
            [Real](repeating: Real.nan, count: input.count)
        )
    }

    var splitComplexOutput = dft.transform(real: input.real, imaginary: input.imag)
    splitComplexOutput.real = vDSP.divide(splitComplexOutput.real, Real(input.count))
    splitComplexOutput.imaginary = vDSP.divide(splitComplexOutput.imaginary, Real(input.count))

    return SplitComplexArray(splitComplexOutput.real, splitComplexOutput.imaginary)
}

@available(*, unavailable, renamed: "ifftr", message: "Use ifftr for Real arrays")
public func ifft(_ x: SplitComplexArray, length: Int? = nil) -> RealArray {
    return []
}

/*
 /// Inverse FFT of a array.
 /// - Parameter x: Real array.
 /// - Returns: Complex array result.
 public func ifft(_ x: ([Double], [Double])) -> [Double] {
     let n = x.0.count
     let log2n = vDSP_Length(log2(Double(n)))

     // Create mutable copies for real and imaginary parts
     var realPart = x.0
     var imagPart = x.1

     withUnsafeMutablePointer(to: &realPart[0]) { realPtr in
         withUnsafeMutablePointer(to: &imagPart[0]) { imagPtr in
             var tempComplexSplit = DSPDoubleSplitComplex(realp: realPtr,
                                                          imagp: imagPtr)
             // Prepare FFT setup
             let setup = vDSP_create_fftsetupD(log2n, FFTRadix(kFFTRadix2))!

             // Perform forward FFT
             vDSP_fft_zipD(setup, &tempComplexSplit, 1, log2n, FFTDirection(FFT_INVERSE))

             // Clean up FFT setup outside of the unsafe block
             vDSP_destroy_fftsetupD(setup)

             // Scale the result
            var scale = 1.0 / Double(n)
            vDSP_vsmulD(tempComplexSplit.realp, 1, &scale, tempComplexSplit.realp, 1, vDSP_Length(n))
            vDSP_vsmulD(tempComplexSplit.imagp, 1, &scale, tempComplexSplit.imagp, 1, vDSP_Length(n))
         }
     }

     return realPart// Return the modified real and imaginary parts
 }

 /// Inverse FFT of a complex array.
 /// - Parameter x: Real array.
 /// - Returns: Complex array result.
 public func ifft(_ x: ([Double], [Double])) -> ([Double], [Double]) {
     let n = x.0.count
     let log2n = vDSP_Length(log2(Double(n)))

     // Create mutable copies for real and imaginary parts
     var realPart = x.0
     var imagPart = x.1

     withUnsafeMutablePointer(to: &realPart[0]) { realPtr in
         withUnsafeMutablePointer(to: &imagPart[0]) { imagPtr in
             var tempComplexSplit = DSPDoubleSplitComplex(realp: realPtr,
                                                          imagp: imagPtr)
             // Prepare FFT setup
             let setup = vDSP_create_fftsetupD(log2n, FFTRadix(kFFTRadix2))!

             // Perform forward FFT
             vDSP_fft_zipD(setup, &tempComplexSplit, 1, log2n, FFTDirection(FFT_INVERSE))

             // Clean up FFT setup outside of the unsafe block
             vDSP_destroy_fftsetupD(setup)

             // Scale the result
            var scale = 1.0 / Double(n)
            vDSP_vsmulD(tempComplexSplit.realp, 1, &scale, tempComplexSplit.realp, 1, vDSP_Length(n))
            vDSP_vsmulD(tempComplexSplit.imagp, 1, &scale, tempComplexSplit.imagp, 1, vDSP_Length(n))
         }
     }

     return (realPart, imagPart) // Return the modified real and imaginary parts
 }

 /// Inverse FFT of a array.
 /// - Parameter x: Real array.
 /// - Returns: Complex array result.
 public func ifft(_ x: ([Float], [Float])) -> [Float] {
     let n = x.0.count
     let log2n = vDSP_Length(log2(Float(n)))

     // Create mutable copies for real and imaginary parts
     var realPart = x.0
     var imagPart = x.1

     withUnsafeMutablePointer(to: &realPart[0]) { realPtr in
         withUnsafeMutablePointer(to: &imagPart[0]) { imagPtr in
             var tempComplexSplit = DSPSplitComplex(realp: realPtr,
                                                          imagp: imagPtr)
             // Prepare FFT setup
             let setup = vDSP_create_fftsetup(log2n, FFTRadix(kFFTRadix2))!

             // Perform forward FFT
             vDSP_fft_zip(setup, &tempComplexSplit, 1, log2n, FFTDirection(FFT_INVERSE))

             // Clean up FFT setup outside of the unsafe block
             vDSP_destroy_fftsetup(setup)

             // Scale the result
            var scale = 1.0 / Float(n)
            vDSP_vsmul(tempComplexSplit.realp, 1, &scale, tempComplexSplit.realp, 1, vDSP_Length(n))
            vDSP_vsmul(tempComplexSplit.imagp, 1, &scale, tempComplexSplit.imagp, 1, vDSP_Length(n))
         }
     }

     return realPart// Return the modified real and imaginary parts
 }

 /// Inverse FFT of a complex array.
 /// - Parameter x: Real array.
 /// - Returns: Complex array result.
 public func ifft(_ x: ([Float], [Float])) -> ([Float], [Float]) {
     let n = x.0.count
     let log2n = vDSP_Length(log2(Float(n)))

     // Create mutable copies for real and imaginary parts
     var realPart = x.0
     var imagPart = x.1

     withUnsafeMutablePointer(to: &realPart[0]) { realPtr in
         withUnsafeMutablePointer(to: &imagPart[0]) { imagPtr in
             var tempComplexSplit = DSPSplitComplex(realp: realPtr,
                                                          imagp: imagPtr)
             // Prepare FFT setup
             let setup = vDSP_create_fftsetup(log2n, FFTRadix(kFFTRadix2))!

             // Perform forward FFT
             vDSP_fft_zip(setup, &tempComplexSplit, 1, log2n, FFTDirection(FFT_INVERSE))

             // Clean up FFT setup outside of the unsafe block
             vDSP_destroy_fftsetup(setup)

             // Scale the result
            var scale = 1.0 / Float(n)
            vDSP_vsmul(tempComplexSplit.realp, 1, &scale, tempComplexSplit.realp, 1, vDSP_Length(n))
            vDSP_vsmul(tempComplexSplit.imagp, 1, &scale, tempComplexSplit.imagp, 1, vDSP_Length(n))
         }
     }

     return (realPart, imagPart) // Return the modified real and imaginary parts
 }

 */
