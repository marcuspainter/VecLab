//
//  ldlSolve.swift
//  
//
//  Created by Marcus Painter on 14/09/2023.
//

import Foundation

func ldlSolve(L: [Double], D: [Double], b: [Double], size n: Int) -> [Double] {
    let z = forwardSubstitution(L, b, n)
    let y = diagonalScaling(D, z, n)
    let x = backwardSubstitution(L, y, n)
    return x
}

func diagonalScaling(_ D: [Double], _ z: [Double], _ size: Int) -> [Double] {
    return zip(D, z).map(*)
}
