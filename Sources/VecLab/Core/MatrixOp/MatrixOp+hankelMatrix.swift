//
//  hankelMatrix.swift
//  
//
//  Created by Marcus Painter on 14/09/2023.
//

import Foundation

extension MatrixOp {
    
    // Y = (N-1,L+1)
    private func hankelMatrix(x: [Double], N: Int, L: Int) -> [Double] {
        let l1 = L + 1 // Columns
        let nl = N - L // Rows
        var y = [Double](repeating: 0.0, count: nl*l1)
        
        var r = 0
        for j in 0..<l1 {
            for i in 0..<nl {
                y[r] = x[i+j]
                r += 1
            }
        }
        return y
    }
    
}
