//
//  downsample.swift
//  VecLab
//
//  Created by Marcus Painter on 19/11/2024.
//

import Accelerate
import Accelerate

public func downsample(_ x: RealArray, _ factor: Int, _ phase: Int = 0) -> RealArray {
    guard factor > 0 else { return x }

    let adjustedPhase = phase % factor
    let outputSize = (x.count - adjustedPhase + factor - 1) / factor
    guard outputSize > 0 else { return [] }

    var result = RealArray(repeating: 0.0, count: outputSize)

    x.withUnsafeBufferPointer { inputPtr in
        result.withUnsafeMutableBufferPointer { outputPtr in
            vDSP_mmovD(
                inputPtr.baseAddress! + adjustedPhase,  // source
                outputPtr.baseAddress!,                 // destination
                1,                                      // columns to copy
                vDSP_Length(outputSize),               // rows to copy
                vDSP_Length(factor),                   // input row stride
                1                                       // output row stride
            )
        }
    }

    return result
}
