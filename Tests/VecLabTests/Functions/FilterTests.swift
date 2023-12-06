//
//  FilterTests.swift
//
//
//  Created by Marcus Painter on 25/09/2023.
//

import XCTest
import VecLab

class FilterTests: XCTestCase {

    let accuracy: Real = 1e-6

    // MARK: filter

    func testFilter() throws {
        let realArrayA: RealArray = [1.000000000000000, -0.000000000000000, 0.171572875253810]
        let realArrayB: RealArray = [0.292893218813452, 0.585786437626905, 0.292893218813452]
        let realArrayX: RealArray = [1.0, 2.0, 3.0, 4.0, 5.0, 6.0, 7.0, 8.0]
        let result: RealArray = filter(realArrayB, realArrayA, realArrayX)
        let expected: RealArray = [
           0.292893218813452,
           1.171572875253810,
           2.292893218813452,
           3.313708498984760,
           4.292893218813452,
           5.289321881345248,
           6.292893218813452,
           7.293505963451373
       ]
        XCTAssertEqual(result, expected, accuracy: accuracy, "filter failed")
    }

    func testFilterZ2() throws {
        let realArrayA: RealArray = [1]
        let realArrayB: RealArray = [0, 0, 1]
        let realArrayX: RealArray = [1.0, 2.0, 3.0, 4.0, 5.0, 6.0, 7.0, 8.0]
        let result: RealArray = filter(realArrayB, realArrayA, realArrayX)
        let expected: RealArray = [0.0, 0.0, 1.0, 2.0, 3.0, 4.0, 5.0, 6.0]

        XCTAssertEqual(result, expected, accuracy: accuracy, "filter failed")
    }

}
