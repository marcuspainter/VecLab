//
//  ModuloTests.swift
//
//
//  Created by Marcus Painter on 25/09/2023.
//

import VecLab
import XCTest

class ModuloTests: XCTestCase {

    let accuracy: Real = 1e-6

    // MARK: ceil

    func testCeilRealArray() throws {
        let realArrayA: RealArray = [-2.1, -2.0, -1.9, -1.5, -1.0, 0.0, 1.0, 1.5, 1.9, 2.0, 2.1]
        let result: RealArray = ceil(realArrayA)
        let expected: RealArray = [-2.0, -2.0, -1.0, -1.0, -1.0, 0.0, 1.0, 2.0, 2.0, 2.0, 3.0]
        XCTAssertEqual(result, expected, accuracy: accuracy, "ceil failed")
    }

    // MARK: fix

    func testFixRealArray() throws {
        let realArrayA: RealArray = [-2.1, -2.0, -1.9, -1.5, -1.0, 0.0, 1.0, 1.5, 1.9, 2.0, 2.1]
        let result: RealArray = fix(realArrayA)
        let expected: RealArray = [-2.0, -2.0, -1.0, -1.0, -1.0, 0.0, 1.0, 1.0, 1.0, 2.0, 2.0]
        XCTAssertEqual(result, expected, accuracy: accuracy, "fix failed")
    }

    // MARK: floor

    func testFloorRealArray() throws {
        let realArrayA: RealArray = [-2.1, -2.0, -1.9, -1.5, -1.0, 0.0, 1.0, 1.5, 1.9, 2.0, 2.1]
        let result: RealArray = floor(realArrayA)
        let expected: RealArray = [-3.0, -2.0, -2.0, -2.0, -1.0, 0.0, 1.0, 1.0, 1.0, 2.0, 2.0]
        XCTAssertEqual(result, expected, accuracy: accuracy, "floor failed")
    }

    // MARK: mod

    func testModInt() throws {
        let intA: Int = 3
        let intB: Int = 4
        let result: Int = mod(intA, intB)
        let expected: Int = 3
        XCTAssertEqual(result, expected, "mod failed")
    }

    func testModReal() throws {
        let realA: Real = 3.0
        let realB: Real = 4.0
        let result: Real = mod(realA, realB)
        let expected: Real = 3.0
        XCTAssertEqual(result, expected, accuracy: accuracy, "mod failed")
    }

    func testModRealArray() throws {
        let realArrayA: RealArray = [3.0, 5.0]
        let realArrayB: RealArray = [4.0, 4.0]
        let result: RealArray = mod(realArrayA, realArrayB)
        let expected: RealArray = [3.0, 1.0]
        XCTAssertEqual(result, expected, accuracy: accuracy, "mod failed")
    }

    // MARK: rem

    func testRemInt() throws {
        let intA: Int = 3
        let intB: Int = 4
        let result: Int = rem(intA, intB)
        let expected: Int = 3
        XCTAssertEqual(result, expected, "rem failed")
    }

    func testRemReal() throws {
        let realA: Real = 3.0
        let realB: Real = 4.0
        let result: Real = rem(realA, realB)
        let expected: Real = 3.0
        XCTAssertEqual(result, expected, accuracy: accuracy, "rem failed")
    }

    func testRemRealArray() throws {
        let realArrayA: RealArray = [3.0, 5.0]
        let realArrayB: RealArray = [4.0, 4.0]
        let result: RealArray = rem(realArrayA, realArrayB)
        let expected: RealArray = [3.0, 1.0]
        XCTAssertEqual(result, expected, accuracy: accuracy, "rem failed")
    }

    // MARK: round

    func testRoundRealArray() throws {
        let realArrayA: RealArray = [-2.1, -2.0, -1.9, -1.5, -1.0, 0.0, 1.0, 1.5, 1.9, 2.0, 2.1]
        let result: RealArray = round(realArrayA)
        let expected: RealArray = [-2.0, -2.0, -2.0, -2.0, -1.0, 0.0, 1.0, 2.0, 2.0, 2.0, 2.0]
        XCTAssertEqual(result, expected, accuracy: accuracy, "round failed")
    }

    // MARK: trunc

    func testTruncRealArray() throws {
        let realArrayA: RealArray = [-2.1, -2.0, -1.9, -1.5, -1.0, 0.0, 1.0, 1.5, 1.9, 2.0, 2.1]
        let result: RealArray = trunc(realArrayA)
        let expected: RealArray = [-2.0, -2.0, -1.0, -1.0, -1.0, 0.0, 1.0, 1.0, 1.0, 2.0, 2.0]
        XCTAssertEqual(result, expected, accuracy: accuracy, "trunc failed")
    }

    // MARK: frac

    func testFracReal() throws {
        let realA: Real = -2.9
        let result: Real = frac(realA)
        let expected: Real = -0.9
        XCTAssertEqual(result, expected, accuracy: accuracy, "frac failed")
    }

    func testFracRealArray() throws {
        let realArrayA: RealArray = [-2.1, -2.0, -1.9, -1.5, -1.0, 0.0, 1.0, 1.5, 1.9, 2.0, 2.1]
        let result: RealArray = frac(realArrayA)
        let expected: RealArray = [-0.1, 0.0, -0.9, -0.5, 0.0, 0.0, 0.0, 0.5, 0.9, 0.0, 0.1]
        XCTAssertEqual(result, expected, accuracy: accuracy, "frac failed")
    }

}
