//
//  IntegrationTests.swift
//
//
//  Created by Marcus Painter on 25/09/2023.
//

import XCTest
import VecLab

class IntegrationTests: XCTestCase {

    let accuracy: Real = 1e-6

    // MARK: diff

    func testDiffRealArray() throws {
        let realArrayA: RealArray = [1.0, 2.0, 3.0, 4.0]
        let result: RealArray = diff(realArrayA)
        let expected: RealArray = [1.0, 1.0, 1.0]
        XCTAssertEqual(result, expected, accuracy: accuracy, "diff failed")
    }

    // MARK: gradient

    func testGradientRealArray() throws {
        let realArrayA: RealArray = [1.0, 2.0, 3.0, 4.0]
        let result: RealArray = gradient(realArrayA)
        let expected: RealArray = [1.0, 1.0, 1.0, 1.0]
        XCTAssertEqual(result, expected, accuracy: accuracy, "gradient failed")
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
