//
//  forwardSubstitution.swift
//  
//
//  Created by Marcus Painter on 15/09/2023.
//

import Foundation

/*
func forwardSubstitution(_ L: [Double], _ b: [Double], _ n: Int) -> [Double] {
    var y = [Double](repeating: 0.0, count: n)

    for i in 0..<n {
        var sum = 0.0
        for j in 0..<i {
            sum += L[i * n + j] * y[j]
        }
        y[i] = (b[i] - sum) / L[i * n + i]
    }

    return y
}
*/
