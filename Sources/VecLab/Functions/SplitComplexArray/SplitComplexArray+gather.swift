//
//  SplitComplexArray+gather.swift
//  VecLab
//
//  Created by Marcus Painter on 21/09/2025.
//

import Accelerate

public func gather(_ x: SplitComplexArray, indices: [Int]) -> SplitComplexArray {
    precondition(indices.allSatisfy { $0 >= 0 }, "Indices must be non-negative")

    let n = indices.count
    let real = RealArray(unsafeUninitializedCapacity: n) { resultBuffer, initializedCount in
        indices.withUnsafeBufferPointer { ibp in
            ibp.withMemoryRebound(to: UInt.self) { uip in
                x.real.withUnsafeBufferPointer { xbp in
                    resultBuffer.baseAddress!.withMemoryRebound(to: Double.self, capacity: n) { rBase in
                        var rBuf = UnsafeMutableBufferPointer(start: rBase, count: n)
                        vDSP.gather(xbp, indices: uip, result: &rBuf)
                    }
                }
            }
        }
        initializedCount = n
    }

    let imag = RealArray(unsafeUninitializedCapacity: n) { resultBuffer, initializedCount in
        indices.withUnsafeBufferPointer { ibp in
            ibp.withMemoryRebound(to: UInt.self) { uip in
                x.imag.withUnsafeBufferPointer { xbp in
                    resultBuffer.baseAddress!.withMemoryRebound(to: Double.self, capacity: n) { rBase in
                        var rBuf = UnsafeMutableBufferPointer(start: rBase, count: n)
                        vDSP.gather(xbp, indices: uip, result: &rBuf)
                    }
                }
            }
        }
        initializedCount = n
    }

    return SplitComplexArray(real, imag)
}
