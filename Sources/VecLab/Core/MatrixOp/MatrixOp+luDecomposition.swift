//
//  luDecomposition.swift
//  
//
//  Created by Marcus Painter on 13/09/2023.
//

import Foundation
import Accelerate

extension MatrixOp {

    // Modify the luDecompose function to return the ipiv array too
    static func luDecomposition(a: [Double], rows: Int, columns: Int) -> (L: [Double], U: [Double], ipiv: [Int]) {
        var matrix = a // A copy of the input matrix
        var ipiv: [Int] = [Int](repeating: 0, count: min(rows, columns))
        var info: Int = 0

        // Perform LU decomposition using dgetrf
        ipiv.withUnsafeMutableBufferPointer { ipiv in
            matrix.withUnsafeMutableBufferPointer { matrix in
                withUnsafeMutablePointer(to: &info) { info in
                    var m = Int(rows)
                    var n = Int(columns)
                    var lda = m
                    withUnsafeMutablePointer(to: &m) { m in
                        withUnsafeMutablePointer(to: &n) { n in
                            withUnsafeMutablePointer(to: &lda) { lda in
                                dgetrf_(m,
                                        n,
                                        matrix.baseAddress!,
                                        lda,
                                        ipiv.baseAddress!,
                                        info)
                            }
                        }
                    }
                }
            }
        }

        // Ensure the operation was successful
        guard info == 0 else {
            fatalError("LU decomposition failed!")
        }

        // Extract L and U from the combined matrix
        var L = [Double](repeating: 0.0, count: rows * columns)
        var U = [Double](repeating: 0.0, count: rows * columns)

        for i in 0..<rows {
            for j in 0..<columns {
                if i > j {
                    L[i + j * rows] = matrix[i + j * rows]
                } else if i == j {
                    L[i + j * rows] = 1.0
                    U[i + j * rows] = matrix[i + j * rows]
                } else {
                    U[i + j * rows] = matrix[i + j * rows]
                }
            }
        }

        return (L, U, ipiv)
    }

}
