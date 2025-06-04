//
//  ifft.swift
//
//
//  Created by Marcus Painter on 08/09/2023.
//

import Accelerate
import Foundation

/// Inverse FFT of complex array with complex result.
/// - Parameter x: Complex array.
/// - Returns: Complex array result.
public func ifft(_ x: ComplexArray, length: Int? = nil) -> ComplexArray {
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
        return ComplexArray([Real](repeating: Real.nan, count: input.count),
                [Real](repeating: Real.nan, count: input.count))
    }

    var splitComplexOutput = dft.transform(real: input.real, imaginary: input.imag)
    splitComplexOutput.real = vDSP.divide(splitComplexOutput.real, Real(input.count))
    splitComplexOutput.imaginary = vDSP.divide(splitComplexOutput.imaginary, Real(input.count))

    return ComplexArray(splitComplexOutput.real, splitComplexOutput.imaginary)
}

@available(*, unavailable, renamed: "ifftr", message: "Use ifftr for Real arrays")
public func ifft(_ x: ComplexArray, length: Int? = nil) -> RealArray {
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
