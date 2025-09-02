//
//  DoubleArrayOperatorTests.swift
//  VecLab
//
//  Created by Marcus Painter on 02/09/2025.
//

import VecLab
import XCTest

final class DoubleArrayOperatorTests: XCTestCase {

    func testOperators() throws {

        var realA: Double = 1.0
        var realArrayA: [Double] = [1.0, 2.0, 3.0]
        let realArrayB: [Double] = [4.0, 5.0, 6.0]
        let realArrayC: [Double] = [0.0, 0.0, 0.0]

        realArrayA += realArrayB
        realArrayA -= realArrayB
        realArrayA *= realArrayB
        realArrayA /= realArrayB

        realArrayA += realA
        realArrayA -= realA
        realArrayA *= realA
        realArrayA /= realA

    }
}
