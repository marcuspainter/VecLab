//
//  svdSolve.swift
//  
//
//  Created by Marcus Painter on 13/09/2023.
//

import Foundation

extension MatrixOp {
    
    static func svdSolve(a: [Double], b: [Double], rows: Int, columns: Int) -> [Double] {
        // 1. Compute the SVD
        let (u, s, vt) = MatrixOp.svd(a: a, rows: rows, columns: columns)
        
        // 2. Compute Σ⁺ from Σ
        var sPlus = [Double](repeating: 0.0, count: rows * columns)
        let minDim = min(rows, columns)
        for i in 0..<minDim {
            if s[i] != 0 {
                sPlus[i * minDim + i] = 1.0 / s[i]
            }
        }
        
        // 3. Compute Uᵀ * b
        let utb = MatrixOp.matrixTransposeVectorMultiply(Q: u, y: b, rows: rows, columns: minDim)
        
        // 4. Compute Σ⁺ * (Uᵀ * b)
        let sPlus_utb = MatrixOp.matrixMultiply(sPlus, utb, rows: columns, columns: 1, commonDim: minDim)
        
        // 5. Compute x = V * (Σ⁺ * (Uᵀ * b))
        let x = MatrixOp.matrixMultiply(vt, sPlus_utb, rows: columns, columns: 1, commonDim: columns)
        
        return x
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
