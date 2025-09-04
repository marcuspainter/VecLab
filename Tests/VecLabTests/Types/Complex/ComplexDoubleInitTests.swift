//
//  ComplexDoubleTests.swift
//  VecLab
//
//  Created by Marcus Painter on 02/09/2025.
//

import VecLab  // Replace with your actual module name
import XCTest

final class ComlplexDoubleTests: XCTestCase {
    
    func testInit() throws {
        let a = ComplexDouble()
        
        XCTAssertEqual(a.real, 0)
        XCTAssertEqual(a.imag, 0)
    }
    
    func testInitRealImag() throws {
        let a = ComplexDouble(1.0, -2.0)
        
        XCTAssertEqual(a.real, 1.0)
        XCTAssertEqual(a.imag, -2.0)
    }
    
}
