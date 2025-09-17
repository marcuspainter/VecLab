//
//  eigenvaluesHessenberg.swift
//  
//
//  Created by Marcus Painter on 17/09/2023.
//

import Foundation
import Accelerate

func eigenvaluesHessenberg(x: [Double], size: Int) -> (r: [Double], i: [Double]) {
    let worksize = 6 * size
    var h: [Double] = x

    var job: Int8 = 0x45 // 'E'
    var compz: Int8 = 0x4E // 'N'
    var n: Int = Int(size)
    var ilo: Int = 1
    var ihi: Int = Int(size)
    // h
    var ldh: Int = Int(size)
    var wr: [Double] = [Double](repeating: 0.0, count: size)
    var wi: [Double] = [Double](repeating: 0.0, count: size)
    var z: [Double] = [0.0] // Ignored
    var ldz: Int = 1
    var work: [Double] = [0.0]
    var lwork: Int = Int(worksize)
    var info: Int = 999

    lwork = -1
    // dhseqr_(&job, &compz, &n, &ilo, &ihi, &h, &ldh, &wr, &wi, &z, &ldz, &work, &lwork, &info)
    dhseqr_(&job, &compz, &n, &ilo, &ihi, nil, &ldh, nil, nil, nil, &ldz, &work, &lwork, &info)

    lwork = Int(work[0])
    work = [Double](repeating: 0.0, count: Int(lwork))

    // assert(lwork <= worksize)

    dhseqr_(&job, &compz, &n, &ilo, &ihi, &h, &ldh, &wr, &wi, &z, &ldz, &work, &lwork, &info)

    return (wr, wi)
}
