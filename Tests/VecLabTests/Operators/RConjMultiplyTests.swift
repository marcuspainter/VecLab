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
    var complexArrayA: ComplexArray = ComplexArray([1.0, 1.0], [1.0, 1.0])

    var realB: Real = 1.0
    var realArrayB: RealArray = [1.0, 2.0]
    var complexB: Complex = Complex(1.0, 1.0)
    var complexArrayB: ComplexArray = ComplexArray([1.0, 1.0], [1.0, 1.0])

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
            let result: ComplexArray = complexA *~ realArrayB
            let expected: ComplexArray = ([1.0, 2.0], [1.0, 2.0])
            XCTAssertEqual(result, expected, "Right conjugate multiply failed")
        }
    */
    func testRConjMultiplyRealArrayComplex() {
        let result: ComplexArray = realArrayA *~ complexB
        let expected: ComplexArray = ComplexArray([1.0, 2.0], [-1.0, -2.0])
        XCTAssertEqual(result, expected, "Right conjugate multiply failed")
    }

    func testRConjMultiplyComplexArrayComplexArray() {
        let result: ComplexArray = complexArrayA *~ complexArrayB
        let expected: ComplexArray = ComplexArray([2.0, 2.0], [0.0, 0.0])
        XCTAssertEqual(result, expected, "Right conjugate multiply failed")
    }
    /*
        func testRConjMultiplyComplexArrayReal() {
            let result: ComplexArray = complexArrayA *~ realB
            let expected: ComplexArray = ([1.0, 1.0], [1.0, 1.0])
            XCTAssertEqual(result, expected, "Right conjugate multiply failed")
        }
    */
    func testRConjMultiplyRealComplexArray() {
        let result: ComplexArray = realA *~ complexArrayB
        let expected: ComplexArray = ComplexArray([1.0, 1.0], [-1.0, -1.0])
        XCTAssertEqual(result, expected, "Right conjugate multiply failed")
    }
    /*
        func testRConjMultiplyComplexArrayRealArray() {
            let result: ComplexArray = complexArrayA *~ realArrayB
            let expected: ComplexArray = ([1.0, 2.0], [1.0, 2.0])
            XCTAssertEqual(result, expected, "Right conjugate multiply failed")
        }
    */
    func testRConjMultiplyRealArrayComplexArray() {
        let result: ComplexArray = realArrayA *~ complexArrayB
        let expected: ComplexArray = ComplexArray([1.0, 2.0], [-1.0, -2.0])
        XCTAssertEqual(result, expected, "Right conjugate multiply failed")
    }

    func testRConjMultiplyComplexArrayComplex() {
        let result: ComplexArray = complexArrayA *~ complexB
        let expected: ComplexArray = ComplexArray([2.0, 2.0], [0.0, 0.0])
        XCTAssertEqual(result, expected, "Right conjugate multiply failed")
    }

    func testRConjMultiplyComplexComplexArray() {
        let result: ComplexArray = complexA *~ complexArrayB
        let expected: ComplexArray = ComplexArray([2.0, 2.0], [0.0, 0.0])
        XCTAssertEqual(result, expected, "Right conjugate multiply failed")
    }

}
