//
//  VectorComplex+Math.swift
//  VecLab
//
//  Created by Marcus Painter on 24/04/2025.
//

import Accelerate

extension VectorComplex {
    
    public static func + (_ lhs: VectorComplex, _ rhs: VectorComplex) -> VectorComplex {
        precondition(lhs.count == rhs.count,"Vectors must have the same length")
        let result = VectorComplex(count: lhs.count)
        var A = lhs.dspSplitComplex
        var B = rhs.dspSplitComplex
        var C = result.dspSplitComplex
        vDSP_zvaddD(&A, 1, &B, 1, &C, 1, vDSP_Length(lhs.count))
        return result
    }
    
}
