//
//  companionMatrix.swift
//  
//
//  Created by Marcus Painter on 17/09/2023.
//

import Foundation

extension MatrixOp {

    static func companionMatrix(x: [Double]) -> [Double] {
        let n = x.count
        var matrix = [Double](repeating: .nan, count: n * n) // NaN is a guard value

        var index = 0
        for j in 0 ..< n {
            matrix[index] = -x[j]
            index = index + 1
            for i in 1 ..< n {
                matrix[index] = j + 1 == i ? 1 : 0
                index = index + 1
            }
        }

        return matrix
    }
}
