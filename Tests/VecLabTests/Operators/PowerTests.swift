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

    let accuracy: RealDouble = 1e-6

    var realA: RealDouble = 1.0
    var realArrayA: RealDoubleArray = [1.0, 2.0]
    var complexA: ComplexDouble = (1.0, 1.0)
    var complexArrayA: ComplexDoubleArray = ([1.0, 1.0], [1.0, 1.0])

    var realB: RealDouble = 1.0
    var realArrayB: RealDoubleArray = [1.0, 2.0]
    var complexB: ComplexDouble = (1.0, 1.0)
    var complexArrayB: ComplexDoubleArray = ([1.0, 1.0], [1.0, 1.0])

    var intA: Int = 2
    var intB: Int = 2
    
    func testPowerIntReal() {
        let result: RealDouble = intA ** realB
        let expected: RealDouble = 2.0
        XCTAssertEqual(result, expected, accuracy: accuracy, "** failed")
    }
    
    func testPowerRealInt() {
        let result: RealDouble = realA ** intB
        let expected: RealDouble = 1.0
        XCTAssertEqual(result, expected, accuracy: accuracy, "** failed")
    }

    func testPowerRealArrayInt() {
        let result: RealDoubleArray = realArrayA ** intB
        let expected: RealDoubleArray = [1.0, 4]
        XCTAssertEqual(result, expected, accuracy: accuracy, "** failed")
    }

    func testPowerComplexInt() {
        let result: ComplexDouble = complexA ** intB
        let expected: ComplexDouble = (0.0, 2.0)
        XCTAssertEqual(result, expected, accuracy: accuracy, "** failed")
    }

    func testPowerRealReal() {
        let result: RealDouble = realA ** realB
        let expected: RealDouble = 1.0
        XCTAssertEqual(result, expected, accuracy: accuracy, "** failed")
    }

    func testPowerRealArrayRealArray() {
        let result: RealDoubleArray = realArrayA ** realArrayB
        let expected: RealDoubleArray = [1.0, 4.0]
        XCTAssertEqual(result, expected, accuracy: accuracy, "** failed")
    }

    func testPowerRealArrayReal() {
        let result: RealDoubleArray = realArrayA ** realB
        let expected: RealDoubleArray = [1.0, 2.0]
        XCTAssertEqual(result, expected, accuracy: accuracy, "** failed")
    }

    func testPowerRealRealArray() {
        let result: RealDoubleArray = realA ** realArrayB
        let expected: RealDoubleArray = [1.0, 1.0]
        XCTAssertEqual(result, expected, accuracy: accuracy, "** failed")
    }
/*
    func testPowerComplexComplex() {
        let result: ComplexDouble = complexA ** complexB
        let expected: ComplexDouble = (0.273957253830, 0.583700758759)
        XCTAssertEqual(result, expected, accuracy: accuracy, "** failed")
    }
*/
    func testPowerComplexReal() {
        let result: ComplexDouble = complexA ** realB
        let expected: ComplexDouble = (1.0, 1.0)
        XCTAssertEqual(result, expected, accuracy: accuracy, "** failed")
    }

    func testPowerRealComplex() {
        let result: ComplexDouble = realA ** complexB
        let expected: ComplexDouble = (1.0, 0.0)
        XCTAssertEqual(result, expected, accuracy: accuracy, "** failed")
    }

    func testPowerComplexRealArray() {
        let result: ComplexDoubleArray = complexA ** realArrayB
        let expected: ComplexDoubleArray = ([1.0, 0.0], [1.0, 2.0])
        XCTAssertEqual(result, expected, accuracy: accuracy, "** failed")
    }

    func testPowerRealArrayComplex() {
        let result: ComplexDoubleArray = realArrayA ** complexB
        let expected: ComplexDoubleArray = ([1.0, 1.538477802728], [0.0, 1.277922552627])
        XCTAssertEqual(result, expected, accuracy: accuracy, "** failed")
    }
/*
    func testPowerComplexArrayComplexArray() {
        let result: ComplexDoubleArray = complexArrayA ** complexArrayB
        let expected: ComplexDoubleArray = ([0.273957253830, 0.273957253830], [0.583700758759, 0.583700758759])
        XCTAssertEqual(result, expected, accuracy: accuracy, "Power failed")
    }
*/
    func testPowerComplexArrayReal() {
        let result: ComplexDoubleArray = complexArrayA ** realB
        let expected: ComplexDoubleArray = ([1.0, 1.0], [1.0, 1.0])
        XCTAssertEqual(result, expected, accuracy: accuracy, "** failed")
    }

    func testPowerRealComplexArray() {
        let result: ComplexDoubleArray = realA ** complexArrayB
        let expected: ComplexDoubleArray = ([1.0, 1.0], [0.0, 0.0])
        XCTAssertEqual(result, expected, accuracy: accuracy, "** failed")
    }

    func testPowerComplexArrayRealArray() {
        let result: ComplexDoubleArray = complexArrayA ** realArrayB
        let expected: ComplexDoubleArray = ([1.0, 0.0], [1.0, 2.0])
        XCTAssertEqual(result, expected, accuracy: accuracy, "** failed")
    }

    func testPowerRealArrayComplexArray() {
        let result: ComplexDoubleArray = realArrayA ** complexArrayB
        let expected: ComplexDoubleArray = ([1.0, 1.538477802728], [0.0, 1.277922552627])
        XCTAssertEqual(result, expected, accuracy: accuracy, "** failed")
    }
/*
    func testPowerComplexArrayComplex() {
        let result: ComplexDoubleArray = complexArrayA ** complexB
        let expected: ComplexDoubleArray = ([0.273957253830, 0.273957253830], [0.583700758759, 0.583700758759])
        XCTAssertEqual(result, expected, accuracy: accuracy, "** failed")
    }

    func testPowerComplexComplexArray() {
        let result: ComplexDoubleArray = complexA ** complexArrayB
        let expected: ComplexDoubleArray = ([0.273957253830, 0.273957253830], [0.583700758759, 0.583700758759])
        XCTAssertEqual(result, expected, accuracy: accuracy, "** failed")
    }
 */
}
