//
//  ldlDecomposition.swift
//  
//
//  Created by Marcus Painter on 14/09/2023.
//

import Foundation

extension MatrixOp {
    
    func ldlDecomposition(matrix A: [Double], size n: Int) -> ([Double], [Double]) {
        var L = [Double](repeating: 0.0, count: n * n)
        var D = [Double](repeating: 0.0, count: n)
        
        for i in 0..<n {
            for j in 0..<i {
                var sum = 0.0
                for k in 0..<j {
                    sum += L[i + k * n] * L[j + k * n] * D[k]
                }
                L[i + j * n] = (A[i + j * n] - sum) / D[j]
            }
            
            var sum = A[i + i * n]
            for k in 0..<i {
                sum -= L[i + k * n] * L[i + k * n] * D[k]
            }
            D[i] = sum
            L[i + i * n] = 1.0  // Diagonal of L is 1
        }
        
        return (L, D)
    }
    
}
