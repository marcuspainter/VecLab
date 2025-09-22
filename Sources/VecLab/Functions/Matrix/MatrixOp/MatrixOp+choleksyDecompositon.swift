//
//  choleskyDecomposition.swift
//  
//
//  Created by Marcus Painter on 14/09/2023.
//

import Foundation
import Accelerate

extension MatrixOp {
    
    static func choleskyDecomposition(_ A: [Double], _ n: Int) -> [Double]? {
        var L = [Double](repeating: 0.0, count: n * n)
        
        for i in 0..<n {
            for j in 0...i {
                var sum = 0.0
                
                if j == i {  // Diagonal entries
                    for k in 0..<j {
                        sum += L[j * n + k] * L[j * n + k]
                    }
                    let diff = A[i * n + i] - sum
                    if diff <= 0.0 { return nil }  // Not positive definite
                    L[i * n + i] = sqrt(diff)
                } else {
                    for k in 0..<j {
                        sum += L[i * n + k] * L[j * n + k]
                    }
                    L[i * n + j] = (A[i * n + j] - sum) / L[j * n + j]
                }
            }
        }
        
        return L
    }

}
