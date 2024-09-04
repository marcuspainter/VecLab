//
//  interpft.swift
//  
//
//  Created by Marcus Painter on 17/09/2023.
//

import Foundation
import Accelerate

/// Interpolate using FFT. method  (Alternative)
/// - Parameters:
///   - X: Input array.
///   - n: Factor.
/// - Returns: Output array.
public func interpft(_ xx: RealArray, _ n: Int) -> RealArray {
    let N = length(xx)

    // Upsample, odd length
    if mod(length(xx), 2) != 0 {
        let U = Real(n)
        let z = zeros(N * Int(U) - N)
        let X = fftr(xx)
        // XX = U * [X2( 1:((N+1)/2) )  z  X2(((N+1)/2+1):N)]; // Matlab
        let t1 = slice(X, 0 ..< ((N+1)/2) )
        let t2 = (z, z)
        let t3 = slice(X, (N+1)/2 ..< N)
        let XX = U * cat(t1, t2, t3)
        let x = ifftr(XX)
        return x
    } else {
        let U = Real(n)
        let X = fftr(xx)
        let z = zeros(N * Int(U) - N)
        let t1 = slice(X, 0 ..< (N/2))
        let t2 = ( [X.0[(N/2)+1]], [X.1[(N/2)+1]]) * 0.5
        let t3 = (z, z)
        let t4 = ( [X.0[N/2+1]], [X.1[N/2+1]]) * 0.5
        let t5 = slice(X, N/2+1 ..< N)
        // XX = U * [X(1:(N/2)) X((N/2)+1)/2 z X(N/2+1)/2 X(N/2+2:N)];  // Matlab
        let XX = U * cat(t1, t2, t3, t4, t5)
        let x = ifftr(XX)
        return x
    }
}

// % https://dsp.stackexchange.com/questions/14919/upsample-data-using-ffts-how-is-this-exactly-done

/*

/// Interpolate using FFT. method.
/// - Parameters:
///   - X: Input array.
///   - n: Factor.
/// - Returns: Output array.
public func interpft(_ X: [Double], _ n: Int) -> [Double] {
    let N = X.count
    var fftX = [Double](repeating: 0.0, count: N)
    var imagX = [Double](repeating: 0.0, count: N)

    let fftSetup = vDSP_create_fftsetupD(vDSP_Length(log2(Double(N))), FFTRadix(kFFTRadix2))

    fftX.withUnsafeMutableBufferPointer { fftXBuffer in
        imagX.withUnsafeMutableBufferPointer { imagXBuffer in
            var splitComplexX = DSPDoubleSplitComplex(realp: fftXBuffer.baseAddress!,
                                                      imagp: imagXBuffer.baseAddress!)
            vDSP_fft_zripD(fftSetup!, &splitComplexX, 1, vDSP_Length(log2(Double(N))),
                           FFTDirection(kFFTDirection_Forward))
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
            var splitComplexResult = DSPDoubleSplitComplex(realp: adjustedBuffer.baseAddress!,
                                                           imagp: imagAdjustedBuffer.baseAddress!)
            vDSP_fft_zripD(fftSetup!, &splitComplexResult, 1, vDSP_Length(log2(Double(n))),
                           FFTDirection(kFFTDirection_Inverse))
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
*/
