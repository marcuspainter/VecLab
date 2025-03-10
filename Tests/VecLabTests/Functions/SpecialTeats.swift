//
//  SpecialTeats.swift
//  VecLab
//
//  Created by Marcus Painter on 08/03/2025.
//

import XCTest
import VecLab

class SpecialTests: XCTestCase {
    
    let accuracy: Real = 1e-3

    func testGammaReal() throws {
        let result: Real = gamma(1 / 3.0)
        print(result)
        let expected: Real = 2.67893853470775e+00 //2.678938534707748
        XCTAssertEqual(result, expected, accuracy: accuracy, "gamma failed")
        
        //  1.354117939426400
    }
    
    func testGammaComplex() throws {
        let z: Complex = (1.0 / 3.0, 0.0)
        let result: Complex = gamma(z)
        print(result)
        let expected: Complex = (2.678938534707748, 0.0) // Matlab
        XCTAssertEqual(result, expected, accuracy: accuracy, "gamma failed")
    }
    
}
