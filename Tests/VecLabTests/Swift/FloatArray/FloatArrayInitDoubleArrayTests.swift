//
//  FloatArrayInitDoubleArrayTests.swift
//  VecLab
//
//  Created by Marcus Painter on 02/09/2025.
//

import VecLab
import XCTest

final class FloatArrayInitDoubleArrayTests: XCTestCase {

    func testInit() throws {

        let floats: [Float] = [1.0, 2.0, 3.0, 4.0]
        let doubles: [Double] = [1.0, 2.0, 3.0, 4.0]
        let newFloats = [Float](doubleArray: doubles)

        XCTAssertEqual(newFloats, floats)
    }
}
