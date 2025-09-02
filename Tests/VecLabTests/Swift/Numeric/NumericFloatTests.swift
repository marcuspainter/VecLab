//
//  NumericFloatTests.swift
//  VecLab
//
//  Created by Marcus Painter on 02/09/2025.
//

import VecLab
import XCTest

final class NumericFloatTests: XCTestCase {

    func testF() throws {

        let double: Double = 1.0
        let int: Int = 1
        let float: Float = 1.0

        XCTAssert(Float(1.0) == double.f)
        XCTAssert(Float(1.0) == int.f)
        XCTAssert(Float(1.0) == float.f)
    }

}
