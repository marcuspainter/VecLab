//
//  FFTClassTests.swift
//  VecLab
//
//  Created by Marcus Painter on 31/08/2025.
//

import Foundation
import VecLab
import XCTest

class FFTClassTests: XCTestCase {
    
    let accuracy: Real = 1e-6
    
    func testFFT() {
        
        let n = 8
        let fft = try! FFTClass(length: n)
        let x = vector(0 ..< n)
        let X = fft.fftr(x)
        let y = fft.ifftr(X)
        
        let XX = ComplexArray(X.0, X.1)
        
        XCTAssertEqual(y, x, accuracy: accuracy)
        
        disp(XX[..<8])
        
    }
}
