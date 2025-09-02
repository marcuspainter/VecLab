//
//  NumericComplexUnitTests.swift
//  VecLab
//
//  Created by Marcus Painter on 02/09/2025.
//

import VecLab
import XCTest

final class NumericComplexUnitTests: XCTestCase {

    func testI() throws {

        let double: Double = 1.0
        let int: Int = 1
        let float: Float = 1.0
        let complexUnit: Complex = Complex(0.0, 1.0)

        XCTAssert(complexUnit == int.i)
        XCTAssert(complexUnit == float.i)
        XCTAssert(complexUnit == double.i)
        
        XCTAssert(complexUnit == Double.i)
    }
    
    func testJ() throws {

        let double: Double = 1.0
        let int: Int = 1
        let float: Float = 1.0
        let complexUnit: Complex = Complex(0.0, 1.0)

        XCTAssert(complexUnit == int.j)
        XCTAssert(complexUnit == float.j)
        XCTAssert(complexUnit == double.j)
        
        XCTAssert(complexUnit == Double.j)
    }

}
