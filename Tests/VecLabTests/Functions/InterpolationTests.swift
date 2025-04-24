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
    
    func testDownsampleBy2() {
        let input: [Double] = [10, 20, 30, 40, 50, 60]
        let expected: [Double] = [10, 30, 50]
        let result = downsample(input, 2)

        XCTAssertEqual(result, expected, accuracy: 1e-10)
    }

    func testDownsampleBy3WithPhase1() {
        let input: [Double] = [1, 2, 3, 4, 5, 6, 7]
        let expected: [Double] = [2, 5]
        let result = downsample(input, 3, 1)

        XCTAssertEqual(result, expected, accuracy: 1e-10)
    }

    func testDownsampleBy1ReturnsSame() {
        let input: [Double] = [3, 1, 4, 1, 5]
        let result = downsample(input, 1)
        XCTAssertEqual(result, input, accuracy: 1e-10)
    }

    func testEmptyInput() {
        let input: [Double] = []
        let result = downsample(input, 2)
        XCTAssertTrue(result.isEmpty)
    }

    func testPhaseBeyondLength() {
        let input: [Double] = [1, 2, 3]
        let result = downsample(input, 2, 5) // phase % factor = 1
        let expected: [Double] = [2]
        XCTAssertEqual(result, expected, accuracy: 1e-10)
    }
    
    func testDownsampleWithPhases() {
        let input: [Double] = [0, 1, 2, 3, 4, 5, 6, 7, 8, 9]
        let factor = 3

        // Phase 0: [0, 3, 6, 9]
        XCTAssertEqual(downsample(input, factor, 0), [0, 3, 6, 9], accuracy: 1e-10)

        // Phase 1: [1, 4, 7]
        XCTAssertEqual(downsample(input, factor, 1), [1, 4, 7], accuracy: 1e-10)

        // Phase 2: [2, 5, 8]
        XCTAssertEqual(downsample(input, factor, 2), [2, 5, 8], accuracy: 1e-10)
    }
    
    func testDownsampleWithPhases2() {
        let input: [Double] = Array(0..<10)
        let factor = 3

        // Direct values
        XCTAssertEqual(downsample(input, factor, 0), [0, 3, 6, 9], accuracy: 1e-10)
        XCTAssertEqual(downsample(input, factor, 1), [1, 4, 7], accuracy: 1e-10)
        XCTAssertEqual(downsample(input, factor, 2), [2, 5, 8], accuracy: 1e-10)

        // Phase > factor: should wrap via `phase % factor`
        XCTAssertEqual(downsample(input, factor, 3), [0, 3, 6, 9], accuracy: 1e-10)
        XCTAssertEqual(downsample(input, factor, 4), [1, 4, 7], accuracy: 1e-10)
        XCTAssertEqual(downsample(input, factor, 5), [2, 5, 8], accuracy: 1e-10)
        XCTAssertEqual(downsample(input, factor, 6), [0, 3, 6, 9], accuracy: 1e-10)
    }

}

