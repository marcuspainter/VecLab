//
//  TrigonometryTests.swift
//
//
//  Created by Marcus Painter on 28/09/2023.
//

import Foundation
import VecLab
import XCTest

class TrigonometryTests: XCTestCase {

    let accuracy: RealDouble = 1e-6

    // MARK: acos

    func testAcosRealArray() throws {
        let realArrayX: RealDoubleArray = [1.000000000000000, 0.877582561890373, 0.540302305868140, 0.070737201667703]
        let result: RealDoubleArray = acos(realArrayX)
        let expected: RealDoubleArray = [0.0, 0.5, 1.0, 1.5]
        XCTAssertEqual(result, expected, accuracy: accuracy, "acos failed")
    }

    // MARK: asin

    func testAsinRealArray() throws {
        let realArrayX: RealDoubleArray = [0, 0.479425538604203, 0.841470984807897, 0.997494986604054]
        let result: RealDoubleArray = asin(realArrayX)
        let expected: RealDoubleArray = [0.0, 0.5, 1.0, 1.5]
        XCTAssertEqual(result, expected, accuracy: accuracy, "asin failed")
    }

    // MARK: atan

    func testAtanRealArray() throws {
        let realArrayX: RealDoubleArray =  [0, 0.546302489843790, 1.557407724654902, 14.101419947171719]
        let result: RealDoubleArray = atan(realArrayX)
        let expected: RealDoubleArray =  [0.0, 0.5, 1.0, 1.5]
        XCTAssertEqual(result, expected, accuracy: accuracy, "atan failed")
    }

    // MARK: atan2

    func testAtan2RealArray() throws {

        let realArrayX: RealDoubleArray = [
            0,     // Origin
            1,     // Positive x-axis
            0,     // Positive y-axis
            -1,    // Negative x-axis
            0,     // Negative y-axis
            1,     // First quadrant
            -1,    // Second quadrant
            -1,    // Third quadrant
            1,     // Fourth quadrant
            1,     // Close to positive x-axis
            -1     // Close to negative x-axis
        ]

        let realArrayY: RealDoubleArray = [
            0,     // Origin
            0,     // Positive x-axis
            1,     // Positive y-axis
            0,     // Negative x-axis
            -1,    // Negative y-axis
            1,     // First quadrant
            1,     // Second quadrant
            -1,    // Third quadrant
            -1,    // Fourth quadrant
            0.001, // Close to positive x-axis
            -0.001 // Close to negative x-axis
        ]

        // Results are in radians.
        // Some libraries might return different results for edge cases, so adjust as necessary.
        let expected: RealDoubleArray = [
            0,          // Origin (some libraries might return NaN)
            0,          // Positive x-axis
            Double.pi/2,   // Positive y-axis
            Double.pi,     // Negative x-axis
            -Double.pi/2,  // Negative y-axis
            Double.pi/4,   // First quadrant
            3*Double.pi/4, // Second quadrant
            -3*Double.pi/4,// Third quadrant
            -Double.pi/4,  // Fourth quadrant
            0.001,      // Close to positive x-axis
            -Double.pi + 0.001      // Close to negative x-axis
        ]
        let result: RealDoubleArray = atan2(realArrayY, realArrayX)
        XCTAssertEqual(result, expected, accuracy: accuracy, "atan2 failed")
    }

    // MARK: cos

    func testCosRealArray() throws {
        let realArrayX: RealDoubleArray = [0.0, 0.5, 1.0, 1.5]
        let result: RealDoubleArray = cos(realArrayX)
        let expected: RealDoubleArray = [1.000000000000000, 0.877582561890373, 0.540302305868140, 0.070737201667703]
        XCTAssertEqual(result, expected, accuracy: accuracy, "cos failed")
    }

    func testCosComplex() throws {
        let complexX: ComplexDouble = (1.0, 3.0)
        let result: ComplexDouble = cos(complexX)
        let expected: ComplexDouble = (5.439580991019764, -8.429751080849945)
        XCTAssertEqual(result, expected, accuracy: accuracy, "cos failed")
    }

    func testCosComplexArray() throws {
        let complexArrayX: ComplexDoubleArray = ([1.0, 2.0], [3.0, 4.0])
        let result: ComplexDoubleArray = cos(complexArrayX)
        let expected: ComplexDoubleArray = ([5.439580991019764, -11.364234706401060], [-8.429751080849945, -24.814651485634183])
        XCTAssertEqual(result, expected, accuracy: accuracy, "cos failed")
    }

    // MARK: sin

    func testSinRealArray() throws {
        let realArrayX: RealDoubleArray = [0.0, 0.5, 1.0, 1.5]
        let result: RealDoubleArray = sin(realArrayX)
        let expected: RealDoubleArray = [0, 0.479425538604203, 0.841470984807897, 0.997494986604054]
        XCTAssertEqual(result, expected, accuracy: accuracy, "sin failed")
    }

    func testSinComplex() throws {
        let complexX: ComplexDouble = (1.0, 3.0)
        let result: ComplexDouble = sin(complexX)
        let expected: ComplexDouble = (8.471645454300148, 5.412680923178193)
        XCTAssertEqual(result, expected, accuracy: accuracy, "sin failed")
    }

    func testSinComplexArray() throws {
        let complexArrayX: ComplexDoubleArray = ([1.0, 2.0], [3.0, 4.0])
        let result: ComplexDoubleArray = sin(complexArrayX)
        let expected: ComplexDoubleArray = ([8.471645454300148, 24.831305848946378], [5.412680923178193, -11.356612711218173])
        XCTAssertEqual(result, expected, accuracy: accuracy, "sin failed")
    }

    // MARK: tan

    func testTanRealArray() throws {
        let realArrayX: RealDoubleArray = [0.0, 0.5, 1.0, 1.5]
        let result: RealDoubleArray = tan(realArrayX)
        let expected: RealDoubleArray = [0, 0.546302489843790, 1.557407724654902, 14.101419947171719]
        XCTAssertEqual(result, expected, accuracy: accuracy, "tan failed")
    }

    func testTanComplex() throws {
        let complexX: ComplexDouble = (1.0, 3.0)
        let result: ComplexDouble = tan(complexX)
        let expected: ComplexDouble = (0.004517137276658, 1.002054988245812)
        XCTAssertEqual(result, expected, accuracy: accuracy, "tan failed")
    }

    func testTanComplexArray() throws {
        let complexArrayX: ComplexDoubleArray = ([1.0, 2.0], [3.0, 4.0])
        let result: ComplexDoubleArray = tan(complexArrayX)
        let expected: ComplexDoubleArray = ([0.004517137276658, -0.000507980623470], [1.002054988245812, 1.000438513202052])
        XCTAssertEqual(result, expected, accuracy: accuracy, "tan failed")
    }
}
