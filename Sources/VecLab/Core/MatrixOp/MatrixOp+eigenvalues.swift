//
//  eigenvalues.swift
//  
//
//  Created by Marcus Painter on 17/09/2023.
//

import Foundation
import Accelerate

extension MatrixOp {
    
    func eigenvalues(x: [Double], size: Int) -> (r: [Double], i: [Double]) {
        let worksize = max(1, 3 * size)
        var a: [Double] = x
        
        var jobvl: Int8 = 0x4E // 'N'
        var jobvr: Int8 = 0x4E // 'N'
        var n: Int = Int(size)
        // a
        var lda = Int(size)
        var wr: [Double] = [Double](repeating: 0.0, count: size)
        var wi: [Double] = [Double](repeating: 0.0, count: size)
        var vl: [Double] = [Double](repeating: 0.0, count: 1) // Ignored
        var ldvl: Int = 1
        var vr: [Double] = [Double](repeating: 0.0, count: 1) // Ignored
        var ldvr: Int = 1
        var work: [Double] = [Double](repeating: 0.0, count: 1)
        var lwork: Int = Int(worksize)
        var info: Int = 0
        
        lwork = -1
        dgeev_(&jobvl, &jobvr, &n, &a, &lda, &wr, &wi, &vr, &ldvl, &vl, &ldvr, &work, &lwork, &info)
        lwork = Int(work[0])
        work = [Double](repeating: 0.0, count: Int(lwork))
        
        assert(lwork >= worksize)
        
        dgeev_(&jobvl, &jobvr, &n, &a, &lda, &wr, &wi, &vr, &ldvl, &vl, &ldvr, &work, &lwork, &info)
        
        return (wr, wi)
    }
    
}
