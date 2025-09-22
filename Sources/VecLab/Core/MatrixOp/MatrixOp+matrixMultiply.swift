//
//  matrixMultiply.swift
//  
//
//  Created by Marcus Painter on 13/09/2023.
//

import Foundation

import Accelerate

extension MatrixOp {

    static func matrixMultiply(_ a: [Double], _ b: [Double], m: Int, k: Int, n: Int) -> [Double] {
        let l = m * k
        let data = [Double](unsafeUninitializedCapacity: l) { result, initializedCount in

            // Alpha = 1.0, Beta = 0.0
            let alpha: Double = 1.0
            let beta: Double = 0.0

            a.withUnsafeBufferPointer { aPtr in
                b.withUnsafeBufferPointer { bPtr in
                    result.withUnsafeMutableBufferPointer { resultPtr in
                        cblas_dgemm(
                            CblasColMajor,  // ORDER: Row-major storage
                            CblasNoTrans,  // TRANSA: Don't transpose A
                            CblasNoTrans,  // TRANSB: Don't transpose B
                            m,  // M: Rows of A and C
                            n,  // N: Columns of B and C
                            k,  // K: Columns of A, rows of B
                            alpha,  // ALPHA: Scaling factor for A*B
                            aPtr.baseAddress,  // A: Matrix A
                            k,  // LDA: Leading dimension of A
                            bPtr.baseAddress,  // B: Matrix B
                            n,  // LDB: Leading dimension of B
                            beta,  // BETA: Scaling factor for C
                            resultPtr.baseAddress,  // C: Result matrix C
                            n  // LDC: Leading dimension of C
                        )
                    }
                }
            }
            initializedCount = l
        }
        return data
    }

    /*
     func matrixMultiply(_ A: [Double], _ B: [Double], rows: Int, columns: Int, commonDim: Int) -> [Double] {
     var result = [Double](repeating: 0.0, count: rows * columns)
     
     for i in 0..<rows {
     for j in 0..<columns {
     var sum = 0.0
     for k in 0..<commonDim {
     sum += A[k * rows + i] * B[j * commonDim + k]  // Remember: column-major format
     }
     result[j * rows + i] = sum
     }
     }
     
     return result
     }
     
     func matrixMultiply2(_ A: [Double], _ B: [Double], rows: Int, columns: Int, commonDim: Int) -> [Double] {
     var res = [Double](repeating: 0.0, count: rows * columns)
     let M = rows
     let N = columns
     let L = commonDim
     
     for i in 0..<M {
     for j in 0..<N {
     res[j * M + i] = 0
     
     for k in 0..<L {
     res[j * M + i] += A[k * M + i] * B[j * L + k]
     }
     }
     }
     
     return res
     }
     
     */

}
