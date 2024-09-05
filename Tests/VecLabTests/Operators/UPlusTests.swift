//
//  UPlusTests.swift
//
//
//  Created by Marcus Painter on 25/09/2023.
//

import VecLab
import XCTest

class UPlusTests: XCTestCase {

    func testUPlusRealArray() {
        let a: RealDoubleArray = [1.0, 2.0, 3.0]
        let result = +a
        XCTAssertEqual(result, [1.0, 2.0, 3.0], "Real array uplus failed")
    }

    func testUPlusComplex() {
        let a: ComplexDouble = (1.0, -2.0)
        let result = +a
        XCTAssertEqual(result, (1.0, -2.0), "Complex uplus failed")
    }

    func testUPlusComplexArray() {
        let a: ComplexDoubleArray = ([1.0, 2.0, 3.0], [4.0, 5.0, 6.0])
        let result = +a
        XCTAssertEqual(result, ([1.0, 2.0, 3.0], [4.0, 5.0, 6.0]), "Complex array uplus failed")
    }

}
