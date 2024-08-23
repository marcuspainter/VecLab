//
//  PowerTests.swift
//
//
//  Created by Marcus Painter on 25/09/2023.
//

import Foundation
import XCTest
import VecLab

class PowerTests: XCTestCase {

    let accuracy: Real = 1e-6

    var realA: Real = 1.0
    var realArrayA: RealArray = [1.0, 2.0]
    var complexA: Complex = (1.0, 1.0)
    var complexArrayA: ComplexArray = ([1.0, 1.0], [1.0, 1.0])

    var realB: Real = 1.0
    var realArrayB: RealArray = [1.0, 2.0]
    var complexB: Complex = (1.0, 1.0)
    var complexArrayB: ComplexArray = ([1.0, 1.0], [1.0, 1.0])

    var intA = 2
    var intB = 2

    func testPowerRealInt() {
        let result: Real = realA ** intB
        let expected: Real = 1.0
        XCTAssertEqual(result, expected, accuracy: accuracy, "Power failed")
    }

    func testPowerRealArrayInt() {
        let result: RealArray = realArrayA ** intB
        let expected: RealArray = [1.0, 4]
        XCTAssertEqual(result, expected, accuracy: accuracy, "Power failed")
    }

    func testPowerComplexInt() {
        let result: Complex = complexA ** intB
        let expected: Complex = (0.0, 2.0)
        XCTAssertEqual(result, expected, accuracy: accuracy, "Power failed")
    }

    func testPowerRealReal() {
        let result: Real = realA ** realB
        let expected: Real = 1.0
        XCTAssertEqual(result, expected, accuracy: accuracy, "Power failed")
    }

    func testPowerRealArrayRealArray() {
        let result: RealArray = realArrayA ** realArrayB
        let expected: RealArray = [1.0, 4.0]
        XCTAssertEqual(result, expected, accuracy: accuracy, "Power failed")
    }

    func testPowerRealArrayReal() {
        let result: RealArray = realArrayA ** realB
        let expected: RealArray = [1.0, 2.0]
        XCTAssertEqual(result, expected, accuracy: accuracy, "Power failed")
    }

    func testPowerRealRealArray() {
        let result: RealArray = realA ** realArrayB
        let expected: RealArray = [1.0, 1.0]
        XCTAssertEqual(result, expected, accuracy: accuracy, "Power failed")
    }
/*
    func testPowerComplexComplex() {
        let result: Complex = complexA ** complexB
        let expected: Complex = (0.273957253830, 0.583700758759)
        XCTAssertEqual(result, expected, accuracy: accuracy, "Power failed")
    }
*/
    func testPowerComplexReal() {
        let result: Complex = complexA ** realB
        let expected: Complex = (1.0, 1.0)
        XCTAssertEqual(result, expected, accuracy: accuracy, "Power failed")
    }

    func testPowerRealComplex() {
        let result: Complex = realA ** complexB
        let expected: Complex = (1.0, 0.0)
        XCTAssertEqual(result, expected, accuracy: accuracy, "Power failed")
    }

    func testPowerComplexRealArray() {
        let result: ComplexArray = complexA ** realArrayB
        let expected: ComplexArray = ([1.0, 0.0], [1.0, 2.0])
        XCTAssertEqual(result, expected, accuracy: accuracy, "Power failed")
    }

    func testPowerRealArrayComplex() {
        let result: ComplexArray = realArrayA ** complexB
        let expected: ComplexArray = ([1.0, 1.538477802728], [0.0, 1.277922552627])
        XCTAssertEqual(result, expected, accuracy: accuracy, "Power failed")
    }
/*
    func testPowerComplexArrayComplexArray() {
        let result: ComplexArray = complexArrayA ** complexArrayB
        let expected: ComplexArray = ([0.273957253830, 0.273957253830], [0.583700758759, 0.583700758759])
        XCTAssertEqual(result, expected, accuracy: accuracy, "Power failed")
    }
*/
    func testPowerComplexArrayReal() {
        let result: ComplexArray = complexArrayA ** realB
        let expected: ComplexArray = ([1.0, 1.0], [1.0, 1.0])
        XCTAssertEqual(result, expected, accuracy: accuracy, "Power failed")
    }

    func testPowerRealComplexArray() {
        let result: ComplexArray = realA ** complexArrayB
        let expected: ComplexArray = ([1.0, 1.0], [0.0, 0.0])
        XCTAssertEqual(result, expected, accuracy: accuracy, "Power failed")
    }

    func testPowerComplexArrayRealArray() {
        let result: ComplexArray = complexArrayA ** realArrayB
        let expected: ComplexArray = ([1.0, 0.0], [1.0, 2.0])
        XCTAssertEqual(result, expected, accuracy: accuracy, "Power failed")
    }

    func testPowerRealArrayComplexArray() {
        let result: ComplexArray = realArrayA ** complexArrayB
        let expected: ComplexArray = ([1.0, 1.538477802728], [0.0, 1.277922552627])
        XCTAssertEqual(result, expected, accuracy: accuracy, "Power failed")
    }
/*
    func testPowerComplexArrayComplex() {
        let result: ComplexArray = complexArrayA ** complexB
        let expected: ComplexArray = ([0.273957253830, 0.273957253830], [0.583700758759, 0.583700758759])
        XCTAssertEqual(result, expected, accuracy: accuracy, "Power failed")
    }

    func testPowerComplexComplexArray() {
        let result: ComplexArray = complexA ** complexArrayB
        let expected: ComplexArray = ([0.273957253830, 0.273957253830], [0.583700758759, 0.583700758759])
        XCTAssertEqual(result, expected, accuracy: accuracy, "Power failed")
    }
 */
}
