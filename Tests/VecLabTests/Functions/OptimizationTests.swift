//
//  OptimizationTests.swift
//
//
//  Created by Marcus Painter on 25/09/2023.
//

import Foundation
import VecLab
import XCTest

class OptimizationTests: XCTestCase {

    let accuracy: RealDouble = 1e-3

    // MARK: fminbnd

    func testFminbnd() throws {
        let objective: (RealDouble) -> (RealDouble) = { Darwin.sin($0) }
        let result: RealDouble = fminbnd(objective, x1: 0.0, x2: 2 * .pi)
        let expected: RealDouble = 4.712391081200089
        XCTAssertEqual(result, expected, accuracy: accuracy, "fminbnd failed")
    }

    func testFminbndTol() throws {
        let tol: RealDouble = 10.0
        let objective: (RealDouble) -> (RealDouble) = { Darwin.sin($0) }
        let result: RealDouble = fminbnd(objective, x1: 0.0, x2: 2 * .pi, tol: tol)
        let expected: RealDouble = 4.712391081200089
        XCTAssertEqual(result, expected, accuracy: tol, "fminbnd failed")
    }

    // MARK: fminsearch

    func testFminsearch() throws {
        let objective: (RealDoubleArray) -> RealDouble  = { x in
            return 100.0 * (x[1] - x[0] * x[0]) * (x[1] - x[0] * x[0]) + (1.0 - x[0]) * (1.0 - x[0])
        }

        let x0: RealDoubleArray = [-1.2, 1.0]
        let (result, value) = fminsearch(fun: objective, x0: x0)
        let expected: RealDoubleArray = [1.000022021783570, 1.000042219751772]
        XCTAssertEqual(result, expected, accuracy: accuracy, "fminsearch failed")
        XCTAssertEqual(value, 0.0, accuracy: accuracy, "fminsearch failed")

    }

    func testFminsearch2() throws {
        let objective: (RealDoubleArray) -> RealDouble = { x in
            return x[0] * x[0] + 2.0 * x[0] + 1.0
        }

        let x0: RealDoubleArray = [0.0]
        let (result, value) = fminsearch(fun: objective, x0: x0)
        let expected: RealDoubleArray = [-1.0]
        XCTAssertEqual(result, expected, accuracy: accuracy, "fminsearch failed")
        XCTAssertEqual(value, 0.0, accuracy: accuracy, "fminsearch failed")
    }

}
