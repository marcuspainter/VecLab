//
//  svd.swift
//  
//
//  Created by Marcus Painter on 13/09/2023.
//

import Foundation
import Accelerate

// U = (M,M)
// S = (M)
// VT = (L,L)
// Divide and conquer algorithm
// This matches Matlab output
func svd(a: [Double], rows: Int, columns: Int) -> (u: [Double], s: [Double], vt: [Double]) {

    var jobz = "A".utf8.map {Int8($0)} // 0x41
    var m = Int(rows)
    var n = Int(columns)
    var aa = a
    var lda = Int(rows)
    var s = [Double](repeating: 0.0, count: rows)
    var u = [Double](repeating: 0.0, count: rows*rows)
    var ldu = Int(rows)
    var vt = [Double](repeating: 0.0, count: columns*columns)
    var ldvt = Int(columns)
    var work = [0.0]
    var lwork = Int(1)
    var iwork = [Int](repeating: 0, count: Int(8 * min(m, n)))
    var info = Int(0)

    lwork = -1
    dgesdd_(&jobz, &m, &n, &aa, &lda, &s, &u, &ldu, &vt, &ldvt, &work, &lwork, &iwork, &info)
    assert(info == 0)

    lwork = Int(work[0])
    work = [Double](repeating: 0.0, count: Int(lwork))
    dgesdd_(&jobz, &m, &n, &aa, &lda, &s, &u, &ldu, &vt, &ldvt, &work, &lwork, &iwork, &info)
    assert(info == 0)

    return (u, s, vt)
}
