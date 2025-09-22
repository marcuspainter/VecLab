//
//  pinv.swift
//  
//
//  Created by Marcus Painter on 13/09/2023.
//

import Foundation
import Accelerate

extension MatrixOp {

    static func pinv(A: [Double], rows: Int, columns: Int) -> [Double] {
        // 1. Compute the SVD
        let (u, s, vt) = svd(a: A, rows: rows, columns: columns)

        print("u\(u)")
        print("s\(s)")
        print("vt\(vt)")

        // 2. Compute Σ⁺ from Σ
        var sPlus = [Double](repeating: 0.0, count: rows * columns)
        let minDim = min(rows, columns)
        for i in 0..<minDim {
            if s[i] != 0 {
                sPlus[i * minDim + i] = 1.0 / s[i]
            }
        }

        print("sPlus\(sPlus)")

        // 3. Compute the pseudo-inverse A⁺ = VΣ⁺Uᵀ
        // For simplicity, let's assume you have a matrixMultiply function that multiplies two matrices in column-major format
        let v_sPlus = MatrixOp.matrixMultiply(vt, sPlus, rows: columns, columns: minDim, commonDim: columns)
        print("v_sPlus\(v_sPlus)")

        let uTransposed = MatrixOp.matrixTranspose(u, rows: rows, columns: columns)
        let pinvA = MatrixOp.matrixMultiply(v_sPlus, uTransposed, rows: columns, columns: rows, commonDim: minDim)

        print("pinvA\(pinvA)")
        return pinvA
    }

    fileprivate static func matrixMultiply(_ A: [Double], _ B: [Double], rows: Int, columns: Int, commonDim: Int) -> [Double] {
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

}
