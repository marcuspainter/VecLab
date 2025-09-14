//
//  RConjMultiplyTests.swift
//
//
//  Created by Marcus Painter on 25/09/2023.
//

import Foundation
import VecLab
import XCTest

class RConjMultiplyTests: XCTestCase {

    var realA: Real = 1.0
    var realArrayA: RealArray = [1.0, 2.0]
    var complexA: Complex = Complex(1.0, 1.0)
    var SplitComplexArrayA: SplitComplexArray = SplitComplexArray([1.0, 1.0], [1.0, 1.0])

    var realB: Real = 1.0
    var realArrayB: RealArray = [1.0, 2.0]
    var complexB: Complex = Complex(1.0, 1.0)
    var SplitComplexArrayB: SplitComplexArray = SplitComplexArray([1.0, 1.0], [1.0, 1.0])

    /*
        func testRConjMultiplyRealReal() {
            let result: Real = realA *~ realB
            let expected: Real = 1.0
            XCTAssertEqual(result, expected, "Right conjugate multiply failed")
        }
    
        func testRConjMultiplyRealArrayRealArray() {
            let result: RealArray = realArrayA *~ realArrayB
            let expected: RealArray = [1.0, 4.0]
            XCTAssertEqual(result, expected, "Right conjugate multiply failed")
        }
    
        func testRConjMultiplyRealArrayReal() {
            let result: RealArray = realArrayA *~ realB
            let expected: RealArray = [1.0, 2.0]
            XCTAssertEqual(result, expected, "Right conjugate multiply failed")
        }
    
        func testRConjMultiplyRealRealArray() {
            let result: RealArray = realA *~ realArrayB
            let expected: RealArray = [1.0, 2.0]
            XCTAssertEqual(result, expected, "Right conjugate multiply failed")
        }
    */
    func testRConjMultiplyComplexComplex() {
        let result: Complex = complexA *~ complexB
        let expected: Complex = Complex(2.0, 0.0)
        XCTAssertEqual(result, expected, "Right conjugate multiply failed")
    }
    /*
        func testRConjMultiplyComplexReal() {
            let result: Complex = complexA *~ realB
            let expected: Complex = (1.0,1.0)
            XCTAssertEqual(result, expected, "Right conjugate multiply failed")
        }
    */
    func testRConjMultiplyRealComplex() {
        let result: Complex = realA *~ complexB
        let expected: Complex = Complex(1.0, -1.0)
        XCTAssertEqual(result, expected, "Right conjugate multiply failed")
    }
    /*
        func testRConjMultiplyComplexRealArray() {
            let result: SplitComplexArray = complexA *~ realArrayB
            let expected: SplitComplexArray = ([1.0, 2.0], [1.0, 2.0])
            XCTAssertEqual(result, expected, "Right conjugate multiply failed")
        }
    */
    func testRConjMultiplyRealArrayComplex() {
        let result: SplitComplexArray = realArrayA *~ complexB
        let expected: SplitComplexArray = SplitComplexArray([1.0, 2.0], [-1.0, -2.0])
        XCTAssertEqual(result, expected, "Right conjugate multiply failed")
    }

    func testRConjMultiplyComplexArraySplitComplexArray() {
        let result: SplitComplexArray = SplitComplexArrayA *~ SplitComplexArrayB
        let expected: SplitComplexArray = SplitComplexArray([2.0, 2.0], [0.0, 0.0])
        XCTAssertEqual(result, expected, "Right conjugate multiply failed")
    }
    /*
        func testRConjMultiplySplitComplexArrayReal() {
            let result: SplitComplexArray = SplitComplexArrayA *~ realB
            let expected: SplitComplexArray = ([1.0, 1.0], [1.0, 1.0])
            XCTAssertEqual(result, expected, "Right conjugate multiply failed")
        }
    */
    func testRConjMultiplyRealSplitComplexArray() {
        let result: SplitComplexArray = realA *~ SplitComplexArrayB
        let expected: SplitComplexArray = SplitComplexArray([1.0, 1.0], [-1.0, -1.0])
        XCTAssertEqual(result, expected, "Right conjugate multiply failed")
    }
    /*
        func testRConjMultiplySplitComplexArrayRealArray() {
            let result: SplitComplexArray = SplitComplexArrayA *~ realArrayB
            let expected: SplitComplexArray = ([1.0, 2.0], [1.0, 2.0])
            XCTAssertEqual(result, expected, "Right conjugate multiply failed")
        }
    */
    func testRConjMultiplyRealArraySplitComplexArray() {
        let result: SplitComplexArray = realArrayA *~ SplitComplexArrayB
        let expected: SplitComplexArray = SplitComplexArray([1.0, 2.0], [-1.0, -2.0])
        XCTAssertEqual(result, expected, "Right conjugate multiply failed")
    }

    func testRConjMultiplySplitComplexArrayComplex() {
        let result: SplitComplexArray = SplitComplexArrayA *~ complexB
        let expected: SplitComplexArray = SplitComplexArray([2.0, 2.0], [0.0, 0.0])
        XCTAssertEqual(result, expected, "Right conjugate multiply failed")
    }

    func testRConjMultiplyComplexSplitComplexArray() {
        let result: SplitComplexArray = complexA *~ SplitComplexArrayB
        let expected: SplitComplexArray = SplitComplexArray([2.0, 2.0], [0.0, 0.0])
        XCTAssertEqual(result, expected, "Right conjugate multiply failed")
    }

}
