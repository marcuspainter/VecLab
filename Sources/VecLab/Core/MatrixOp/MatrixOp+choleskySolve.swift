//
//  choleskySolve.swift
//  
//
//  Created by Marcus Painter on 14/09/2023.
//

import Foundation

extension MatrixOp {

    static func choleskySolve(_ A: [Double], _ b: [Double], _ n: Int) -> [Double]? {
        guard let L = MatrixOp.choleskyDecomposition(A, n) else {
            print("Matrix is not positive definite.")
            return nil
        }
        let y = MatrixOp.forwardSubstitution(L, b, n)
        let x = MatrixOp.backSubstitution(L, y, n)

        return x
    }

}
