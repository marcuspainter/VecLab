//
//  choleskyDecomposition.swift
//  
//
//  Created by Marcus Painter on 14/09/2023.
//

import Foundation
import Accelerate

func choleskyDecomposition(_ A: [Double], _ n: Int) -> [Double]? {
    var L = [Double](repeating: 0.0, count: n * n)

    for i in 0..<n {
        for j in 0...i {
            var sum = 0.0

            if j == i {  // Diagonal entries
                for k in 0..<j {
                    sum += L[j * n + k] * L[j * n + k]
                }
                let diff = A[i * n + i] - sum
                if diff <= 0.0 { return nil }  // Not positive definite
                L[i * n + i] = sqrt(diff)
            } else {
                for k in 0..<j {
                    sum += L[i * n + k] * L[j * n + k]
                }
                L[i * n + j] = (A[i * n + j] - sum) / L[j * n + j]
            }
        }
    }

    return L
}

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

func backwardSubstitution(_ L: [Double], _ y: [Double], _ n: Int) -> [Double] {
    var x = [Double](repeating: 0.0, count: n)

    for i in (0..<n).reversed() {
        var sum = 0.0
        for j in (i+1)..<n {
            sum += L[j * n + i] * x[j]  // Note the swapped indices
        }
        x[i] = (y[i] - sum) / L[i * n + i]
    }

    return x
}
