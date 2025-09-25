//
//  ComplexArray+FFT.swift
//  VecLab
//
//  Created by Marcus Painter on 22/09/2025.
//

import Accelerate

/// MATLAB-style FFT for quick prototyping.
public func fft(_ x: ComplexArray) -> ComplexArray {
    let count = x.count
    precondition(count > 0, "FFT input must not be empty")

    guard
        let setup = vDSP_DFT_Interleaved_CreateSetupD(
            nil,
            vDSP_Length(count),
            .FORWARD,
            .interleaved_ComplextoComplex
        )
    else {
        fatalError("Failed to create FFT setup")
    }
    
    var result = [Complex](unsafeUninitializedCapacity: count) { output, initializedCount in

        x.withUnsafeBufferPointer { inPtr in
            output.withUnsafeMutableBufferPointer { outPtr in
                let inBase = UnsafeRawPointer(inPtr.baseAddress!)
                    .assumingMemoryBound(to: DSPDoubleComplex.self)
                let outBase = UnsafeMutableRawPointer(outPtr.baseAddress!)
                    .assumingMemoryBound(to: DSPDoubleComplex.self)
                
                vDSP_DFT_Interleaved_ExecuteD(setup, inBase, outBase)
            }
        }
        initializedCount = count
    }

    vDSP_DFT_Interleaved_DestroySetupD(setup)
    return result
}

/// MATLAB-style IFFT for quick prototyping (normalized by N).
public func ifft(_ x: ComplexArray) -> ComplexArray {
    let count = x.count
    precondition(count > 0, "IFFT input must not be empty")

    guard
        let setup = vDSP_DFT_Interleaved_CreateSetupD(
            nil,
            vDSP_Length(count),
            .INVERSE,
            .interleaved_ComplextoComplex
        )
    else {
        fatalError("Failed to create IFFT setup")
    }
    
    var result = [Complex](unsafeUninitializedCapacity: count) { output, initializedCount in
        x.withUnsafeBufferPointer { inPtr in
            output.withUnsafeMutableBufferPointer { outPtr in
                let inBase = UnsafeRawPointer(inPtr.baseAddress!)
                    .assumingMemoryBound(to: DSPDoubleComplex.self)
                let outBase = UnsafeMutableRawPointer(outPtr.baseAddress!)
                    .assumingMemoryBound(to: DSPDoubleComplex.self)
                
                vDSP_DFT_Interleaved_ExecuteD(setup, inBase, outBase)
            }
        }
        initializedCount = count
    }

    // Normalize (MATLAB does X = ifft(fft(x)) → x back)
    let scale = 1.0 / Double(count)
    
    result *= scale
    
    //for i in 0..<count {
    //    result[i].real *= scale
    //    result[i].imag *= scale
    //}
    

    vDSP_DFT_Interleaved_DestroySetupD(setup)
    return result
}

/// MATLAB-style FFT for quick prototyping.
public func fftr2(_ x: RealArray) -> ComplexArray {
    let count = x.count
    precondition(count > 0, "FFT input must not be empty")

    guard
        let setup = vDSP_DFT_Interleaved_CreateSetupD(
            nil,
            vDSP_Length(count / 2),
            .FORWARD,
            .interleaved_RealtoComplex
        )
    else {
        fatalError("Failed to create FFT setup")
    }
    
    var result = [Complex](unsafeUninitializedCapacity: count) { output, initializedCount in

        x.withUnsafeBufferPointer { inPtr in
            output.withUnsafeMutableBufferPointer { outPtr in
                let inBase = UnsafeRawPointer(inPtr.baseAddress!)
                    .assumingMemoryBound(to: DSPDoubleComplex.self)
                let outBase = UnsafeMutableRawPointer(outPtr.baseAddress!)
                    .assumingMemoryBound(to: DSPDoubleComplex.self)
                
                vDSP_DFT_Interleaved_ExecuteD(setup, inBase, outBase)
            }
        }
        initializedCount = count
    }
    
    // Scale half the FFT
    let scale = 0.5
    result *= scale
    
    // Extract Nyquist from DC imag
    let nyquist = result[0].imag
    // Set DC imag to zero
    result[0].imag = 0
    
    // Build imaginary part of FFT
    let nyquistIndex: Int = count / 2
    result[nyquistIndex].real = nyquist
    result[nyquistIndex+1..<count] = flip(conj(result[1..<nyquistIndex]))
    
    vDSP_DFT_Interleaved_DestroySetupD(setup)
    return result
}
