//
//  backSubstitution.swift
//  
//
//  Created by Marcus Painter on 13/09/2023.
//

import Foundation

extension MatrixOp {

    static func backSubstitution(_ L: [Double], _ y: [Double], _ n: Int) -> [Double] {
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

}
