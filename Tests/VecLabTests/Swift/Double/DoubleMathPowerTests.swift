//
//  DoubleMathPowerTests.swift
//  VecLab
//
//  Created by Marcus Painter on 02/09/2025.
//

import VecLab
import XCTest

final class DoubleMathPowerTests: XCTestCase {

    func testPower() throws {

        // Double ^ Double
        XCTAssertEqual(2.0 ** 3.0, 8.0)
        XCTAssertEqual(4.0 ** 0.5, 2.0)

        // Double ^ Int
        XCTAssertEqual(2.0 ** 3, 8.0)
        XCTAssertEqual(5.0 ** 0, 1.0)

        // Int ^ Double
        XCTAssertEqual(2 ** 3.0, 8.0)
        XCTAssertEqual(9 ** 0.5, 3.0)
    }
}
