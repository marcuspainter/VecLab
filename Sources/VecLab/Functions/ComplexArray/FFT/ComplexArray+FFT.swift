//
//  ComplexArray+FFT.swift
//  VecLab
//
//  Created by Marcus Painter on 22/09/2025.
//

import Accelerate

/// MATLAB-style FFT for quick prototyping.
public func fft(_ input: ComplexArray) -> ComplexArray {
    let count = input.count
    precondition(count > 0, "FFT input must not be empty")

    var output = ComplexArray(repeating: .zero, count: count)

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

    input.withUnsafeBufferPointer { inPtr in
        output.withUnsafeMutableBufferPointer { outPtr in
            let inBase = UnsafeRawPointer(inPtr.baseAddress!)
                .assumingMemoryBound(to: DSPDoubleComplex.self)
            let outBase = UnsafeMutableRawPointer(outPtr.baseAddress!)
                .assumingMemoryBound(to: DSPDoubleComplex.self)

            vDSP_DFT_Interleaved_ExecuteD(setup, inBase, outBase)
        }
    }

    vDSP_DFT_Interleaved_DestroySetupD(setup)
    return output
}

/// MATLAB-style IFFT for quick prototyping (normalized by N).
public func ifft(_ input: ComplexArray) -> ComplexArray {
    let count = input.count
    precondition(count > 0, "IFFT input must not be empty")

    var output = ComplexArray(repeating: .zero, count: count)

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

    input.withUnsafeBufferPointer { inPtr in
        output.withUnsafeMutableBufferPointer { outPtr in
            let inBase = UnsafeRawPointer(inPtr.baseAddress!)
                .assumingMemoryBound(to: DSPDoubleComplex.self)
            let outBase = UnsafeMutableRawPointer(outPtr.baseAddress!)
                .assumingMemoryBound(to: DSPDoubleComplex.self)

            vDSP_DFT_Interleaved_ExecuteD(setup, inBase, outBase)
        }
    }

    // Normalize (MATLAB does X = ifft(fft(x)) → x back)
    let scale = 1.0 / Double(count)
    output /= scale

    vDSP_DFT_Interleaved_DestroySetupD(setup)
    return output
}
