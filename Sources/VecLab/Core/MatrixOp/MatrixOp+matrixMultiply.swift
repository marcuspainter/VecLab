//
//  matrixMultiply.swift
//  
//
//  Created by Marcus Painter on 13/09/2023.
//

import Foundation

import Accelerate

extension MatrixOp {
    
    // precondition(a.cols == b.rows, "Inner dimensions must match: a.cols == b.rows")
    // let data = MatrixOp.matrixMultiply(a.data, b.data, m: a.rows, k: a.cols, n: b.cols)

    static func matrixMultiply(_ a: [Double], _ b: [Double], m: Int, k: Int, n: Int) -> [Double] {
        precondition(a.count == m * k, "A must be m×k in column-major layout")
        precondition(b.count == k * n, "B must be k×n in column-major layout")
        let l = m * n
        let data = [Double](unsafeUninitializedCapacity: l) { result, initializedCount in

            // Alpha = 1.0, Beta = 0.0
            let alpha: Double = 1.0
            let beta: Double = 0.0
            
            let lda = m
            let ldb = k
            let ldc = m
            
            a.withUnsafeBufferPointer { aPtr in
                b.withUnsafeBufferPointer { bPtr in
                    result.withUnsafeMutableBufferPointer { resultPtr in
                        cblas_dgemm(
                            CblasColMajor,  // ORDER: Column-major storage
                            CblasNoTrans,  // TRANSA: Don't transpose A
                            CblasNoTrans,  // TRANSB: Don't transpose B
                            m,  // M: Rows of A and C
                            n,  // N: Columns of B and C
                            k,  // K: Columns of A, rows of B
                            alpha,  // ALPHA: Scaling factor for A*B
                            aPtr.baseAddress,  // A: Matrix A
                            lda,  // LDA: Leading dimension of A
                            bPtr.baseAddress,  // B: Matrix B
                            ldb,  // LDB: Leading dimension of B
                            beta,  // BETA: Scaling factor for C
                            resultPtr.baseAddress,  // C: Result matrix C
                            ldc  // LDC: Leading dimension of C
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

