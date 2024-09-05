
//
//  ModuloTests.swift
//
//
//  Created by Marcus Painter on 25/09/2023.
//

import XCTest
import VecLab

class ModuloTests: XCTestCase {

    let accuracy: RealDouble = 1e-6

    // MARK: ceil

    func testCeilRealArray() throws {
        let realArrayA: RealDoubleArray = [-2.1, -2.0, -1.9, -1.5, -1.0, 0.0, 1.0, 1.5, 1.9, 2.0, 2.1]
        let result: RealDoubleArray = ceil(realArrayA)
        let expected: RealDoubleArray = [-2.0, -2.0, -1.0, -1.0, -1.0, 0.0, 1.0, 2.0, 2.0, 2.0, 3.0]
        XCTAssertEqual(result, expected, accuracy: accuracy, "ceil failed")
    }

    // MARK: fix

    func testFixRealArray() throws {
        let realArrayA: RealDoubleArray = [-2.1, -2.0, -1.9, -1.5, -1.0, 0.0, 1.0, 1.5, 1.9, 2.0, 2.1]
        let result: RealDoubleArray = fix(realArrayA)
        let expected: RealDoubleArray = [-2.0, -2.0, -1.0, -1.0, -1.0, 0.0, 1.0, 1.0, 1.0, 2.0, 2.0]
        XCTAssertEqual(result, expected, accuracy: accuracy, "fix failed")
    }

    // MARK: floor

    func testFloorRealArray() throws {
        let realArrayA: RealDoubleArray = [-2.1, -2.0, -1.9, -1.5, -1.0, 0.0, 1.0, 1.5, 1.9, 2.0, 2.1]
        let result: RealDoubleArray = floor(realArrayA)
        let expected: RealDoubleArray = [-3.0, -2.0, -2.0, -2.0, -1.0, 0.0, 1.0, 1.0, 1.0, 2.0, 2.0]
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
        let realA: RealDouble = 3.0
        let realB: RealDouble = 4.0
        let result: RealDouble = mod(realA, realB)
        let expected: RealDouble = 3.0
        XCTAssertEqual(result, expected, accuracy: accuracy, "mod failed")
    }

    func testModRealArray() throws {
        let realArrayA: RealDoubleArray = [3.0, 5.0]
        let realArrayB: RealDoubleArray = [4.0, 4.0]
        let result: RealDoubleArray = mod(realArrayA, realArrayB)
        let expected: RealDoubleArray = [3.0, 1.0]
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
        let realA: RealDouble = 3.0
        let realB: RealDouble = 4.0
        let result: RealDouble = rem(realA, realB)
        let expected: RealDouble = 3.0
        XCTAssertEqual(result, expected, accuracy: accuracy, "rem failed")
    }

    func testRemRealArray() throws {
        let realArrayA: RealDoubleArray = [3.0, 5.0]
        let realArrayB: RealDoubleArray = [4.0, 4.0]
        let result: RealDoubleArray = rem(realArrayA, realArrayB)
        let expected: RealDoubleArray = [3.0, 1.0]
        XCTAssertEqual(result, expected, accuracy: accuracy, "rem failed")
    }

    // MARK: round

    func testRoundRealArray() throws {
        let realArrayA: RealDoubleArray = [-2.1, -2.0, -1.9, -1.5, -1.0, 0.0, 1.0, 1.5, 1.9, 2.0, 2.1]
        let result: RealDoubleArray = round(realArrayA)
        let expected: RealDoubleArray = [-2.0, -2.0, -2.0, -2.0, -1.0, 0.0, 1.0, 2.0, 2.0, 2.0, 2.0]
        XCTAssertEqual(result, expected, accuracy: accuracy, "round failed")
    }

    // MARK: trunc

    func testTruncRealArray() throws {
        let realArrayA: RealDoubleArray = [-2.1, -2.0, -1.9, -1.5, -1.0, 0.0, 1.0, 1.5, 1.9, 2.0, 2.1]
        let result: RealDoubleArray = trunc(realArrayA)
        let expected: RealDoubleArray = [-2.0, -2.0, -1.0, -1.0, -1.0, 0.0, 1.0, 1.0, 1.0, 2.0, 2.0]
        XCTAssertEqual(result, expected, accuracy: accuracy, "trunc failed")
    }
    
    // MARK: frac
    
    func testFracReal() throws {
        let realA: RealDouble = -2.9
        let result: RealDouble = frac(realA)
        let expected: RealDouble = -0.9
        XCTAssertEqual(result, expected, accuracy: accuracy, "frac failed")
    }
    
    func testFracRealArray() throws {
        let realArrayA: RealDoubleArray = [-2.1,  -2.0, -1.9, -1.5, -1.0, 0.0, 1.0, 1.5, 1.9, 2.0, 2.1]
        let result: RealDoubleArray = frac(realArrayA)
        let expected: RealDoubleArray =   [ -0.1,  0.0, -0.9, -0.5,  0.0, 0.0, 0.0, 0.5, 0.9, 0.0, 0.1]
        XCTAssertEqual(result, expected, accuracy: accuracy, "frac failed")
    }

}
