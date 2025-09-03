//
//  DoubleArrayInitFloatArrayTests.swift
//  VecLab
//
//  Created by Marcus Painter on 02/09/2025.
//

import VecLab
import XCTest

final class DoubleArrayInitFloatArrayTests: XCTestCase {

    func testInit() throws {

        let floats: [Float] = [1.0, 2.0, 3.0, 4.0]
        let doubles: [Double] = [1.0, 2.0, 3.0, 4.0]
        let newDoubles = [Double](floatArray: floats)

        XCTAssertEqual(newDoubles, doubles)
    }

    func testInitEmpty() throws {

        let floats: [Float] = []
        let doubles: [Double] = []
        let newDoubles = [Double](floatArray: floats)

        XCTAssertEqual(newDoubles, doubles)
    }
}
