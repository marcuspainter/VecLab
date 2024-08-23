//
//  DivideTests.swift
//
//
//  Created by Marcus Painter on 25/09/2023.
//

import Foundation
import XCTest
import VecLab

class DivideTests: XCTestCase {

    var realA: Real = 1.0
    var realArrayA: RealArray = [1.0, 2.0]
    var complexA: Complex = (1.0, 1.0)
    var complexArrayA: ComplexArray = ([1.0, 1.0], [1.0, 1.0])

    var realB: Real = 1.0
    var realArrayB: RealArray = [1.0, 2.0]
    var complexB: Complex = (1.0, 1.0)
    var complexArrayB: ComplexArray = ([1.0, 1.0], [1.0, 1.0])
    
    /*
     Smith alofgiorytm
     For the if branch: (x, y) = ((3, 4), (5, 2))
     For the else branch: (x, y) = ((3, 4), (2, 5))
     */
    var complexPath1A = (3.0, 4.0)
    var complexPath1B = (5.0, 2.0)
    var complexPath2A = (3.0, 4.0)
    var complexPath2B = (2.0, 5.0)
    var complexResultPath1 = (0.793103448275862, 0.482758620689655)
    var complexResultPath2 = (0.896551724137931, -0.241379310344828)

    func testDivideRealReal() {
        let result: Real = realA / realB
        let expected: Real = 1.0
        XCTAssertEqual(result, expected, "Divide failed")
    }

    func testDivideRealArrayRealArray() {
        let result: RealArray = realArrayA / realArrayB
        let expected: RealArray = [1.0, 1.0]
        XCTAssertEqual(result, expected, "Divide failed")
    }

    func testDivideRealArrayReal() {
        let result: RealArray = realArrayA / realB
        let expected: RealArray = [1.0, 2.0]
        XCTAssertEqual(result, expected, "Divide failed")
    }

    func testDivideRealRealArray() {
        let result: RealArray = realA / realArrayB
        let expected: RealArray = [1.0, 0.5]
        XCTAssertEqual(result, expected, "Divide failed")
    }

    func testDivideComplexComplex() {
        let result: Complex = complexA / complexB
        let expected: Complex = (1.0, 0.0)
        XCTAssertEqual(result, expected, "Divide failed")
    }
    
    func testDivideComplexComplexPath1() {
        let result: Complex = complexPath1A / complexPath1B
        let expected: Complex = complexResultPath1
        XCTAssertEqual(result, expected, "Divide failed")
    }
    
    func testDivideComplexComplexPath2() {
        let result: Complex = complexPath2A / complexPath2B
        let expected: Complex = complexResultPath2
        XCTAssertEqual(result, expected, "Divide failed")
    }

    func testDivideComplexReal() {
        let result: Complex = complexA / realB
        let expected: Complex = (1.0, 1.0)
        XCTAssertEqual(result, expected, "Divide failed")
    }

    func testDivideRealComplex() {
        let result: Complex = realA / complexB
        let expected: Complex = (0.5, -0.5)
        XCTAssertEqual(result, expected, "Divide failed")
    }

    func testDivideComplexRealArray() {
        let result: ComplexArray = complexA / realArrayB
        let expected: ComplexArray = ([1.0, 0.5], [1.0, 0.5])
        XCTAssertEqual(result, expected, "Divide failed")
    }

    func testDivideRealArrayComplex() {
        let result: ComplexArray = realArrayA / complexB
        let expected: ComplexArray = ([0.5, 1.0], [-0.5, -1.0])
        XCTAssertEqual(result, expected, "Divide failed")
    }

    func testDivideComplexArrayComplexArray() {
        let result: ComplexArray = complexArrayA / complexArrayB
        let expected: ComplexArray = ([1.0, 1.0], [0.0, 0.0])
        XCTAssertEqual(result, expected, "Divide failed")
    }

    func testDivideComplexArrayReal() {
        let result: ComplexArray = complexArrayA / realB
        let expected: ComplexArray = ([1.0, 1.0], [1.0, 1.0])
        XCTAssertEqual(result, expected, "Divide failed")
    }

    func testDivideRealComplexArray() {
        let result: ComplexArray = realA / complexArrayB
        let expected: ComplexArray = ([0.5, 0.5], [-0.5, -0.5])
        XCTAssertEqual(result, expected, "Divide failed")
    }

    func testDivideComplexArrayRealArray() {
        let result: ComplexArray = complexArrayA / realArrayB
        let expected: ComplexArray = ([1.0, 0.5], [1.0, 0.5])
        XCTAssertEqual(result, expected, "Divide failed")
    }

    func testDivideRealArrayComplexArray() {
        let result: ComplexArray = realArrayA / complexArrayB
        let expected: ComplexArray = ([0.5, 1.0], [-0.5, -1.0])
        XCTAssertEqual(result, expected, "Divide failed")
    }

    func testDivideComplexArrayComplex() {
        let result: ComplexArray = complexArrayA / complexB
        let expected: ComplexArray = ([1.0, 1.0], [0.0, 0.0])
        XCTAssertEqual(result, expected, "Divide failed")
    }

    func testDivideComplexComplexArray() {
        let result: ComplexArray = complexA / complexArrayB
        let expected: ComplexArray = ([1.0, 1.0], [0.0, 0.0])
        XCTAssertEqual(result, expected, "Divide failed")
    }

}
