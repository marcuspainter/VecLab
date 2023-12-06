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

    var realA: Real = 1.0
    var realArrayA: RealArray = [1.0, 2.0]
    var complexA: Complex = (1.0, 1.0)
    var complexArrayA: ComplexArray = ([1.0, 1.0], [1.0, 1.0])

    var realB: Real = 1.0
    var realArrayB: RealArray = [1.0, 2.0]
    var complexB: Complex = (1.0, 1.0)
    var complexArrayB: ComplexArray = ([1.0, 1.0], [1.0, 1.0])

 /*
    func testLConjMultiplyRealReal() {
        let result: Real = realA ~* realB
        let expected: Real = 1.0
        XCTAssertEqual(result, expected, "Left conjugate multiply failed")
    }

    func testLConjMultiplyRealArrayRealArray() {
        let result: RealArray = realArrayA ~* realArrayB
        let expected: RealArray = [1.0, 4.0]
        XCTAssertEqual(result, expected, "Left conjugate multiply failed")
    }

    func testLConjMultiplyRealArrayReal() {
        let result: RealArray = realArrayA ~* realB
        let expected: RealArray = [1.0, 2.0]
        XCTAssertEqual(result, expected, "Left conjugate multiply failed")
    }

    func testLConjMultiplyRealRealArray() {
        let result: RealArray = realA ~* realArrayB
        let expected: RealArray = [1.0, 2.0]
        XCTAssertEqual(result, expected, "Left conjugate multiply failed")
    }
  */
    func testLConjMultiplyComplexComplex() {
        let result: Complex = complexA ~* complexB
        let expected: Complex = (2.0, 0.0)
        XCTAssertEqual(result, expected, "Left conjugate multiply failed")
    }

    func testLConjMultiplyComplexReal() {
        let result: Complex = complexA ~* realB
        let expected: Complex = (1.0, -1.0)
        XCTAssertEqual(result, expected, "Left conjugate multiply failed")
    }

/*
    func testLConjMultiplyRealComplex() {
        let result: Complex = realA ~* complexB
        let expected: Complex = (1.0,1.0)
        XCTAssertEqual(result, expected, "Left conjugate multiply failed")
    }
*/
    func testLConjMultiplyComplexRealArray() {
        let result: ComplexArray = complexA ~* realArrayB
        let expected: ComplexArray = ([1.0, 2.0], [-1.0, -2.0])
        XCTAssertEqual(result, expected, "Left conjugate multiply failed")
    }
/*
    func testLConjMultiplyRealArrayComplex() {
        let result: ComplexArray = realArrayA ~* complexB
        let expected: ComplexArray = ([1.0, 2.0], [1.0, 2.0])
        XCTAssertEqual(result, expected, "Left conjugate multiply failed")
    }
*/
    func testLConjMultiplyComplexArrayComplexArray() {
        let result: ComplexArray = complexArrayA ~* complexArrayB
        let expected: ComplexArray = ([2.0, 2.0], [0.0, 0.0])
        XCTAssertEqual(result, expected, "Left conjugate multiply failed")
    }

    func testLConjMultiplyComplexArrayReal() {
        let result: ComplexArray = complexArrayA ~* realB
        let expected: ComplexArray = ([1.0, 1.0], [-1.0, -1.0])
        XCTAssertEqual(result, expected, "Left conjugate multiply failed")
    }
/*
    func testLConjMultiplyRealComplexArray() {
        let result: ComplexArray = realA ~* complexArrayB
        let expected: ComplexArray = ([1.0, 1.0], [1.0, 1.0])
        XCTAssertEqual(result, expected, "Left conjugate multiply failed")
    }
*/
    func testLConjMultiplyComplexArrayRealArray() {
        let result: ComplexArray = complexArrayA ~* realArrayB
        let expected: ComplexArray = ([1.0, 2.0], [-1.0, -2.0])
        XCTAssertEqual(result, expected, "Left conjugate multiply failed")
    }
/*
    func testLConjMultiplyRealArrayComplexArray() {
        let result: ComplexArray = realArrayA ~* complexArrayB
        let expected: ComplexArray = ([1.0, 2.0], [1.0, 2.0])
        XCTAssertEqual(result, expected, "Left conjugate multiply failed")
    }
*/
    func testLConjMultiplyComplexArrayComplex() {
        let result: ComplexArray = complexArrayA ~* complexB
        let expected: ComplexArray = ([2.0, 2.0], [0.0, 0.0])
        XCTAssertEqual(result, expected, "Left conjugate multiply failed")
    }

    func testLConjMultiplyComplexComplexArray() {
        let result: ComplexArray = complexA ~* complexArrayB
        let expected: ComplexArray = ([2.0, 2.0], [0.0, 0.0])
        XCTAssertEqual(result, expected, "Left conjugate multiply failed")
    }

}
