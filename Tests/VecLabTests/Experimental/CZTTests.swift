//
//  CSTTests.swift
//  VecLab
//
//  Created by Marcus Painter on 30/04/2025.
//

import Accelerate
import XCTest

@testable import VecLab

final class CZTTests: XCTestCase {

    func testCZTeven() throws {
        let x: [Double] = [1, 2, 3, 4, 5, 6, 7, 8]
        let z = ComplexArray(realOnly: x)
        let g = czt(z)
        let xx = iczt(g)
        disp(g)
        disp(xx)
    }

    func testCztOdd() throws {
        let x: [Double] = [1, 2, 3, 4, 5, 6, 7]
        let z = ComplexArray(realOnly: x)
        let g = czt(z)
        let xx = iczt(g)
        disp(g)
        disp(xx)
    }
}
