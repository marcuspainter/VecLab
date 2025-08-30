//
//  NewTests.swift
//  VecLab
//
//  Created by Marcus Painter on 30/08/2025.
//

import VecLab
import XCTest

class NewTests: XCTestCase {
    let accuracy: Real = 1e-6

    // MARK: Conv

    func testConvSame() throws {
        let a: [Double] = [1, 2, 3, 4, 5, 6, 7, 8]
        let result = conv(a, a, shape: .same)
        let expected: [Double] = [35, 56, 84, 120, 147, 164, 170, 164]
        XCTAssertEqual(result, expected, accuracy: accuracy, "conv failed")
        disp(result)
    }

    func testConvFull() throws {
        let a: [Double] = [1, 2, 3, 4, 5, 6, 7, 8]
        let result = conv(a, a, shape: .full)
        let expected: [Double] = [1, 4, 10, 20, 35, 56, 84, 120, 147, 164, 170, 164, 145, 112, 64]
        XCTAssertEqual(result, expected, accuracy: accuracy, "conv failed")
        disp(result)
    }

    func testXcorr() throws {
        let a: [Double] = [1, 2, 3, 4, 5, 6, 7, 8]
        let result = xcorr(a, a)
        let expected: [Double] = [
            8,
            23,
            44,
            70,
            100,
            133,
            168,
            204,
            168,
            133,
            100,
            70,
            44,
            23,
            8
        ]
        XCTAssertEqual(result, expected, accuracy: accuracy, "xcorr failed")
        disp(result)
    }
}
