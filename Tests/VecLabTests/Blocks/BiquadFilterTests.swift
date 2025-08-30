//
//  BiquadFilterTests.swift
//  VecLab
//
//  Created by Marcus Painter on 30/08/2025.
//

import Foundation
import VecLab
import XCTest

class BiquadFilterTests: XCTestCase {
    let accuracy: Real = 1e-6

    func testBiquad1() {
        // Butterworh low-pass
        let b = [4.2443368140232844e-05, 8.488673628046569e-05, 4.2443368140232844e-05]
        let a = [1.0, -1.981488509144573, 0.9816582826171341]
        let bFilter = try! BiquadFilter(b: b, a: a)

        let x1: [Double] = [1, 2, 3, 4, 5] // input signal 1
        let x2: [Double] = [6, 7, 8, 9, 10] // input signal 2
        let xFull: [Double] = cat(x1, x2) // Combined

        // Initial state
        var y1: [Double]
        var y2: [Double]

        // Block filter by parts
        y1 = bFilter.process(x1)
        y2 = bFilter.process(x2)

        // No state - Block 2 fails
        // y1 = filter(b: b, a: a, x: x1)
        // y2 = filter(b: b, a: a, x: x2)

        // Full length filter
        let yFull = filter(b: b, a: a, x: xFull)

        let yBlock = cat(y1, y2)

        XCTAssertEqual(yBlock, yFull, accuracy: accuracy)
    }
}
