//
//  svdSolve.swift
//  
//
//  Created by Marcus Painter on 13/09/2023.
//

import Foundation

func svdSolve(a: [Double], b: [Double], rows: Int, columns: Int) -> [Double] {
    // 1. Compute the SVD
    let (u, s, vt) = svd(a: a, rows: rows, columns: columns)

    // 2. Compute Σ⁺ from Σ
    var sPlus = [Double](repeating: 0.0, count: rows * columns)
    let minDim = min(rows, columns)
    for i in 0..<minDim {
        if s[i] != 0 {
            sPlus[i * minDim + i] = 1.0 / s[i]
        }
    }

    // 3. Compute Uᵀ * b
    let utb = matrixTransposeVectorMultiply(Q: u, y: b, rows: rows, columns: minDim)

    // 4. Compute Σ⁺ * (Uᵀ * b)
    let sPlus_utb = matrixMultiply(sPlus, utb, rows: columns, columns: 1, commonDim: minDim)

    // 5. Compute x = V * (Σ⁺ * (Uᵀ * b))
    let x = matrixMultiply(vt, sPlus_utb, rows: columns, columns: 1, commonDim: columns)

    return x
}
