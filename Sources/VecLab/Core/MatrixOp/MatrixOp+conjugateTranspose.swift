//
//  MatrixOp+conjugateTranspose.swift
//  VecLab
//
//  Created by Marcus Painter on 22/09/2025.
//

import Foundation
import Accelerate

extension MatrixOp {

    static func conjugateTranspose(_ matrix: [Complex], rows: Int, columns: Int) -> [Complex] {
        var transposed = [Complex](repeating: .zero, count: rows * columns)

        for i in 0..<rows {
            for j in 0..<columns {
                var element = matrix[i * columns + j]
                element.imag = -element.imag
                transposed[j * rows + i] = element
            }
        }
        return transposed
    }

}
