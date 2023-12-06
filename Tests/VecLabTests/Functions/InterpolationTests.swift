//
//  InterpolationTests.swift
//
//
//  Created by Marcus Painter on 25/09/2023.
//

import XCTest
import VecLab

class InterpolationTests: XCTestCase {

    let accuracy: Double = 1e-6

    // MARK: interp1

    func testInterp1RealArray() throws {
        let realArrayX: [Double] = [0.0, 1.0, 2.0, 3.0]
        let realArrayY: [Double] = [0.0, 1.0, 2.0, 3.0]
        let realArrayXi: [Double] = [0.5, 1.5, 2.5, 3.0]
        let result: [Double] = interp1(x: realArrayX, y: realArrayY, xi: realArrayXi)
        let expected: [Double] = [0.5, 1.5, 2.5, 3.0]
        XCTAssertEqual(result, expected, accuracy: Double(accuracy), "interp1 failed")
    }

    // MARK: interpft
 /*
    func testInterpftRealArray() throws {
        let realArrayA: RealArray =  [1.0, -1.0, 1.0, -1.0]
        let result: RealArray = interpft(realArrayA, 8)
        let expected: RealArray = [1.0, 0.0, -1.0, 0.0, 1.0, 0.0, -1.0, 0.0]
        XCTAssertEqual(result, expected, accuracy: accuracy, "interpft failed")
    }
*/
    // MARK: sincresample
/*
    func testSincresampleRealArray() throws {
        let realArrayA: RealArray = [-2.1, -2.0, -1.9, -1.5, -1.0, 0.0, 1.0, 1.5, 1.9, 2.0, 2.1]
        let result: RealArray = interp1(realArrayA)
        let expected: RealArray = [-2.0, -2.0, -1.0, -1.0, -1.0, 0.0, 1.0, 2.0, 2.0, 2.0, 3.0]
        XCTAssertEqual(result, expected, accuracy: accuracy, "sincresample failed")
    }
  */

}

