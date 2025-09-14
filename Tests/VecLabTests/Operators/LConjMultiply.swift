//
//  LConjMultiplyTests.swift
//
//
//  Created by Marcus Painter on 25/09/2023.
//

import Foundation
import VecLab
import XCTest

class LConjMultiplyTests: XCTestCase {

    var realA: Real = 1.0
    var realArrayA: RealArray = [1.0, 2.0]
    var complexA: Complex = Complex(1.0, 1.0)
    var SplitComplexArrayA: SplitComplexArray = SplitComplexArray([1.0, 1.0], [1.0, 1.0])

    var realB: Real = 1.0
    var realArrayB: RealArray = [1.0, 2.0]
    var complexB: Complex = Complex(1.0, 1.0)
    var SplitComplexArrayB: SplitComplexArray = SplitComplexArray([1.0, 1.0], [1.0, 1.0])

    /*
       func testLConjMultiplyRealReal() {
           let result: Real = realA ~* realB
           let expected: Real = 1.0
           XCTAssertEqual(result, expected, "Left conjugate multiply failed")
       }
    
       func testLConjMultiplyRealArrayRealArray() {
           let result: RealArray = realArrayA ~* realArrayB
           let expected: RealArray = [1.0, 4.0]
           XCTAssertEqual(result, expected, "Left conjugate multiply failed")
       }
    
       func testLConjMultiplyRealArrayReal() {
           let result: RealArray = realArrayA ~* realB
           let expected: RealArray = [1.0, 2.0]
           XCTAssertEqual(result, expected, "Left conjugate multiply failed")
       }
    
       func testLConjMultiplyRealRealArray() {
           let result: RealArray = realA ~* realArrayB
           let expected: RealArray = [1.0, 2.0]
           XCTAssertEqual(result, expected, "Left conjugate multiply failed")
       }
     */
    func testLConjMultiplyComplexComplex() {
        let result: Complex = complexA ~* complexB
        let expected: Complex = Complex(2.0, 0.0)
        XCTAssertEqual(result, expected, "Left conjugate multiply failed")
    }

    func testLConjMultiplyComplexReal() {
        let result: Complex = complexA ~* realB
        let expected: Complex = Complex(1.0, -1.0)
        XCTAssertEqual(result, expected, "Left conjugate multiply failed")
    }

    /*
        func testLConjMultiplyRealComplex() {
            let result: Complex = realA ~* complexB
            let expected: Complex = (1.0,1.0)
            XCTAssertEqual(result, expected, "Left conjugate multiply failed")
        }
    */
    func testLConjMultiplyComplexRealArray() {
        let result: SplitComplexArray = complexA ~* realArrayB
        let expected: SplitComplexArray = SplitComplexArray([1.0, 2.0], [-1.0, -2.0])
        XCTAssertEqual(result, expected, "Left conjugate multiply failed")
    }
    /*
        func testLConjMultiplyRealArrayComplex() {
            let result: SplitComplexArray = realArrayA ~* complexB
            let expected: SplitComplexArray = ([1.0, 2.0], [1.0, 2.0])
            XCTAssertEqual(result, expected, "Left conjugate multiply failed")
        }
    */
    func testLConjMultiplyComplexArraySplitComplexArray() {
        let result: SplitComplexArray = SplitComplexArrayA ~* SplitComplexArrayB
        let expected: SplitComplexArray = SplitComplexArray([2.0, 2.0], [0.0, 0.0])
        XCTAssertEqual(result, expected, "Left conjugate multiply failed")
    }

    func testLConjMultiplySplitComplexArrayReal() {
        let result: SplitComplexArray = SplitComplexArrayA ~* realB
        let expected: SplitComplexArray = SplitComplexArray([1.0, 1.0], [-1.0, -1.0])
        XCTAssertEqual(result, expected, "Left conjugate multiply failed")
    }
    /*
        func testLConjMultiplyRealSplitComplexArray() {
            let result: SplitComplexArray = realA ~* SplitComplexArrayB
            let expected: SplitComplexArray = ([1.0, 1.0], [1.0, 1.0])
            XCTAssertEqual(result, expected, "Left conjugate multiply failed")
        }
    */
    func testLConjMultiplySplitComplexArrayRealArray() {
        let result: SplitComplexArray = SplitComplexArrayA ~* realArrayB
        let expected: SplitComplexArray = SplitComplexArray([1.0, 2.0], [-1.0, -2.0])
        XCTAssertEqual(result, expected, "Left conjugate multiply failed")
    }
    /*
        func testLConjMultiplyRealArraySplitComplexArray() {
            let result: SplitComplexArray = realArrayA ~* SplitComplexArrayB
            let expected: SplitComplexArray = ([1.0, 2.0], [1.0, 2.0])
            XCTAssertEqual(result, expected, "Left conjugate multiply failed")
        }
    */
    func testLConjMultiplySplitComplexArrayComplex() {
        let result: SplitComplexArray = SplitComplexArrayA ~* complexB
        let expected: SplitComplexArray = SplitComplexArray([2.0, 2.0], [0.0, 0.0])
        XCTAssertEqual(result, expected, "Left conjugate multiply failed")
    }

    func testLConjMultiplyComplexSplitComplexArray() {
        let result: SplitComplexArray = complexA ~* SplitComplexArrayB
        let expected: SplitComplexArray = SplitComplexArray([2.0, 2.0], [0.0, 0.0])
        XCTAssertEqual(result, expected, "Left conjugate multiply failed")
    }

}
