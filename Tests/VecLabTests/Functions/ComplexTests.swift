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
        let complexA: Complex = Complex(3.0, 4.0)
        let result: Real = abs(complexA)
        let expected: Real = 5.0
        XCTAssertEqual(result, expected, accuracy: accuracy, "abs failed")
    }

    func testAbsComplexArray() throws {
        let complexArrayA: ComplexArray = ComplexArray([3.0, 5.0], [4.0, 12.0])
        let result: RealArray = abs(complexArrayA)
        let expected: RealArray = [5.0, 13.0]
        XCTAssertEqual(result, expected, accuracy: accuracy, "abs failed")
    }

    // MARK: angle

    func testAngleComplex() throws {
        let complexA: Complex = Complex(3.0, 4.0)
        let result: Real = angle(complexA)
        let expected: Real = 0.927295218001612
        XCTAssertEqual(result, expected, accuracy: accuracy, "angle failed")
    }

    func testAngleComplexArray() throws {
        let complexArrayA: ComplexArray = ComplexArray([3.0, 5.0], [4.0, 12.0])
        let result: RealArray = angle(complexArrayA)
        let expected: RealArray = [0.927295218001612, 1.176005207095135]
        XCTAssertEqual(result, expected, accuracy: accuracy, "angle failed")
    }

    // MARK: conj

    func testConjComplex() throws {
        let complexA: Complex = Complex(3.0, 4.0)
        let result: Complex = conj(complexA)
        let expected: Complex = Complex(3.0, -4.0)
        XCTAssertEqual(result, expected, accuracy: accuracy, "conj failed")
    }

    func testConjComplexArray() throws {
        let complexArrayA: ComplexArray = ComplexArray([3.0, 5.0], [4.0, 12.0])
        let result: ComplexArray = conj(complexArrayA)
        let expected: ComplexArray = ComplexArray([3.0, 5.0], [-4.0, -12.0])
        XCTAssertEqual(result, expected, accuracy: accuracy, "conj failed")
    }

    // MARK: cplxpair

    // TODO:
    
    // MARK: imag

    func testImagComplex() throws {
        let complexA: Complex = Complex(3.0, 4.0)
        let result: Real = imag(complexA)
        let expected: Real = 4.0
        XCTAssertEqual(result, expected, accuracy: accuracy, "imag failed")
    }

    func testImagComplexArray() throws {
        let complexArrayA: ComplexArray = ComplexArray([3.0, 5.0], [4.0, 12.0])
        let result: RealArray = imag(complexArrayA)
        let expected: RealArray = [4.0, 12.0]
        XCTAssertEqual(result, expected, accuracy: accuracy, "imag failed")
    }

    // MARK: real

    func testRealComplex() throws {
        let complexA: Complex = Complex(3.0, 4.0)
        let result: Real = real(complexA)
        let expected: Real = 3.0
        XCTAssertEqual(result, expected, accuracy: accuracy, "real failed")
    }

    func testRealComplexArray() throws {
        let complexArrayA: ComplexArray = ComplexArray([3.0, 5.0], [4.0, 12.0])
        let result: RealArray = real(complexArrayA)
        let expected: RealArray = [3.0, 5.0]
        XCTAssertEqual(result, expected, accuracy: accuracy, "real failed")
    }

    // MARK: wrapToPi

    func testWrapToPiReal0() throws {
        let realA: Real = 0.0
        let result: Real = wrapToPi(realA)
        let expected: Real = 0.0
        XCTAssertEqual(result, expected, accuracy: accuracy, "wrapToPi failed")
    }

    func testWrapRealToPiPi() throws {
        let realA: Real = Real.pi
        let result: Real = wrapToPi(realA)
        let expected: Real = Real.pi
        XCTAssertEqual(result, expected, accuracy: accuracy, "wrapToPi failed")
    }

    func testWrapToPiRealMinusPi() throws {
        let realA: Real = -Real.pi
        let result: Real = wrapToPi(realA)
        let expected: Real = -Real.pi
        XCTAssertEqual(result, expected, accuracy: accuracy, "wrapToPi failed")
    }

    func testWrapToPiReal2Pi() throws {
        let realA: Real = 2 * Real.pi
        let result: Real = wrapToPi(realA)
        let expected: Real = 0.0
        XCTAssertEqual(result, expected, accuracy: accuracy, "wrapToPi failed")
    }

    func testWrapToPiReal3Pi() throws {
        let realA: Real = 3 * Real.pi
        let result: Real = wrapToPi(realA)
        let expected: Real = Real.pi
        XCTAssertEqual(result, expected, accuracy: accuracy, "wrapToPi failed")
    }
    
    func testWrapToPiRealArray() throws {
        let realArrayA: RealArray = [0.0, .pi, -.pi, 2 * .pi, 3 * .pi]
        let result: RealArray = wrapToPi(realArrayA)
        let expected: RealArray = [0.0, .pi, -.pi, 0.0, .pi]
        XCTAssertEqual(result, expected, accuracy: accuracy, "wrapToPi failed")
    }
    
    // MARK: wrapTo2Pi
    
    func testWrapTo2PiReal2Pi() throws {
        let realA: Real = 2.0 * .pi
        let result: Real = wrapTo2Pi(realA)
        let expected: Real = 2.0 * .pi
        XCTAssertEqual(result, expected, accuracy: accuracy, "wrapTo2Pi failed")
    }
    
    func testWrapTo2PiReal2PiPi() throws {
        let realA: Real = -.pi
        let result: Real = wrapTo2Pi(realA)
        let expected: Real = .pi
        XCTAssertEqual(result, expected, accuracy: accuracy, "wrapTo2Pi failed")
    }


    func testWrapTo2PiRealArray() throws {
        let realArrayA: RealArray = [0.0, 2.0 * .pi, 3.0 * .pi]
        let result: RealArray = wrapTo2Pi(realArrayA)
        let expected: RealArray = [0.0, 2.0 * .pi, .pi]
        XCTAssertEqual(result, expected, accuracy: accuracy, "wrapTo2Pi failed")
    }

    // MARK: unwrap

    func testUnwrapArray() throws {
        let realArrayA: RealArray = [3 * Real.pi, -3 * Real.pi]
        let result: RealArray = unwrap(realArrayA)
        let expected: RealArray = [3 * Real.pi, 3 * Real.pi]
        XCTAssertEqual(result, expected, accuracy: accuracy, "unwrap failed")
    }
    
    func testUnwrapArrayEmpty() throws {
        let realArrayA: RealArray = []
        let result: RealArray = unwrap(realArrayA)
        let expected: RealArray = []
        XCTAssertEqual(result, expected, accuracy: accuracy, "unwrap failed")
    }

}
