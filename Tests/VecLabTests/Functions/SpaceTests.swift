//
//  SpaceTests.swift
//
//
//  Created by Marcus Painter on 25/09/2023.
//

import VecLab
import XCTest

class SpaceTests: XCTestCase {

    let accuracy: Real = 1e-6

    // MARK: freqspace

    func testFreqspaceHalf() throws {
        let result: RealArray = freqspace(10, .half)
        let expected: RealArray = [0.0, 0.2, 0.4, 0.6, 0.8, 1.0]
        XCTAssertEqual(result, expected, accuracy: accuracy, "freqspace failed")
    }

    func testFreqspaceWhole() throws {
        let result: RealArray = freqspace(10, .whole)
        let expected: RealArray = [0.0, 0.2, 0.4, 0.6, 0.8, 1.0, 1.2, 1.4, 1.6, 1.8]
        XCTAssertEqual(result, expected, accuracy: accuracy, "freqspace failed")
    }

    // MARK: linspace

    func testLinspace() throws {
        let result: RealArray = linspace(1, 4, 4)
        let expected: RealArray = [1.0, 2.0, 3.0, 4.0]
        XCTAssertEqual(result, expected, accuracy: accuracy, "linspace failed")
    }

    func testLinspaceReverse() throws {
        let result: RealArray = linspace(4, 1, 4)
        let expected: RealArray = [4.0, 3.0, 2.0, 1.0]
        XCTAssertEqual(result, expected, "linspace failed")
    }

    func testLinspace0() throws {
        let result: RealArray = linspace(1, 4, 0)
        let expected: RealArray = [1]
        XCTAssertEqual(result, expected, "linspace failed")
    }

    // MARK: logspace

    func testLogspace() throws {
        let result: RealArray = logspace(1, 4, 4)
        let expected: RealArray = [10.0, 100.0, 1000.0, 10000.0]
        XCTAssertEqual(result, expected, "logspace failed")
    }

    func testLogspaceReverse() throws {
        let result: RealArray = logspace(4, 1, 4)
        let expected: RealArray = [10000.0, 1000.0, 100.0, 10.0]
        XCTAssertEqual(result, expected, "logspace failed")
    }

    func testLogspace0() throws {
        let result: RealArray = logspace(1, 4, 0)
        let expected: RealArray = []
        XCTAssertEqual(result, expected, "logspace failed")
    }
}
