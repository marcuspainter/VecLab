//
//  backSubstitution.swift
//  
//
//  Created by Marcus Painter on 13/09/2023.
//

import Foundation
/*
func backSubstitution(U: [Double], b: [Double], size: Int) -> [Double] {
    var x = [Double](repeating: 0.0, count: size)

    // Start with the last variable
    x[size - 1] = b[size - 1] / U[(size - 1) * size + size - 1]

    // Work your way upwards
    for i in (0..<size-1).reversed() {
        var sum = 0.0
        for j in (i+1)..<size {
            sum += U[j * size + i] * x[j]  // Remember, column-major format
        }
        x[i] = (b[i] - sum) / U[i * size + i]
    }

    return x
}
 */
