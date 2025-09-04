//
//  DoubleArrayMathAssignmentTests.swift
//  VecLab
//
//  Created by Marcus Painter on 02/09/2025.
//

import VecLab
import XCTest

final class DoubleArrayMathAssignmentTests: XCTestCase {

    func testOperators() throws {

        let realA: Double = 1.0
        var realArrayA: [Double] = [1.0, 2.0, 3.0]
        let realArrayB: [Double] = [4.0, 5.0, 6.0]

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
