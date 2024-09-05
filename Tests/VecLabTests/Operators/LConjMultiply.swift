//
//  LConjMultiplyTests.swift
//
//
//  Created by Marcus Painter on 25/09/2023.
//

import Foundation
import XCTest
import VecLab

class LConjMultiplyTests: XCTestCase {

    var realA: RealDouble = 1.0
    var realArrayA: RealDoubleArray = [1.0, 2.0]
    var complexA: ComplexDouble = (1.0, 1.0)
    var complexArrayA: ComplexDoubleArray = ([1.0, 1.0], [1.0, 1.0])

    var realB: RealDouble = 1.0
    var realArrayB: RealDoubleArray = [1.0, 2.0]
    var complexB: ComplexDouble = (1.0, 1.0)
    var complexArrayB: ComplexDoubleArray = ([1.0, 1.0], [1.0, 1.0])

 /*
    func testLConjMultiplyRealReal() {
        let result: RealDouble = realA ~* realB
        let expected: RealDouble = 1.0
        XCTAssertEqual(result, expected, "Left conjugate multiply failed")
    }

    func testLConjMultiplyRealArrayRealArray() {
        let result: RealDoubleArray = realArrayA ~* realArrayB
        let expected: RealDoubleArray = [1.0, 4.0]
        XCTAssertEqual(result, expected, "Left conjugate multiply failed")
    }

    func testLConjMultiplyRealArrayReal() {
        let result: RealDoubleArray = realArrayA ~* realB
        let expected: RealDoubleArray = [1.0, 2.0]
        XCTAssertEqual(result, expected, "Left conjugate multiply failed")
    }

    func testLConjMultiplyRealRealArray() {
        let result: RealDoubleArray = realA ~* realArrayB
        let expected: RealDoubleArray = [1.0, 2.0]
        XCTAssertEqual(result, expected, "Left conjugate multiply failed")
    }
  */
    func testLConjMultiplyComplexComplex() {
        let result: ComplexDouble = complexA ~* complexB
        let expected: ComplexDouble = (2.0, 0.0)
        XCTAssertEqual(result, expected, "Left conjugate multiply failed")
    }

    func testLConjMultiplyComplexReal() {
        let result: ComplexDouble = complexA ~* realB
        let expected: ComplexDouble = (1.0, -1.0)
        XCTAssertEqual(result, expected, "Left conjugate multiply failed")
    }

/*
    func testLConjMultiplyRealComplex() {
        let result: ComplexDouble = realA ~* complexB
        let expected: ComplexDouble = (1.0,1.0)
        XCTAssertEqual(result, expected, "Left conjugate multiply failed")
    }
*/
    func testLConjMultiplyComplexRealArray() {
        let result: ComplexDoubleArray = complexA ~* realArrayB
        let expected: ComplexDoubleArray = ([1.0, 2.0], [-1.0, -2.0])
        XCTAssertEqual(result, expected, "Left conjugate multiply failed")
    }
/*
    func testLConjMultiplyRealArrayComplex() {
        let result: ComplexDoubleArray = realArrayA ~* complexB
        let expected: ComplexDoubleArray = ([1.0, 2.0], [1.0, 2.0])
        XCTAssertEqual(result, expected, "Left conjugate multiply failed")
    }
*/
    func testLConjMultiplyComplexArrayComplexArray() {
        let result: ComplexDoubleArray = complexArrayA ~* complexArrayB
        let expected: ComplexDoubleArray = ([2.0, 2.0], [0.0, 0.0])
        XCTAssertEqual(result, expected, "Left conjugate multiply failed")
    }

    func testLConjMultiplyComplexArrayReal() {
        let result: ComplexDoubleArray = complexArrayA ~* realB
        let expected: ComplexDoubleArray = ([1.0, 1.0], [-1.0, -1.0])
        XCTAssertEqual(result, expected, "Left conjugate multiply failed")
    }
/*
    func testLConjMultiplyRealComplexArray() {
        let result: ComplexDoubleArray = realA ~* complexArrayB
        let expected: ComplexDoubleArray = ([1.0, 1.0], [1.0, 1.0])
        XCTAssertEqual(result, expected, "Left conjugate multiply failed")
    }
*/
    func testLConjMultiplyComplexArrayRealArray() {
        let result: ComplexDoubleArray = complexArrayA ~* realArrayB
        let expected: ComplexDoubleArray = ([1.0, 2.0], [-1.0, -2.0])
        XCTAssertEqual(result, expected, "Left conjugate multiply failed")
    }
/*
    func testLConjMultiplyRealArrayComplexArray() {
        let result: ComplexDoubleArray = realArrayA ~* complexArrayB
        let expected: ComplexDoubleArray = ([1.0, 2.0], [1.0, 2.0])
        XCTAssertEqual(result, expected, "Left conjugate multiply failed")
    }
*/
    func testLConjMultiplyComplexArrayComplex() {
        let result: ComplexDoubleArray = complexArrayA ~* complexB
        let expected: ComplexDoubleArray = ([2.0, 2.0], [0.0, 0.0])
        XCTAssertEqual(result, expected, "Left conjugate multiply failed")
    }

    func testLConjMultiplyComplexComplexArray() {
        let result: ComplexDoubleArray = complexA ~* complexArrayB
        let expected: ComplexDoubleArray = ([2.0, 2.0], [0.0, 0.0])
        XCTAssertEqual(result, expected, "Left conjugate multiply failed")
    }

}
