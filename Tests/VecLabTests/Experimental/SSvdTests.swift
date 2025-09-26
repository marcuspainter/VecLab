//
//  SSvdTests.swift
//  VecLab
//
//  Created by Marcus Painter on 26/09/2025.
//

import Accelerate
import XCTest

@testable import VecLab

final class SSvdTests: XCTestCase {
    
    func testSsvd() throws {
        
        let m = 5
        let n = 7
        let a = ones(m,n)
        let (u,s,vt) = svd(a)
        
        var sMatrix = Matrix(m,n)
        let len = min(m,n)
        for i in 0..<len {
            sMatrix[i,i] = s[i]
        }
        
        print(s)
        
        print(u * sMatrix * vt * 2.0)
        
        let ss = u[[1,2,3], [1]]
        
        let w1: [Double] = [1,2,3.0,4.0]
        var w2: [Double] = [1,2,3.0]
        
        w2[...] = w1[...] * 2.0
        
        
        
        print(type(of:w2))
        
        print(w2)
        
    }
    
    
    
}

