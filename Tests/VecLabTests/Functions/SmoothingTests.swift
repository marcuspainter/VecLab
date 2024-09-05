//
//  SmoothingTests.swift
//
//
//  Created by Marcus Painter on 25/09/2023.
//

import XCTest
import VecLab

class SmoothingTests: XCTestCase {

    let accuracy: RealDouble = 1e-6

    // MARK: hampel

    func testHampel() throws {
        let realArrayX: RealDoubleArray = [1.0, 2.0, 3.0, 100.0, 5.0, 6.0, 7.0, 8.0]
        let result: RealDoubleArray = hampel(realArrayX)
        let expected: RealDoubleArray = [1.0, 2.0, 3.0, 5.0, 5.0, 6.0, 7.0, 8.0]
        XCTAssertEqual(result, expected, accuracy: accuracy, "hampel failed")
    }

    // MARK: medfilt1

    func testMedfilt1Zeropad() throws {
        let realArrayX: RealDoubleArray = [1.0, 2.0, 3.0, 100.0, 5.0, 6.0, 7.0, 8.0]
        let result: RealDoubleArray = medfilt1(realArrayX, k: 3, padding: "zeropad")
        let expected: RealDoubleArray = [1.0, 2.0, 3.0, 5.0, 6.0, 6.0, 7.0, 7.0]
        XCTAssertEqual(result, expected, accuracy: accuracy, "medfilt1 failed")
    }

    func testMedfilt1Truncate() throws {
        let realArrayX: RealDoubleArray = [1.0, 2.0, 3.0, 100.0, 5.0, 6.0, 7.0, 8.0]
        let result: RealDoubleArray = medfilt1(realArrayX, k: 3, padding: "truncate")
        let expected: RealDoubleArray = [1.5, 2.0, 3.0, 5.0, 6.0, 6.0, 7.0, 7.5]
        XCTAssertEqual(result, expected, accuracy: accuracy, "medfilt1 failed")
    }

    // MARK: sgolay

}
