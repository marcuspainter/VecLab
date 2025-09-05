//
//  SolveTests.swift
//  VecLab
//
//  Created by Marcus Painter on 04/09/2025.
//

import Accelerate
import VecLab
import XCTest

final class SolveTests2: XCTestCase {

    let accuracy: Real = 1e-10

    func testSolve() throws {

        let vtv: [Double] = [
            5, 10, 30, 100,
            10, 30, 100, 354,
            30, 100, 354, 1300,
            100, 354, 1300, 4890,
        ]

        let vt: [Double] = [
            1, 1, 1, 1, 1,
            0, 1, 2, 3, 4,
            0, 1, 4, 9, 16,
            0, 1, 8, 27, 64,
        ]

        let pinvV = solve(vtv, vt, n: 4, nrhs: 5)

        print(pinvV)

        let expected =
            [
                0.985714285714288, 0.057142857142862, -0.085714285714287, 0.057142857142852, -0.014285714285712,
                -1.488095238095230, 1.619047619047562, 0.571428571428572, -1.047619047618996, 0.345238095238073,
                0.642857142857135, -1.071428571428530, -0.142857142857143, 0.928571428571392, -0.357142857142841,
                -0.083333333333332, 0.166666666666660, 0.000000000000000, -0.166666666666660, 0.083333333333331
            ]

        XCTAssertEqual(pinvV, expected, accuracy: accuracy)
        
        let A: [Double] = [
            2, 1, 1,
            1, 3, 2,
            1, 0, 0
        ] // 3x3 row-major

        let B: [Double] = [
            4, 5,
            5, 6,
            6, 7
        ] // 3x2 row-major

        let X = solve(A, B, n: 3, nrhs: 2)
        print("Solution X =", X)  // 3x2 row-major solution
        
        let Y =  [6.0, 7.0,
                  15.0, 17.0,
                  -23.0, -26.0]
        
        XCTAssertEqual(X, Y, accuracy: accuracy)
      
    }
}
