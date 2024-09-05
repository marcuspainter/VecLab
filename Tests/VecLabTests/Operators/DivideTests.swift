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

    var realA: RealDouble = 1.0
    var realArrayA: RealDoubleArray = [1.0, 2.0]
    var complexA: ComplexDouble = (1.0, 1.0)
    var complexArrayA: ComplexDoubleArray = ([1.0, 1.0], [1.0, 1.0])

    var realB: RealDouble = 1.0
    var realArrayB: RealDoubleArray = [1.0, 2.0]
    var complexB: ComplexDouble = (1.0, 1.0)
    var complexArrayB: ComplexDoubleArray = ([1.0, 1.0], [1.0, 1.0])
    
    /*
     Smith algorithm
     For the if branch: (x, y) = ((3, 4), (5, 2))
     For the else branch: (x, y) = ((3, 4), (2, 5))
     */
    var complexPath1A: ComplexDouble = (3.0, 4.0)
    var complexPath1B: ComplexDouble = (5.0, 2.0)
    var complexPath2A: ComplexDouble = (3.0, 4.0)
    var complexPath2B: ComplexDouble = (2.0, 5.0)
    var complexResultPath1: ComplexDouble = (0.793103448275862, 0.482758620689655)
    var complexResultPath2: ComplexDouble = (0.896551724137931, -0.241379310344828)

    func testDivideRealReal() {
        let result: RealDouble = realA / realB
        let expected: RealDouble = 1.0
        XCTAssertEqual(result, expected, "Divide failed")
    }

    func testDivideRealArrayRealArray() {
        let result: RealDoubleArray = realArrayA / realArrayB
        let expected: RealDoubleArray = [1.0, 1.0]
        XCTAssertEqual(result, expected, "Divide failed")
    }

    func testDivideRealArrayReal() {
        let result: RealDoubleArray = realArrayA / realB
        let expected: RealDoubleArray = [1.0, 2.0]
        XCTAssertEqual(result, expected, "Divide failed")
    }

    func testDivideRealRealArray() {
        let result: RealDoubleArray = realA / realArrayB
        let expected: RealDoubleArray = [1.0, 0.5]
        XCTAssertEqual(result, expected, "Divide failed")
    }

    func testDivideComplexComplex() {
        let result: ComplexDouble = complexA / complexB
        let expected: ComplexDouble = (1.0, 0.0)
        XCTAssertEqual(result, expected, "Divide failed")
    }
    
    func testDivideComplexComplexPath1() {
        let result: ComplexDouble = complexPath1A / complexPath1B
        let expected: ComplexDouble = complexResultPath1
        XCTAssertEqual(result, expected, "Divide failed")
    }
    
    func testDivideComplexComplexPath2() {
        let result: ComplexDouble = complexPath2A / complexPath2B
        let expected: ComplexDouble = complexResultPath2
        XCTAssertEqual(result, expected, "Divide failed")
    }

    func testDivideComplexReal() {
        let result: ComplexDouble = complexA / realB
        let expected: ComplexDouble = (1.0, 1.0)
        XCTAssertEqual(result, expected, "Divide failed")
    }

    func testDivideRealComplex() {
        let result: ComplexDouble = realA / complexB
        let expected: ComplexDouble = (0.5, -0.5)
        XCTAssertEqual(result, expected, "Divide failed")
    }

    func testDivideComplexRealArray() {
        let result: ComplexDoubleArray = complexA / realArrayB
        let expected: ComplexDoubleArray = ([1.0, 0.5], [1.0, 0.5])
        XCTAssertEqual(result, expected, "Divide failed")
    }

    func testDivideRealArrayComplex() {
        let result: ComplexDoubleArray = realArrayA / complexA
        let expected: ComplexDoubleArray = ([0.5, 1.0], [-0.5, -1.0])
        XCTAssertEqual(result, expected, "Divide failed")
    }

    func testDivideComplexArrayComplexArray() {
        let result: ComplexDoubleArray = complexArrayA / complexArrayB
        let expected: ComplexDoubleArray = ([1.0, 1.0], [0.0, 0.0])
        XCTAssertEqual(result, expected, "Divide failed")
    }

    func testDivideComplexArrayReal() {
        let result: ComplexDoubleArray = complexArrayA / realB
        let expected: ComplexDoubleArray = ([1.0, 1.0], [1.0, 1.0])
        XCTAssertEqual(result, expected, "Divide failed")
    }

    func testDivideRealComplexArray() {
        let result: ComplexDoubleArray = 1.0 / ([1.0, 1.0], [1.0, 1.0])
        let expected: ComplexDoubleArray = ([0.5, 0.5], [-0.5, -0.5])
        XCTAssertEqual(result, expected, "Divide failed")
    }

    func testDivideComplexArrayRealArray() {
        let result: ComplexDoubleArray = complexArrayA / realArrayB
        let expected: ComplexDoubleArray = ([1.0, 0.5], [1.0, 0.5])
        XCTAssertEqual(result, expected, "Divide failed")
    }

    func testDivideRealArrayComplexArray() {
        let result: ComplexDoubleArray = realArrayA / complexArrayB
        let expected: ComplexDoubleArray = ([0.5, 1.0], [-0.5, -1.0])
        XCTAssertEqual(result, expected, "Divide failed")
    }

    func testDivideComplexArrayComplex() {
        let result: ComplexDoubleArray = complexArrayA / complexB
        let expected: ComplexDoubleArray = ([1.0, 1.0], [0.0, 0.0])
        XCTAssertEqual(result, expected, "Divide failed")
    }

    func testDivideComplexComplexArray() {
        let result: ComplexDoubleArray = complexA / complexArrayB
        let expected: ComplexDoubleArray = ([1.0, 1.0], [0.0, 0.0])
        XCTAssertEqual(result, expected, "Divide failed")
    }

}
