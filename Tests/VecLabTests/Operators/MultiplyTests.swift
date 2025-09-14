//
//  MultiplyTests.swift
//
//
//  Created by Marcus Painter on 25/09/2023.
//

import Foundation
import VecLab
import XCTest

class MultiplyTests: XCTestCase {

    var realA: Real = 1.0
    var realArrayA: RealArray = [1.0, 2.0]
    var complexA: Complex = Complex(1.0, 1.0)
    var SplitComplexArrayA: SplitComplexArray = SplitComplexArray([1.0, 1.0], [1.0, 1.0])

    var realB: Real = 1.0
    var realArrayB: RealArray = [1.0, 2.0]
    var complexB: Complex = Complex(1.0, 1.0)
    var SplitComplexArrayB: SplitComplexArray = SplitComplexArray([1.0, 1.0], [1.0, 1.0])

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
        let result: SplitComplexArray = complexA * realArrayB
        let expected: SplitComplexArray = SplitComplexArray([1.0, 2.0], [1.0, 2.0])
        XCTAssertEqual(result, expected, "Multiply failed")
    }

    func testMultiplyRealArrayComplex() {
        let result: SplitComplexArray = realArrayA * complexB
        let expected: SplitComplexArray = SplitComplexArray([1.0, 2.0], [1.0, 2.0])
        XCTAssertEqual(result, expected, "Multiply failed")
    }

    func testMultiplyComplexArraySplitComplexArray() {
        let result: SplitComplexArray = SplitComplexArrayA * SplitComplexArrayB
        let expected: SplitComplexArray = SplitComplexArray([0.0, 0.0], [2.0, 2.0])
        XCTAssertEqual(result, expected, "Multiply failed")
    }

    func testMultiplySplitComplexArrayReal() {
        let result: SplitComplexArray = SplitComplexArrayA * realB
        let expected: SplitComplexArray = SplitComplexArray([1.0, 1.0], [1.0, 1.0])
        XCTAssertEqual(result, expected, "Multiply failed")
    }

    func testMultiplyRealSplitComplexArray() {
        let result: SplitComplexArray = realA * SplitComplexArrayB
        let expected: SplitComplexArray = SplitComplexArray([1.0, 1.0], [1.0, 1.0])
        XCTAssertEqual(result, expected, "Multiply failed")
    }

    func testMultiplySplitComplexArrayRealArray() {
        let result: SplitComplexArray = SplitComplexArrayA * realArrayB
        let expected: SplitComplexArray = SplitComplexArray([1.0, 2.0], [1.0, 2.0])
        XCTAssertEqual(result, expected, "Multiply failed")
    }

    func testMultiplyRealArraySplitComplexArray() {
        let result: SplitComplexArray = realArrayA * SplitComplexArrayB
        let expected: SplitComplexArray = SplitComplexArray([1.0, 2.0], [1.0, 2.0])
        XCTAssertEqual(result, expected, "Multiply failed")
    }

    func testMultiplySplitComplexArrayComplex() {
        let result: SplitComplexArray = SplitComplexArrayA * complexB
        let expected: SplitComplexArray = SplitComplexArray([0.0, 0.0], [2.0, 2.0])
        XCTAssertEqual(result, expected, "Multiply failed")
    }

    func testMultiplyComplexSplitComplexArray() {
        let result: SplitComplexArray = complexA * SplitComplexArrayB
        let expected: SplitComplexArray = SplitComplexArray([0.0, 0.0], [2.0, 2.0])
        XCTAssertEqual(result, expected, "Multiply failed")
    }
}
