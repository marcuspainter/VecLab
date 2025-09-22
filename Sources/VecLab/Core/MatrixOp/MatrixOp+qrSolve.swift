//
//  qrSolve.swift
//  
//
//  Created by Marcus Painter on 13/09/2023.
//

import Foundation
import Accelerate

extension MatrixOp {

    static func qrSolve(a: [Double], b: [Double], rows: Int, columns: Int) -> [Double] {
        var trans: Int8 = 0x4e  // 'N'
        var m: Int = Int(rows)
        var n: Int = Int(columns)
        var nrhs: Int = 1

        var aBuffer = a
        var outBuffer = b  // Make a copy of b for the solution

        var lda: Int = Int(rows)
        var ldb: Int = Int(rows)
        var lwork: Int = -1   // This will be used to query the optimal work size
        var work: [Double] = [0.0]
        var info: Int = 0

        // First call to dgels_ to query optimal work size
        dgels_(&trans, &m, &n, &nrhs, &aBuffer, &lda, &outBuffer, &ldb, &work, &lwork, &info)

        lwork = Int(work[0])
        work = [Double](repeating: 0.0, count: Int(lwork))

        // Second call to actually compute the solution
        dgels_(&trans, &m, &n, &nrhs, &aBuffer, &lda, &outBuffer, &ldb, &work, &lwork, &info)

        return Array(outBuffer[0..<columns])
    }

}
