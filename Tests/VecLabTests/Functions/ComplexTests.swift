//
//  ComplexTests.swift
//
//
//  Created by Marcus Painter on 25/09/2023.
//

import XCTest
import VecLab

class ComplexTests: XCTestCase {

    let accuracy: Real = 1e-6

    // MARK: abs

    func testAbsComplex() throws {
        let complexA: Complex = (3.0, 4.0)
        let result: Real = abs(complexA)
        let expected: Real = 5.0
        XCTAssertEqual(result, expected, accuracy: accuracy, "abs failed")
    }

    func testAbsComplexArray() throws {
        let complexArrayA: ComplexArray = ([3.0, 5.0], [4.0, 12.0])
        let result: RealArray = abs(complexArrayA)
        let expected: RealArray = [5.0, 13.0]
        XCTAssertEqual(result, expected, accuracy: accuracy, "abs failed")
    }

    // MARK: angle

    func testAngleComplex() throws {
        let complexA: Complex = (3.0, 4.0)
        let result: Real = angle(complexA)
        let expected: Real = 0.927295218001612
        XCTAssertEqual(result, expected, accuracy: accuracy, "angle failed")
    }

    func testAngleComplexArray() throws {
        let complexArrayA: ComplexArray = ([3.0, 5.0], [4.0, 12.0])
        let result: RealArray = angle(complexArrayA)
        let expected: RealArray = [0.927295218001612, 1.176005207095135]
        XCTAssertEqual(result, expected, accuracy: accuracy, "angle failed")
    }

    // MARK: conj

    func testConjComplex() throws {
        let complexA: Complex = (3.0, 4.0)
        let result: Complex = conj(complexA)
        let expected: Complex = (3.0, -4.0)
        XCTAssertEqual(result, expected, accuracy: accuracy, "conj failed")
    }

    func testConjComplexArray() throws {
        let complexArrayA: ComplexArray = ([3.0, 5.0], [4.0, 12.0])
        let result: ComplexArray = conj(complexArrayA)
        let expected: ComplexArray = ([3.0, 5.0], [-4.0, -12.0])
        XCTAssertEqual(result, expected, accuracy: accuracy, "conj failed")
    }

    // MARK: cplxpair

    func testCplxpairComplexArray() throws {
        let complexArrayA: ComplexArray = (
            [1.0, 2.0, 3.0, 4.0, 1.0, 2.0, 3.0, 4.0],
            [1.0, 2.0, 3.0, 4.0, -1.0, -2.0, -3.0, -4.0]
            )
        let result: ComplexArray = cplxpair(complexArrayA)
        let expected: ComplexArray = (
            [1.0, 1.0, 2.0, 2.0, 3.0, 3.0, 4.0, 4.0],
            [1.0, -1.0, 2.0, -2.0, 3.0, -3.0, 4.0, -4.0]
            )
        XCTAssertEqual(result, expected, accuracy: accuracy, "cplxpair failed")
    }

    func testCplxpairComplexArray1() throws {
        let complexArrayA: ComplexArray = (
            [2.0, 1.0, 3.0, 4.0, 1.0, 2.0, 3.0, 4.0],
            [-2.0, 1.0, 3.0, 4.0, -1.0, 2.0, -3.0, -4.0]
        )
        let result: ComplexArray = cplxpair(complexArrayA)

        let expected: ComplexArray = (
            [1.0, 1.0, 2.0, 2.0, 3.0, 3.0, 4.0, 4.0],
            [1.0, -1.0, 2.0, -2.0, 3.0, -3.0, 4.0, -4.0]
            )
        XCTAssertEqual(result, expected, accuracy: accuracy, "cplxpair failed")
    }

    // MARK: imag

    func testImagComplex() throws {
        let complexA: Complex = (3.0, 4.0)
        let result: Real = imag(complexA)
        let expected: Real = 4.0
        XCTAssertEqual(result, expected, accuracy: accuracy, "imag failed")
    }

    func testImagComplexArray() throws {
        let complexArrayA: ComplexArray = ([3.0, 5.0], [4.0, 12.0])
        let result: RealArray = imag(complexArrayA)
        let expected: RealArray = [4.0, 12.0]
        XCTAssertEqual(result, expected, accuracy: accuracy, "imag failed")
    }

    // MARK: real

    func testRealComplex() throws {
        let complexA: Complex = (3.0, 4.0)
        let result: Real = real(complexA)
        let expected: Real = 3.0
        XCTAssertEqual(result, expected, accuracy: accuracy, "real failed")
    }

    func testRealComplexArray() throws {
        let complexArrayA: ComplexArray = ([3.0, 5.0], [4.0, 12.0])
        let result: RealArray = real(complexArrayA)
        let expected: RealArray = [3.0, 5.0]
        XCTAssertEqual(result, expected, accuracy: accuracy, "real failed")
    }

    // MARK: wrap

    func testWrapReal0() throws {
        let realA: Real = 0.0
        let result: Real = wrap(realA)
        let expected: Real = 0.0
        XCTAssertEqual(result, expected, accuracy: accuracy, "wrap failed")
    }

    func testWrapRealPi() throws {
        let realA: Real = Real.pi
        let result: Real = wrap(realA)
        let expected: Real = Real.pi
        XCTAssertEqual(result, expected, accuracy: accuracy, "wrap failed")
    }

    func testWrapRealMinusPi() throws {
        let realA: Real = -Real.pi
        let result: Real = wrap(realA)
        let expected: Real = -Real.pi
        XCTAssertEqual(result, expected, accuracy: accuracy, "wrap failed")
    }

    func testWrapReal2Pi() throws {
        let realA: Real = 2 * Real.pi
        let result: Real = wrap(realA)
        let expected: Real = 0.0
        XCTAssertEqual(result, expected, accuracy: accuracy, "wrap failed")
    }

    func testWrapReal3Pi() throws {
        let realA: Real = 3 * Real.pi
        let result: Real = wrap(realA)
        let expected: Real = Real.pi
        XCTAssertEqual(result, expected, accuracy: accuracy, "wrap failed")
    }

    // MARK: unwrap

    func testUnwrapArray() throws {
        let realArrayA: RealArray = [3 * Real.pi, -3 * Real.pi]
        let result: RealArray = unwrap(realArrayA)
        let expected: RealArray = [3 * Real.pi, 3 * Real.pi]
        XCTAssertEqual(result, expected, accuracy: accuracy, "unwrap failed")
    }

}
