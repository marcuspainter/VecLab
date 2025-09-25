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
        
        let a = ones(5,2)
        let (u,s,vt) = svd(a)
        
        var sMatrix = Matrix(5,2)
        let len = min(5,2)
        for i in 0..<len {
            sMatrix[i,i] = s[i]
        }
        
        print(u * sMatrix * vt)
        
    }
}
