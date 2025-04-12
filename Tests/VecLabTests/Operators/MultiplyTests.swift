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

    var realA: Real = 1.0
    var realArrayA: RealArray = [1.0, 2.0]
    var complexA: Complex = Complex(1.0, 1.0)
    var complexArrayA: ComplexArray = ComplexArray([1.0, 1.0], [1.0, 1.0])

    var realB: Real = 1.0
    var realArrayB: RealArray = [1.0, 2.0]
    var complexB: Complex = Complex(1.0, 1.0)
    var complexArrayB: ComplexArray = ComplexArray([1.0, 1.0], [1.0, 1.0])

    func testMultiplyRealReal() {
        let result: Real = realA * realB
        let expected: Real = 1.0
        XCTAssertEqual(result, expected, "Multiply failed")
    }

    func testMultiplyRealArrayRealArray() {
        let result: RealArray = realArrayA * realArrayB
        let expected: RealArray = [1.0, 4.0]
        XCTAssertEqual(result, expected, "Multiply failed")
    }

    func testMultiplyRealArrayReal() {
        let result: RealArray = realArrayA * realB
        let expected: RealArray = [1.0, 2.0]
        XCTAssertEqual(result, expected, "Multiply failed")
    }

    func testMultiplyRealRealArray() {
        let result: RealArray = realA * realArrayB
        let expected: RealArray = [1.0, 2.0]
        XCTAssertEqual(result, expected, "Multiply failed")
    }

    func testMultiplyComplexComplex() {
        let result: Complex = complexA * complexB
        let expected: Complex = Complex(0.0, 2.0)
        XCTAssertEqual(result, expected, "Multiply failed")
    }

    func testMultiplyComplexReal() {
        let result: Complex = complexA * realB
        let expected: Complex = Complex(1.0, 1.0)
        XCTAssertEqual(result, expected, "Multiply failed")
    }

    func testMultiplyRealComplex() {
        let result: Complex = realA * complexB
        let expected: Complex = Complex(1.0, 1.0)
        XCTAssertEqual(result, expected, "Multiply failed")
    }

    func testMultiplyComplexRealArray() {
        let result: ComplexArray = complexA * realArrayB
        let expected: ComplexArray = ComplexArray([1.0, 2.0], [1.0, 2.0])
        XCTAssertEqual(result, expected, "Multiply failed")
    }

    func testMultiplyRealArrayComplex() {
        let result: ComplexArray = realArrayA * complexB
        let expected: ComplexArray = ComplexArray([1.0, 2.0], [1.0, 2.0])
        XCTAssertEqual(result, expected, "Multiply failed")
    }

    func testMultiplyComplexArrayComplexArray() {
        let result: ComplexArray = complexArrayA * complexArrayB
        let expected: ComplexArray = ComplexArray([0.0, 0.0], [2.0, 2.0])
        XCTAssertEqual(result, expected, "Multiply failed")
    }

    func testMultiplyComplexArrayReal() {
        let result: ComplexArray = complexArrayA * realB
        let expected: ComplexArray = ComplexArray([1.0, 1.0], [1.0, 1.0])
        XCTAssertEqual(result, expected, "Multiply failed")
    }

    func testMultiplyRealComplexArray() {
        let result: ComplexArray = realA * complexArrayB
        let expected: ComplexArray = ComplexArray([1.0, 1.0], [1.0, 1.0])
        XCTAssertEqual(result, expected, "Multiply failed")
    }

    func testMultiplyComplexArrayRealArray() {
        let result: ComplexArray = complexArrayA * realArrayB
        let expected: ComplexArray = ComplexArray([1.0, 2.0], [1.0, 2.0])
        XCTAssertEqual(result, expected, "Multiply failed")
    }

    func testMultiplyRealArrayComplexArray() {
        let result: ComplexArray = realArrayA * complexArrayB
        let expected: ComplexArray = ComplexArray([1.0, 2.0], [1.0, 2.0])
        XCTAssertEqual(result, expected, "Multiply failed")
    }

    func testMultiplyComplexArrayComplex() {
        let result: ComplexArray = complexArrayA * complexB
        let expected: ComplexArray = ComplexArray([0.0, 0.0], [2.0, 2.0])
        XCTAssertEqual(result, expected, "Multiply failed")
    }

    func testMultiplyComplexComplexArray() {
        let result: ComplexArray = complexA * complexArrayB
        let expected: ComplexArray = ComplexArray([0.0, 0.0], [2.0, 2.0])
        XCTAssertEqual(result, expected, "Multiply failed")
    }
}
