//
//  Matrix+det.swift
//  VecLab
//
//  Created by Marcus Painter on 15/09/2025.
//

import Accelerate

public func det(_ a: Matrix) -> Double {
    precondition(a.rows == a.cols, "Matrix must be square")
    return det(a.data, n: a.rows)
}

func det(_ a: [Double], n: Int) -> Double {

    var ipiv = [Int](repeating: 0, count: n)
    var N = n
    var lda = N
    var info: Int = 0
    var A = a

    dgetrf_(&N, &N, &A, &lda, &ipiv, &info)
    if info != 0 { return .nan } // singular or error

    var determinant: Double = 1.0
    var swaps = 0
    for i in 0..<n {
        determinant *= A[i*n + i] // diagonal of U
        if ipiv[i] != i+1 { swaps += 1 } // row swap check
    }
    if swaps % 2 != 0 { determinant = -determinant }

    return determinant
}
