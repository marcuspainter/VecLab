//
//  IntegrationTests.swift
//
//
//  Created by Marcus Painter on 25/09/2023.
//

import XCTest
import VecLab

class IntegrationTests: XCTestCase {

    let accuracy: RealDouble = 1e-6

    // MARK: diff

    func testDiffRealArray() throws {
        let realArrayA: RealDoubleArray = [1.0, 2.0, 3.0, 4.0]
        let result: RealDoubleArray = diff(realArrayA)
        let expected: RealDoubleArray = [1.0, 1.0, 1.0]
        XCTAssertEqual(result, expected, accuracy: accuracy, "diff failed")
    }

    // MARK: gradient

    func testGradientRealArray() throws {
        let realArrayA: RealDoubleArray = [1.0, 2.0, 3.0, 4.0]
        let result: RealDoubleArray = gradient(realArrayA)
        let expected: RealDoubleArray = [1.0, 1.0, 1.0, 1.0]
        XCTAssertEqual(result, expected, accuracy: accuracy, "gradient failed")
    }

    // MARK: trapz

    func testTrapzRealArray() throws {
        let realArrayA: RealDoubleArray = [1.0, 2.0, 3.0, 4.0]
        let realArrayB: RealDoubleArray = [1.0, 2.0, 3.0, 4.0]
        let result: RealDouble = trapz(realArrayA, realArrayB)
        let expected: RealDouble = 7.5
        XCTAssertEqual(result, expected, accuracy: accuracy, "trapz failed")
    }

}
