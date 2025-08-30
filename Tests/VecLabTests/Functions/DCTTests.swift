//
//  DCTTests.swift
//  VecLab
//
//  Created by Marcus Painter on 29/08/2025.
//

import Accelerate
import VecLab
import XCTest

final class DCTTests: XCTestCase {
    let accuracy: Real = 1e-6

    func testDct() throws {
        let realArrayA: RealArray = [1.0, 2.0, 3.0, 4.0, 5.0, 6.0, 7.0, 8.0]
        let result: RealArray = dct(realArrayA)
        let expected: RealArray = [12.727922061357857,
                                   -6.442323022705137,
                                   0,
                                   -0.673454800903941,
                                   0,
                                   -0.200902903735997,
                                   0,
                                   -0.050702322759646]

        XCTAssertEqual(result, expected, accuracy: accuracy, "dct failed")
    }

    func testIdct() throws {
        let realArrayA: RealArray = [12.727922061357857,
                                     -6.442323022705137,
                                     0,
                                     -0.673454800903941,
                                     0,
                                     -0.200902903735997,
                                     0,
                                     -0.050702322759646]

        let result: RealArray = idct(realArrayA)
        let expected: RealArray = [1.0, 2.0, 3.0, 4.0, 5.0, 6.0, 7.0, 8.0]

        XCTAssertEqual(result, expected, accuracy: accuracy, "idct failed")
    }
    
    func testDctIdct() throws {
        let realArrayA: RealArray = [1.0, 2.0, 3.0, 4.0, 5.0, 6.0, 7.0, 8.0]
        let result: RealArray = idct(dct(realArrayA))
        let expected: RealArray = realArrayA

        XCTAssertEqual(result, expected, accuracy: accuracy, "dct/idct failed")
    }
}
