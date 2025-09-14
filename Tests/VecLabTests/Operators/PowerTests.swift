//
//  PowerTests.swift
//
//
//  Created by Marcus Painter on 25/09/2023.
//

import Foundation
import VecLab
import XCTest

class PowerTests: XCTestCase {

    let accuracy: Real = 1e-6

    var realA: Real = 1.0
    var realArrayA: RealArray = [1.0, 2.0]
    var complexA: Complex = Complex(1.0, 1.0)
    var SplitComplexArrayA: SplitComplexArray = SplitComplexArray([1.0, 1.0], [1.0, 1.0])

    var realB: Real = 1.0
    var realArrayB: RealArray = [1.0, 2.0]
    var complexB: Complex = Complex(1.0, 1.0)
    var SplitComplexArrayB: SplitComplexArray = SplitComplexArray([1.0, 1.0], [1.0, 1.0])

    var intA: Int = 2
    var intB: Int = 2

    func testPowerIntInt() {
        let result: Real = intA ** intB
        let expected: Real = 4.0
        XCTAssertEqual(result, expected, accuracy: accuracy, "** failed")
    }

    func testPowerIntReal() {
        let result: Real = intA ** realB
        let expected: Real = 2.0
        XCTAssertEqual(result, expected, accuracy: accuracy, "** failed")
    }

    func testPowerRealInt() {
        let result: Real = realA ** intB
        let expected: Real = 1.0
        XCTAssertEqual(result, expected, accuracy: accuracy, "** failed")
    }

    func testPowerRealArrayInt() {
        let result: RealArray = realArrayA ** intB
        let expected: RealArray = [1.0, 4]
        XCTAssertEqual(result, expected, accuracy: accuracy, "** failed")
    }

    func testPowerComplexInt() {
        let result: Complex = complexA ** intB
        let expected: Complex = Complex(0.0, 2.0)
        XCTAssertEqual(result, expected, accuracy: accuracy, "** failed")
    }

    func testPowerRealReal() {
        let result: Real = realA ** realB
        let expected: Real = 1.0
        XCTAssertEqual(result, expected, accuracy: accuracy, "** failed")
    }

    func testPowerRealArrayRealArray() {
        let result: RealArray = realArrayA ** realArrayB
        let expected: RealArray = [1.0, 4.0]
        XCTAssertEqual(result, expected, accuracy: accuracy, "** failed")
    }

    func testPowerRealArrayReal() {
        let result: RealArray = realArrayA ** realB
        let expected: RealArray = [1.0, 2.0]
        XCTAssertEqual(result, expected, accuracy: accuracy, "** failed")
    }

    func testPowerRealRealArray() {
        let result: RealArray = realA ** realArrayB
        let expected: RealArray = [1.0, 1.0]
        XCTAssertEqual(result, expected, accuracy: accuracy, "** failed")
    }

    func testPowerComplexComplex() {
        let result: Complex = complexA ** complexB
        let expected: Complex = Complex(0.273957253830, 0.583700758759)
        XCTAssertEqual(result, expected, accuracy: accuracy, "** failed")
    }

    func testPowerComplexReal() {
        let result: Complex = complexA ** realB
        let expected: Complex = Complex(1.0, 1.0)
        XCTAssertEqual(result, expected, accuracy: accuracy, "** failed")
    }

    func testPowerRealComplex() {
        let result: Complex = realA ** complexB
        let expected: Complex = Complex(1.0, 0.0)
        XCTAssertEqual(result, expected, accuracy: accuracy, "** failed")
    }

    func testPowerComplexRealArray() {
        let result: SplitComplexArray = complexA ** realArrayB
        let expected: SplitComplexArray = SplitComplexArray([1.0, 0.0], [1.0, 2.0])
        XCTAssertEqual(result, expected, accuracy: accuracy, "** failed")
    }

    func testPowerRealArrayComplex() {
        let result: SplitComplexArray = realArrayA ** complexB
        let expected: SplitComplexArray = SplitComplexArray([1.0, 1.538477802728], [0.0, 1.277922552627])
        XCTAssertEqual(result, expected, accuracy: accuracy, "** failed")
    }

    func testPowerComplexArraySplitComplexArray() {
        let result: SplitComplexArray = SplitComplexArrayA ** SplitComplexArrayB
        let expected: SplitComplexArray = SplitComplexArray([0.273957253830, 0.273957253830], [0.583700758759, 0.583700758759])
        XCTAssertEqual(result, expected, accuracy: accuracy, "Power failed")
    }

    func testPowerSplitComplexArrayReal() {
        let result: SplitComplexArray = SplitComplexArrayA ** realB
        let expected: SplitComplexArray = SplitComplexArray([1.0, 1.0], [1.0, 1.0])
        XCTAssertEqual(result, expected, accuracy: accuracy, "** failed")
    }

    func testPowerRealSplitComplexArray() {
        let result: SplitComplexArray = realA ** SplitComplexArrayB
        let expected: SplitComplexArray = SplitComplexArray([1.0, 1.0], [0.0, 0.0])
        XCTAssertEqual(result, expected, accuracy: accuracy, "** failed")
    }

    func testPowerSplitComplexArrayRealArray() {
        let result: SplitComplexArray = SplitComplexArrayA ** realArrayB
        let expected: SplitComplexArray = SplitComplexArray([1.0, 0.0], [1.0, 2.0])
        XCTAssertEqual(result, expected, accuracy: accuracy, "** failed")
    }

    func testPowerRealArraySplitComplexArray() {
        let result: SplitComplexArray = realArrayA ** SplitComplexArrayB
        let expected: SplitComplexArray = SplitComplexArray([1.0, 1.538477802728], [0.0, 1.277922552627])
        XCTAssertEqual(result, expected, accuracy: accuracy, "** failed")
    }

    func testPowerSplitComplexArrayComplex() {
        let result: SplitComplexArray = SplitComplexArrayA ** complexB
        let expected: SplitComplexArray = SplitComplexArray([0.273957253830, 0.273957253830], [0.583700758759, 0.583700758759])
        XCTAssertEqual(result, expected, accuracy: accuracy, "** failed")
    }

    func testPowerComplexSplitComplexArray() {
        let result: SplitComplexArray = complexA ** SplitComplexArrayB
        let expected: SplitComplexArray = SplitComplexArray([0.273957253830, 0.273957253830], [0.583700758759, 0.583700758759])
        XCTAssertEqual(result, expected, accuracy: accuracy, "** failed")
    }

}
