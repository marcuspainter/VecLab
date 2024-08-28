//
//  File.swift
//  
//
//  Created by Marcus Painter on 28/08/2024.
//

import Foundation
import XCTest
import VecLab

class NewTests: XCTestCase {
    
    func testFillRealArray() throws {
        let c: RealArray = [1 ,2, 3, 4, 5]
        let a: Real = 999.0
        fill(c, a)
        let expected: RealArray = [999, 999, 999, 999, 999]
        XCTAssertEqual(c, expected, "fill failed")
    }
    
    func testFillComplexDArray() throws {
        let c: ComplexArray = ([1 ,2, 3, 4, 5], [1, 2, 3, 4, 5])
        let a: Complex = (999.0, 777.0)
        fill(c, a)
        let expected: ComplexArray = ([999, 999, 999, 999, 999], [777, 777, 777, 777, 777])
        XCTAssertEqual(c, expected, "fill failed")
    }
    
}
