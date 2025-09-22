//
//  matrixTranspose.swift
//  
//
//  Created by Marcus Painter on 14/09/2023.
//

import Foundation
import Accelerate

extension MatrixOp {
    
    static func matrixTranspose(_ matrix: [Double], rows: Int, columns: Int) -> [Double] {
        var transposed = [Double](repeating: 0.0, count: rows * columns)
        
        for i in 0..<rows {
            for j in 0..<columns {
                transposed[j * rows + i] = matrix[i * columns + j]
            }
        }
        
        return transposed
    }
    
}
