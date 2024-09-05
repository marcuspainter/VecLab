//
//  MultiplyTests.swift
//  
//
//  Created by Marcus Painter on 25/09/2023.
//

import Foundation
import XCTest
import VecLab

class MultiplyTests: XCTestCase {

    var realA: RealDouble = 1.0
    var realArrayA: RealDoubleArray = [1.0, 2.0]
    var complexA: ComplexDouble = (1.0, 1.0)
    var complexArrayA: ComplexDoubleArray = ([1.0, 1.0], [1.0, 1.0])

    var realB: RealDouble = 1.0
    var realArrayB: RealDoubleArray = [1.0, 2.0]
    var complexB: ComplexDouble = (1.0, 1.0)
    var complexArrayB: ComplexDoubleArray = ([1.0, 1.0], [1.0, 1.0])

    func testMultiplyRealReal() {
        let result: RealDouble = realA * realB
        let expected: RealDouble = 1.0
        XCTAssertEqual(result, expected, "Multiply failed")
    }

    func testMultiplyRealArrayRealArray() {
        let result: RealDoubleArray = realArrayA * realArrayB
        let expected: RealDoubleArray = [1.0, 4.0]
        XCTAssertEqual(result, expected, "Multiply failed")
    }

    func testMultiplyRealArrayReal() {
        let result: RealDoubleArray = realArrayA * realB
        let expected: RealDoubleArray = [1.0, 2.0]
        XCTAssertEqual(result, expected, "Multiply failed")
    }

    func testMultiplyRealRealArray() {
        let result: RealDoubleArray = realA * realArrayB
        let expected: RealDoubleArray = [1.0, 2.0]
        XCTAssertEqual(result, expected, "Multiply failed")
    }

    func testMultiplyComplexComplex() {
        let result: ComplexDouble = complexA * complexB
        let expected: ComplexDouble = (0.0, 2.0)
        XCTAssertEqual(result, expected, "Multiply failed")
    }

    func testMultiplyComplexReal() {
        let result: ComplexDouble = complexA * realB
        let expected: ComplexDouble = (1.0, 1.0)
        XCTAssertEqual(result, expected, "Multiply failed")
    }

    func testMultiplyRealComplex() {
        let result: ComplexDouble = realA * complexB
        let expected: ComplexDouble = (1.0, 1.0)
        XCTAssertEqual(result, expected, "Multiply failed")
    }

    func testMultiplyComplexRealArray() {
        let result: ComplexDoubleArray = complexA * realArrayB
        let expected: ComplexDoubleArray = ([1.0, 2.0], [1.0, 2.0])
        XCTAssertEqual(result, expected, "Multiply failed")
    }

    func testMultiplyRealArrayComplex() {
        let result: ComplexDoubleArray = realArrayA * complexB
        let expected: ComplexDoubleArray = ([1.0, 2.0], [1.0, 2.0])
        XCTAssertEqual(result, expected, "Multiply failed")
    }

    func testMultiplyComplexArrayComplexArray() {
        let result: ComplexDoubleArray = complexArrayA * complexArrayB
        let expected: ComplexDoubleArray = ([0.0, 0.0], [2.0, 2.0])
        XCTAssertEqual(result, expected, "Multiply failed")
    }

    func testMultiplyComplexArrayReal() {
        let result: ComplexDoubleArray = complexArrayA * realB
        let expected: ComplexDoubleArray = ([1.0, 1.0], [1.0, 1.0])
        XCTAssertEqual(result, expected, "Multiply failed")
    }

    func testMultiplyRealComplexArray() {
        let result: ComplexDoubleArray = realA * complexArrayB
        let expected: ComplexDoubleArray = ([1.0, 1.0], [1.0, 1.0])
        XCTAssertEqual(result, expected, "Multiply failed")
    }

    func testMultiplyComplexArrayRealArray() {
        let result: ComplexDoubleArray = complexArrayA * realArrayB
        let expected: ComplexDoubleArray = ([1.0, 2.0], [1.0, 2.0])
        XCTAssertEqual(result, expected, "Multiply failed")
    }

    func testMultiplyRealArrayComplexArray() {
        let result: ComplexDoubleArray = realArrayA * complexArrayB
        let expected: ComplexDoubleArray = ([1.0, 2.0], [1.0, 2.0])
        XCTAssertEqual(result, expected, "Multiply failed")
    }

    func testMultiplyComplexArrayComplex() {
        let result: ComplexDoubleArray = complexArrayA * complexB
        let expected: ComplexDoubleArray = ([0.0, 0.0], [2.0, 2.0])
        XCTAssertEqual(result, expected, "Multiply failed")
    }

    func testMultiplyComplexComplexArray() {
        let result: ComplexDoubleArray = complexA * complexArrayB
        let expected: ComplexDoubleArray = ([0.0, 0.0], [2.0, 2.0])
        XCTAssertEqual(result, expected, "Multiply failed")
    }
}
