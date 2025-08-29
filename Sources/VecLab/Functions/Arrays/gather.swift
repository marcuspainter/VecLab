//
//  gather.swift
//  VecLab
//
//  Created by Marcus Painter on 25/08/2025.
//

import Accelerate

/// Gather real  array elements using array in indices.
/// - Parameters:
///   - x: Real array.
///   - indices: Array of integer indices.
/// - Returns: Real array containing elements of specified indices.
public func gather(_ x: RealArray, indices: [Int]) -> RealArray {
    let uindices: [UInt] = indices.map { UInt($0) }
    return vDSP.gather(x, indices: uindices)
}

/// Gather complex array elements using array in indices.
/// - Parameters:
///   - x: Complex array.
///   - indices: Array of integer indices.
/// - Returns: Complex array containing elements of specified indices.
public func gather(_ x: ComplexArray, indices: [Int]) -> ComplexArray {
    let uindices: [UInt] = indices.map { UInt($0) }
    let real = vDSP.gather(x.real, indices: uindices)
    let imag = vDSP.gather(x.imag, indices: uindices)
    return ComplexArray(real, imag)
}

func gatherSafe(source: [Double], indices: [Int]) -> [Double] {
    return indices.map { source[$0] }
}

func gatherUnsafe(source: [Double], indices: [Int]) {
    var destination = [Double](repeating: 0, count: indices.count)

    indices.withUnsafeBufferPointer { ibp in
        ibp.withMemoryRebound(to: UInt.self) { ubp in
            destination.withUnsafeMutableBufferPointer { dbp in
                vDSP.gather(source, indices: ubp, result: &dbp)
            }
        }
    }
}

func gatherVeryUnsafe(source: [Double], indices: [Int]) {
    var destination = [Double](repeating: 0, count: indices.count)

    indices.withUnsafeBytes { rawPtr in
        // Treat the raw memory as a buffer of UInts
        let uindices = rawPtr.bindMemory(to: UInt.self)

        destination.withUnsafeMutableBufferPointer { dbp in
            vDSP.gather(source,
                        indices: UnsafeBufferPointer(start: uindices.baseAddress, count: uindices.count),
                        result: &dbp)
        }
    }
}
