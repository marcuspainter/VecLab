//
//  qrDecomposition.swift
//  
//
//  Created by Marcus Painter on 14/09/2023.
//

import Foundation
import Accelerate

extension MatrixOp {
    
    func qrDecomposition(A: [Double], rows: Int, columns: Int) -> (Q: [Double], R: [Double]) {
        var m = Int(rows)
        var n = Int(columns)
        var lda = m
        var info: Int = 0
        var tau = [Double](repeating: 0.0, count: min(rows, columns))
        var a = A
        
        // Workspace query for optimal size
        var work = [Double](repeating: 0.0, count: 1)
        var lwork: Int = -1
        dgeqrf_(&m, &n, &a, &lda, &tau, &work, &lwork, &info)
        
        lwork = Int(work[0])
        work = [Double](repeating: 0.0, count: Int(lwork))
        
        // Compute the QR decomposition
        dgeqrf_(&m, &n, &a, &lda, &tau, &work, &lwork, &info)
        
        // Now, 'a' contains the Q and R matrices packed together.
        // Extract R (upper triangular part of 'a')
        var r = [Double](repeating: 0.0, count: rows * columns)
        for j in 0..<columns {
            for i in 0...j {
                r[i + j * rows] = a[i + j * rows]
            }
        }
        
        // Non-overlapping
        var n1 = n
        var n2 = n
        
        // Generate the Q A
        dorgqr_(&m, &n1, &n2, &a, &lda, &tau, &work, &lwork, &info)
        
        return (a, r)
    }
    
}
