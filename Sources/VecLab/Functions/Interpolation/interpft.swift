//
//  interpft2.swift
//  
//
//  Created by Marcus Painter on 17/09/2023.
//

import Foundation
import Accelerate

public func interpft2(_ X: [Double], _ n: Int) -> [Double] {
    let N = X.count
    var fftX = [Double](repeating: 0.0, count: N)
    var imagX = [Double](repeating: 0.0, count: N)

    fftX.withUnsafeMutableBufferPointer { fftXBuffer in
        imagX.withUnsafeMutableBufferPointer { imagXBuffer in
            var splitComplexX = DSPDoubleSplitComplex(realp: fftXBuffer.baseAddress!, imagp: imagXBuffer.baseAddress!)

            // Forward FFT
            vDSP_fft_zripD(vDSP_create_fftsetupD(vDSP_Length(log2(Double(N))), FFTRadix(kFFTRadix2))!,
                           &splitComplexX,
                           1,
                           vDSP_Length(log2(Double(N))),
                           FFTDirection(kFFTDirection_Forward))
        }
    }

    // Adjust size (either by zero-padding, truncating, and scaling if necessary)
    var adjustedFFT: [Double]
    var imagAdjusted: [Double]

    if n > N {
        adjustedFFT = fftX + [Double](repeating: 0.0, count: n - N)
        imagAdjusted = imagX + [Double](repeating: 0.0, count: n - N)
    } else {
        adjustedFFT = Array(fftX.prefix(n))
        imagAdjusted = Array(imagX.prefix(n))

        var adjustedFFTIn = Array(fftX.prefix(n))
        var imagAdjustedIn = Array(imagX.prefix(n))

        // Adjust magnitude for decimation
        let scaleFactor = Double(N) / Double(n)
        vDSP_vsmulD(&adjustedFFTIn, 1, [scaleFactor], &adjustedFFT, 1, vDSP_Length(n))
        vDSP_vsmulD(&imagAdjustedIn, 1, [scaleFactor], &imagAdjusted, 1, vDSP_Length(n))
    }

    adjustedFFT.withUnsafeMutableBufferPointer { adjustedBuffer in
        imagAdjusted.withUnsafeMutableBufferPointer { imagAdjustedBuffer in
            var splitComplexResult = DSPDoubleSplitComplex(realp: adjustedBuffer.baseAddress!, imagp: imagAdjustedBuffer.baseAddress!)

            // Inverse FFT
            vDSP_fft_zripD(vDSP_create_fftsetupD(vDSP_Length(log2(Double(n))), FFTRadix(kFFTRadix2))!,
                           &splitComplexResult,
                           1,
                           vDSP_Length(log2(Double(n))),
                           FFTDirection(kFFTDirection_Inverse))
        }
    }

    return adjustedFFT
}

public func interpft(_ X: [Double], _ n: Int) -> [Double] {
    let N = X.count
    var fftX = [Double](repeating: 0.0, count: N)
    var imagX = [Double](repeating: 0.0, count: N)

    let fftSetup = vDSP_create_fftsetupD(vDSP_Length(log2(Double(N))), FFTRadix(kFFTRadix2))

    fftX.withUnsafeMutableBufferPointer { fftXBuffer in
        imagX.withUnsafeMutableBufferPointer { imagXBuffer in
            var splitComplexX = DSPDoubleSplitComplex(realp: fftXBuffer.baseAddress!, imagp: imagXBuffer.baseAddress!)
            vDSP_fft_zripD(fftSetup!, &splitComplexX, 1, vDSP_Length(log2(Double(N))), FFTDirection(kFFTDirection_Forward))
        }
    }

    var adjustedFFT: [Double]
    var imagAdjusted: [Double]

    // Increase the sequence length
    if n > N {
        let zeros = [Double](repeating: 0.0, count: n - N)
        adjustedFFT = fftX + zeros
        imagAdjusted = imagX + zeros
    }
    // Decrease the sequence length
    else {
        adjustedFFT = Array(fftX.prefix(n))
        imagAdjusted = Array(imagX.prefix(n))
    }

    // Inverse FFT
    adjustedFFT.withUnsafeMutableBufferPointer { adjustedBuffer in
        imagAdjusted.withUnsafeMutableBufferPointer { imagAdjustedBuffer in
            var splitComplexResult = DSPDoubleSplitComplex(realp: adjustedBuffer.baseAddress!, imagp: imagAdjustedBuffer.baseAddress!)
            vDSP_fft_zripD(fftSetup!, &splitComplexResult, 1, vDSP_Length(log2(Double(n))), FFTDirection(kFFTDirection_Inverse))
        }
    }

    // Cleanup
    vDSP_destroy_fftsetupD(fftSetup)

    // Scale and return the result
    var result = Array(adjustedFFT.prefix(n))
    let scale = 1.0 / Double(n)
    var newResult = result
    vDSP_vsmulD(&newResult, 1, [scale], &result, 1, vDSP_Length(n))

    return newResult
}
