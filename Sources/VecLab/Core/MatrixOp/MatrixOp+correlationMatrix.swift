//
//  correlationMatrix.swift
//  
//
//  Created by Marcus Painter on 17/09/2023.
//

import Foundation

extension MatrixOp {

    static func correlationMatrix(x: [Double], p: Int) -> (a: [Double], b: [Double], rows: Int, columns: Int) {
        let n = x.count
        let l = p + 1
        let rows = (n - p - 1)
        let columns = p

        var a = [Double](repeating: 0.0, count: rows * columns)
        var b = [Double](repeating: 0.0, count: rows)

        let sqrtnp = sqrt(Double(n - p))
        let sqrt2 = sqrt(2.0)
        let norm = 1.0 / (sqrtnp * sqrt2)

        // b vector
        var index = 0
        for j in 0 ... 0 {
            for i in 1 ... n - l {
                b[index] = -x[i + (l - j) - 1] * norm
                index += 1
            }
        }

        // A matrix
        index = 0
        for j in 1 ..< l {
            for i in 1 ... n - l {
                a[index] = x[i + (l - j) - 1] * norm
                index += 1
            }
        }

        return (a, b, rows, columns)
    }

}
