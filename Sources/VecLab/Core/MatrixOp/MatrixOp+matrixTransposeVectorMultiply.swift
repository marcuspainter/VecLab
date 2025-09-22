//
//  matrixTransposeVectorMultiply.swift
//
//
//  Created by Marcus Painter on 13/09/2023.
//

import Foundation

extension MatrixOp {

    static func matrixTransposeVectorMultiply(Q: [Double], y: [Double], rows: Int, columns: Int) -> [Double] {
        // The result will be a vector of size 'columns' since Q^T will be of size (columns x rows)
        var result = [Double](repeating: 0.0, count: columns)

        for i in 0..<columns {
            for j in 0..<rows {
                result[i] += Q[j + i * rows] * y[j]
            }
        }
        return result
    }
}
