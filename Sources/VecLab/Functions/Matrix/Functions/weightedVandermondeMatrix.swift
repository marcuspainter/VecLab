//
//  weightedVandermondeMatrix.swift
//  
//
//  Created by Marcus Painter on 13/09/2023.
//

import Foundation

func weightedVandermondeMatrix(x: [Double], degree: Int, weights: [Double]) -> [Double] {
    let vander = vandermondeMatrix(x: x, degree: degree)
    let numRows = x.count
    let numColumns = degree + 1
    var y = [Double](repeating: 0.0, count: numRows * numColumns)

    for j in 0..<numColumns {
        for i in 0..<numRows {
            y[j*numRows + i] = vander[j*numRows + i] * weights[i]
        }
    }
    return y
}
