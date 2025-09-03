//
//  IntegrationTests.swift
//
//
//  Created by Marcus Painter on 25/09/2023.
//

import VecLab
import XCTest

class IntegrationTests: XCTestCase {
    let accuracy: Real = 1e-6

    // MARK: diff

    func testDiffRealArray() throws {
        let realArrayA: RealArray = [1.0, 2.0, 3.0, 4.0]
        let result: RealArray = diff(realArrayA)
        let expected: RealArray = [1.0, 1.0, 1.0]
        XCTAssertEqual(result, expected, accuracy: accuracy, "diff failed")
    }

    func testDiffRealArrayEmpty() throws {
        let realArrayA: RealArray = []
        let result: RealArray = diff(realArrayA)
        let expected: RealArray = []
        XCTAssertEqual(result, expected, accuracy: accuracy, "diff failed")
    }

    // MARK: gradient

    func testGradientRealArray() throws {
        // let realArrayA: RealArray = [1.0, 2.0, 3.0, 4.0]
        let realArrayA: RealArray = [2.0, 2.0, 4.0, 5.0]
        let result: RealArray = gradient(realArrayA)
        let expected: RealArray = [0.0, 1.0, 1.5, 1.0]
        XCTAssertEqual(result, expected, accuracy: accuracy, "gradient failed")
        disp(result)
    }

    func testGradientRealArrayEmpty() throws {
        let realArrayA: RealArray = []
        let result: RealArray = gradient(realArrayA)
        let expected: RealArray = []
        XCTAssertEqual(result, expected, accuracy: accuracy, "gradient failed")
        disp(result)
    }

    func testGradientRealArray1() throws {
        let realArrayA: RealArray = [1]
        let result: RealArray = gradient(realArrayA)
        let expected: RealArray = [0]
        XCTAssertEqual(result, expected, accuracy: accuracy, "gradient failed")
        disp(result)
    }

    // MARK: trapz

    func testTrapzRealArray() throws {
        let realArrayA: RealArray = [1.0, 2.0, 3.0, 4.0]
        let realArrayB: RealArray = [1.0, 2.0, 3.0, 4.0]
        let result: Real = trapz(realArrayA, realArrayB)
        let expected: Real = 7.5
        XCTAssertEqual(result, expected, accuracy: accuracy, "trapz failed")
    }
}
