//
//  ComplexTests.swift
//
//
//  Created by Marcus Painter on 25/09/2023.
//

import XCTest
import VecLab

class ComplexTests: XCTestCase {

    let accuracy: RealDouble = 1e-6

    // MARK: abs

    func testAbsComplex() throws {
        let complexA: ComplexDouble = (3.0, 4.0)
        let result: RealDouble = abs(complexA)
        let expected: RealDouble = 5.0
        XCTAssertEqual(result, expected, accuracy: accuracy, "abs failed")
    }

    func testAbsComplexArray() throws {
        let complexArrayA: ComplexDoubleArray = ([3.0, 5.0], [4.0, 12.0])
        let result: RealDoubleArray = abs(complexArrayA)
        let expected: RealDoubleArray = [5.0, 13.0]
        XCTAssertEqual(result, expected, accuracy: accuracy, "abs failed")
    }

    // MARK: angle

    func testAngleComplex() throws {
        let complexA: ComplexDouble = (3.0, 4.0)
        let result: RealDouble = angle(complexA)
        let expected: RealDouble = 0.927295218001612
        XCTAssertEqual(result, expected, accuracy: accuracy, "angle failed")
    }

    func testAngleComplexArray() throws {
        let complexArrayA: ComplexDoubleArray = ([3.0, 5.0], [4.0, 12.0])
        let result: RealDoubleArray = angle(complexArrayA)
        let expected: RealDoubleArray = [0.927295218001612, 1.176005207095135]
        XCTAssertEqual(result, expected, accuracy: accuracy, "angle failed")
    }

    // MARK: conj

    func testConjComplex() throws {
        let complexA: ComplexDouble = (3.0, 4.0)
        let result: ComplexDouble = conj(complexA)
        let expected: ComplexDouble = (3.0, -4.0)
        XCTAssertEqual(result, expected, accuracy: accuracy, "conj failed")
    }

    func testConjComplexArray() throws {
        let complexArrayA: ComplexDoubleArray = ([3.0, 5.0], [4.0, 12.0])
        let result: ComplexDoubleArray = conj(complexArrayA)
        let expected: ComplexDoubleArray = ([3.0, 5.0], [-4.0, -12.0])
        XCTAssertEqual(result, expected, accuracy: accuracy, "conj failed")
    }

    // MARK: cplxpair

    // TODO:
    
    // MARK: imag

    func testImagComplex() throws {
        let complexA: ComplexDouble = (3.0, 4.0)
        let result: RealDouble = imag(complexA)
        let expected: RealDouble = 4.0
        XCTAssertEqual(result, expected, accuracy: accuracy, "imag failed")
    }

    func testImagComplexArray() throws {
        let complexArrayA: ComplexDoubleArray = ([3.0, 5.0], [4.0, 12.0])
        let result: RealDoubleArray = imag(complexArrayA)
        let expected: RealDoubleArray = [4.0, 12.0]
        XCTAssertEqual(result, expected, accuracy: accuracy, "imag failed")
    }

    // MARK: RealDouble

    func testRealComplex() throws {
        let complexA: ComplexDouble = (3.0, 4.0)
        let result: RealDouble = real(complexA)
        let expected: RealDouble = 3.0
        XCTAssertEqual(result, expected, accuracy: accuracy, "real failed")
    }

    func testRealComplexArray() throws {
        let complexArrayA: ComplexDoubleArray = ([3.0, 5.0], [4.0, 12.0])
        let result: RealDoubleArray = real(complexArrayA)
        let expected: RealDoubleArray = [3.0, 5.0]
        XCTAssertEqual(result, expected, accuracy: accuracy, "real failed")
    }

    // MARK: wrap

    func testWrapReal0() throws {
        let realA: RealDouble = 0.0
        let result: RealDouble = wrapToPi(realA)
        let expected: RealDouble = 0.0
        XCTAssertEqual(result, expected, accuracy: accuracy, "wrapToPi failed")
    }

    func testWrapRealPi() throws {
        let realA: RealDouble = Double.pi
        let result: RealDouble = wrapToPi(realA)
        let expected: RealDouble = Double.pi
        XCTAssertEqual(result, expected, accuracy: accuracy, "wrapToPi failed")
    }

    func testWrapRealMinusPi() throws {
        let realA: RealDouble = -Double.pi
        let result: RealDouble = wrapToPi(realA)
        let expected: RealDouble = -Double.pi
        XCTAssertEqual(result, expected, accuracy: accuracy, "wrapToPi failed")
    }

    func testWrapReal2Pi() throws {
        let realA: RealDouble = 2 * Double.pi
        let result: RealDouble = wrapToPi(realA)
        let expected: RealDouble = 0.0
        XCTAssertEqual(result, expected, accuracy: accuracy, "wrapToPi failed")
    }

    func testWrapReal3Pi() throws {
        let realA: RealDouble = 3 * Double.pi
        let result: RealDouble = wrapToPi(realA)
        let expected: RealDouble = Double.pi
        XCTAssertEqual(result, expected, accuracy: accuracy, "wrapToPi failed")
    }

    // MARK: unwrap

    func testUnwrapArray() throws {
        let realArrayA: RealDoubleArray = [3 * Double.pi, -3 * Double.pi]
        let result: RealDoubleArray = unwrap(realArrayA)
        let expected: RealDoubleArray = [3 * Double.pi, 3 * Double.pi]
        XCTAssertEqual(result, expected, accuracy: accuracy, "unwrap failed")
    }

}
