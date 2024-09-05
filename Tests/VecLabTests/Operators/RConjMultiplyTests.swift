//
//  RConjMultiplyTests.swift
//
//
//  Created by Marcus Painter on 25/09/2023.
//

import Foundation
import XCTest
import VecLab

class RConjMultiplyTests: XCTestCase {

    var realA: RealDouble = 1.0
    var realArrayA: RealDoubleArray = [1.0, 2.0]
    var complexA: ComplexDouble = (1.0, 1.0)
    var complexArrayA: ComplexDoubleArray = ([1.0, 1.0], [1.0, 1.0])

    var realB: RealDouble = 1.0
    var realArrayB: RealDoubleArray = [1.0, 2.0]
    var complexB: ComplexDouble = (1.0, 1.0)
    var complexArrayB: ComplexDoubleArray = ([1.0, 1.0], [1.0, 1.0])

/*
    func testRConjMultiplyRealReal() {
        let result: RealDouble = realA *~ realB
        let expected: RealDouble = 1.0
        XCTAssertEqual(result, expected, "Right conjugate multiply failed")
    }

    func testRConjMultiplyRealArrayRealArray() {
        let result: RealDoubleArray = realArrayA *~ realArrayB
        let expected: RealDoubleArray = [1.0, 4.0]
        XCTAssertEqual(result, expected, "Right conjugate multiply failed")
    }

    func testRConjMultiplyRealArrayReal() {
        let result: RealDoubleArray = realArrayA *~ realB
        let expected: RealDoubleArray = [1.0, 2.0]
        XCTAssertEqual(result, expected, "Right conjugate multiply failed")
    }

    func testRConjMultiplyRealRealArray() {
        let result: RealDoubleArray = realA *~ realArrayB
        let expected: RealDoubleArray = [1.0, 2.0]
        XCTAssertEqual(result, expected, "Right conjugate multiply failed")
    }
*/
    func testRConjMultiplyComplexComplex() {
        let result: ComplexDouble = complexA *~ complexB
        let expected: ComplexDouble = (2.0, 0.0)
        XCTAssertEqual(result, expected, "Right conjugate multiply failed")
    }
/*
    func testRConjMultiplyComplexReal() {
        let result: ComplexDouble = complexA *~ realB
        let expected: ComplexDouble = (1.0,1.0)
        XCTAssertEqual(result, expected, "Right conjugate multiply failed")
    }
*/
    func testRConjMultiplyRealComplex() {
        let result: ComplexDouble = realA *~ complexB
        let expected: ComplexDouble = (1.0, -1.0)
        XCTAssertEqual(result, expected, "Right conjugate multiply failed")
    }
/*
    func testRConjMultiplyComplexRealArray() {
        let result: ComplexDoubleArray = complexA *~ realArrayB
        let expected: ComplexDoubleArray = ([1.0, 2.0], [1.0, 2.0])
        XCTAssertEqual(result, expected, "Right conjugate multiply failed")
    }
*/
    func testRConjMultiplyRealArrayComplex() {
        let result: ComplexDoubleArray = realArrayA *~ complexB
        let expected: ComplexDoubleArray = ([1.0, 2.0], [-1.0, -2.0])
        XCTAssertEqual(result, expected, "Right conjugate multiply failed")
    }

    func testRConjMultiplyComplexArrayComplexArray() {
        let result: ComplexDoubleArray = complexArrayA *~ complexArrayB
        let expected: ComplexDoubleArray = ([2.0, 2.0], [0.0, 0.0])
        XCTAssertEqual(result, expected, "Right conjugate multiply failed")
    }
/*
    func testRConjMultiplyComplexArrayReal() {
        let result: ComplexDoubleArray = complexArrayA *~ realB
        let expected: ComplexDoubleArray = ([1.0, 1.0], [1.0, 1.0])
        XCTAssertEqual(result, expected, "Right conjugate multiply failed")
    }
*/
    func testRConjMultiplyRealComplexArray() {
        let result: ComplexDoubleArray = realA *~ complexArrayB
        let expected: ComplexDoubleArray = ([1.0, 1.0], [-1.0, -1.0])
        XCTAssertEqual(result, expected, "Right conjugate multiply failed")
    }
/*
    func testRConjMultiplyComplexArrayRealArray() {
        let result: ComplexDoubleArray = complexArrayA *~ realArrayB
        let expected: ComplexDoubleArray = ([1.0, 2.0], [1.0, 2.0])
        XCTAssertEqual(result, expected, "Right conjugate multiply failed")
    }
*/
    func testRConjMultiplyRealArrayComplexArray() {
        let result: ComplexDoubleArray = realArrayA *~ complexArrayB
        let expected: ComplexDoubleArray = ([1.0, 2.0], [-1.0, -2.0])
        XCTAssertEqual(result, expected, "Right conjugate multiply failed")
    }

    func testRConjMultiplyComplexArrayComplex() {
        let result: ComplexDoubleArray = complexArrayA *~ complexB
        let expected: ComplexDoubleArray = ([2.0, 2.0], [0.0, 0.0])
        XCTAssertEqual(result, expected, "Right conjugate multiply failed")
    }

    func testRConjMultiplyComplexComplexArray() {
        let result: ComplexDoubleArray = complexA *~ complexArrayB
        let expected: ComplexDoubleArray = ([2.0, 2.0], [0.0, 0.0])
        XCTAssertEqual(result, expected, "Right conjugate multiply failed")
    }

}
