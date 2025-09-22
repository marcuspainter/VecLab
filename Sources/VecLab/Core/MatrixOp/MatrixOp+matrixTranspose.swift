//
//  matrixTranspose.swift
//  
//
//  Created by Marcus Painter on 14/09/2023.
//

import Foundation
import Accelerate

extension MatrixOp {

    static func matrixTranspose(_ matrix: [Double], rows: Int, columns: Int) -> [Double] {
        var transposed = [Double](repeating: 0.0, count: rows * columns)

        for i in 0..<rows {
            for j in 0..<columns {
                transposed[j * rows + i] = matrix[i * columns + j]
            }
        }

        return transposed
    }

    static func matrixTranspose(_ matrix: [Complex], rows: Int, columns: Int) -> [Complex] {
        var transposed = [Complex](repeating: .zero, count: rows * columns)

        for i in 0..<rows {
            for j in 0..<columns {
                transposed[j * rows + i] = matrix[i * columns + j]
            }
        }

        return transposed
    }

    static func transposeMatrix(_ src: [Double], rows M: Int, columns N: Int) -> [Double] {
        precondition(src.count == M * N, "Source array size does not match rows * cols")

        let L = M * N
        let transposed = [Double](unsafeUninitializedCapacity: L) { dst, initializedCount in

            src.withUnsafeBufferPointer { srcPtr in
                dst.withUnsafeMutableBufferPointer { dstPtr in
                    // vDSP_mtransD copies M×N into N×M, performing a transpose
                    vDSP_mtransD(
                        srcPtr.baseAddress!,
                        1,  // source stride (row-major: 1 element apart)
                        dstPtr.baseAddress!,
                        1,  // destination stride
                        vDSP_Length(N),  // number of columns in the source
                        vDSP_Length(M)  // number of rows in the source
                    )
                }
            }
            initializedCount = L
        }
        return transposed
    }

    static func transposeMatrix(_ src: [Complex], rows M: Int, columns N: Int) -> [Complex] {
        precondition(src.count == M * N)

        // Safety checks: Complex must be exactly two Doubles, tightly packed
        precondition(MemoryLayout<Complex>.stride == MemoryLayout<Double>.stride * 2,
                     "Complex must be two Doubles with no padding")
        precondition(MemoryLayout<Complex>.size == MemoryLayout<Double>.stride * 2,
                     "Complex must be exactly 16 bytes")
        precondition(MemoryLayout<Complex>.alignment == MemoryLayout<Double>.alignment,
                     "Complex must have same alignment as Double")

        let L = M * N
        let transposed = [Complex](unsafeUninitializedCapacity: L) { dst, initializedCount in
            src.withUnsafeBufferPointer { sPtr in
                dst.withUnsafeMutableBufferPointer { dPtr in
                    let sBase = UnsafeRawPointer(sPtr.baseAddress!).assumingMemoryBound(to: Double.self)
                    let dBase = UnsafeMutableRawPointer(dPtr.baseAddress!).assumingMemoryBound(to: Double.self)

                    // Transpose real parts
                    vDSP_mtransD(
                        sBase, 2,
                        dBase, 2,
                        vDSP_Length(N),
                        vDSP_Length(M)
                    )

                    // Transpose imaginary parts
                    vDSP_mtransD(
                        sBase + 1, 2,
                        dBase + 1, 2,
                        vDSP_Length(N),
                        vDSP_Length(M)
                    )
                }
            }
            initializedCount = L
        }
        return transposed
    }

}
