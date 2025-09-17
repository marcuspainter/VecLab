//
//  pinv.swift
//  
//
//  Created by Marcus Painter on 13/09/2023.
//

import Foundation
import Accelerate

func pinv(A: [Double], rows: Int, columns: Int) -> [Double] {
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
    let v_sPlus = matrixMultiply(vt, sPlus, rows: columns, columns: minDim, commonDim: columns)
    print("v_sPlus\(v_sPlus)")

    let uTransposed = matrixTranspose(u, rows: rows, columns: columns)
    let pinvA = matrixMultiply(v_sPlus, uTransposed, rows: columns, columns: rows, commonDim: minDim)

    print("pinvA\(pinvA)")
    return pinvA
}
