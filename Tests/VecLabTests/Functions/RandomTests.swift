//
//  RandomTests.swift
//  VecLab
//
//  Created by Marcus Painter on 06/09/2025.
//

import XCTest
@testable import VecLab  // Replace with your actual module name

class RandomTests: XCTestCase {
    
    let tolerance: Real = 1e-10
    
    func testRand() {
        rng(seed: 1234)
        let r = rand(count: 1000)
        let (s,n) = awgn(zeros(1000), snr: 0.1)
        
        disp(mean(r))
    }
    
    
}
