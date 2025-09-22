//
//  ldlSolve.swift
//  
//
//  Created by Marcus Painter on 14/09/2023.
//

import Foundation

extension MatrixOp {
    
    static func ldlSolve(L: [Double], D: [Double], b: [Double], size n: Int) -> [Double] {
        let z = MatrixOp.forwardSubstitution(L, b, n)
        let y = MatrixOp.diagonalScaling(D, z, n)
        let x = MatrixOp.backSubstitution(L, y, n)
        return x
    }
    
    static func diagonalScaling(_ D: [Double], _ z: [Double], _ size: Int) -> [Double] {
        return zip(D, z).map(*)
    }
    
}
