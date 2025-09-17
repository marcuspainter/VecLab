//
//  choleskySolve.swift
//  
//
//  Created by Marcus Painter on 14/09/2023.
//

import Foundation

func choleskySolve(_ A: [Double], _ b: [Double], _ n: Int) -> [Double]? {
    guard let L = choleskyDecomposition(A, n) else {
        print("Matrix is not positive definite.")
        return nil
    }
    let y = forwardSubstitution(L, b, n)
    let x = backwardSubstitution(L, y, n)

    return x
}
