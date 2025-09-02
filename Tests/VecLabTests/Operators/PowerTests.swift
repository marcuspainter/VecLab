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
    var complexA: Complex = Complex(1.0, 1.0)
    var complexArrayA: ComplexArray = ComplexArray([1.0, 1.0], [1.0, 1.0])

    var realB: Real = 1.0
    var realArrayB: RealArray = [1.0, 2.0]
    var complexB: Complex = Complex(1.0, 1.0)
    var complexArrayB: ComplexArray = ComplexArray([1.0, 1.0], [1.0, 1.0])

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
        let result: ComplexArray = complexA ** realArrayB
        let expected: ComplexArray = ComplexArray([1.0, 0.0], [1.0, 2.0])
        XCTAssertEqual(result, expected, accuracy: accuracy, "** failed")
    }

    func testPowerRealArrayComplex() {
        let result: ComplexArray = realArrayA ** complexB
        let expected: ComplexArray = ComplexArray([1.0, 1.538477802728], [0.0, 1.277922552627])
        XCTAssertEqual(result, expected, accuracy: accuracy, "** failed")
    }

    func testPowerComplexArrayComplexArray() {
        let result: ComplexArray = complexArrayA ** complexArrayB
        let expected: ComplexArray = ComplexArray([0.273957253830, 0.273957253830], [0.583700758759, 0.583700758759])
        XCTAssertEqual(result, expected, accuracy: accuracy, "Power failed")
    }

    func testPowerComplexArrayReal() {
        let result: ComplexArray = complexArrayA ** realB
        let expected: ComplexArray = ComplexArray([1.0, 1.0], [1.0, 1.0])
        XCTAssertEqual(result, expected, accuracy: accuracy, "** failed")
    }

    func testPowerRealComplexArray() {
        let result: ComplexArray = realA ** complexArrayB
        let expected: ComplexArray = ComplexArray([1.0, 1.0], [0.0, 0.0])
        XCTAssertEqual(result, expected, accuracy: accuracy, "** failed")
    }

    func testPowerComplexArrayRealArray() {
        let result: ComplexArray = complexArrayA ** realArrayB
        let expected: ComplexArray = ComplexArray([1.0, 0.0], [1.0, 2.0])
        XCTAssertEqual(result, expected, accuracy: accuracy, "** failed")
    }

    func testPowerRealArrayComplexArray() {
        let result: ComplexArray = realArrayA ** complexArrayB
        let expected: ComplexArray = ComplexArray([1.0, 1.538477802728], [0.0, 1.277922552627])
        XCTAssertEqual(result, expected, accuracy: accuracy, "** failed")
    }
    
    func testPowerComplexArrayComplex() {
        let result: ComplexArray = complexArrayA ** complexB
        let expected: ComplexArray = ComplexArray([0.273957253830, 0.273957253830], [0.583700758759, 0.583700758759])
        XCTAssertEqual(result, expected, accuracy: accuracy, "** failed")
    }

    func testPowerComplexComplexArray() {
        let result: ComplexArray = complexA ** complexArrayB
        let expected: ComplexArray = ComplexArray([0.273957253830, 0.273957253830], [0.583700758759, 0.583700758759])
        XCTAssertEqual(result, expected, accuracy: accuracy, "** failed")
    }
 
}
