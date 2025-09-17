//
//  matrixMultiply.swift
//  
//
//  Created by Marcus Painter on 13/09/2023.
//

import Foundation

func matrixMultiply(_ A: [Double], _ B: [Double], rows: Int, columns: Int, commonDim: Int) -> [Double] {
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

func matrixMultiply2(_ A: [Double], _ B: [Double], rows: Int, columns: Int, commonDim: Int) -> [Double] {
    var res = [Double](repeating: 0.0, count: rows * columns)
    let M = rows
    let N = columns
    let L = commonDim

    for i in 0..<M {
        for j in 0..<N {
             res[j * M + i] = 0

            for k in 0..<L {
                 res[j * M + i] += A[k * M + i] * B[j * L + k]
             }
         }
     }

    return res
}
