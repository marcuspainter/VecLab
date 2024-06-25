//
//  RConjMultiplyTestsNew.swift
//
//
//  Created by Marcus Painter on 25/09/2023.
//

import Foundation
import Testing
import VecLab

struct RConjMultiplyTestsNew {

    var realA: Real = 1.0
    var realArrayA: RealArray = [1.0, 2.0]
    var complexA: Complex = (1.0, 1.0)
    var complexArrayA: ComplexArray = ([1.0, 1.0], [1.0, 1.0])

    var realB: Real = 1.0
    var realArrayB: RealArray = [1.0, 2.0]
    var complexB: Complex = (1.0, 1.0)
    var complexArrayB: ComplexArray = ([1.0, 1.0], [1.0, 1.0])

    @Test func testRConjMultiplyComplexComplex() {
        let result: Complex = complexA *~ complexB
        let expected: Complex = (2.0, 0.0)
        #expect(result == expected, "Right conjugate multiply failed")
    }

    @Test func testRConjMultiplyRealComplex() {
        let result: Complex = realA *~ complexB
        let expected: Complex = (1.0, -1.0)
        #expect(result == expected, "Right conjugate multiply failed")
    }

    @Test func testRConjMultiplyRealArrayComplex() {
        let result: ComplexArray = realArrayA *~ complexB
        let expected: ComplexArray = ([1.0, 2.0], [-1.0, -2.0])
        #expect(result == expected, "Right conjugate multiply failed")
    }

    @Test func testRConjMultiplyComplexArrayComplexArray() {
        let result: ComplexArray = complexArrayA *~ complexArrayB
        let expected: ComplexArray = ([2.0, 2.0], [0.0, 0.0])
        #expect(result == expected, "Right conjugate multiply failed")
    }

    @Test func testRConjMultiplyRealComplexArray() {
        let result: ComplexArray = realA *~ complexArrayB
        let expected: ComplexArray = ([1.0, 1.0], [-1.0, -1.0])
        #expect(result == expected, "Right conjugate multiply failed")
    }

    @Test func testRConjMultiplyRealArrayComplexArray() {
        let result: ComplexArray = realArrayA *~ complexArrayB
        let expected: ComplexArray = ([1.0, 2.0], [-1.0, -2.0])
        #expect(result == expected, "Right conjugate multiply failed")
    }

    @Test func testRConjMultiplyComplexArrayComplex() {
        let result: ComplexArray = complexArrayA *~ complexB
        let expected: ComplexArray = ([2.0, 2.0], [0.0, 0.0])
        #expect(result == expected, "Right conjugate multiply failed")
    }

    @Test func testRConjMultiplyComplexComplexArray() {
        let result: ComplexArray = complexA *~ complexArrayB
        let expected: ComplexArray = ([2.0, 2.0], [0.0, 0.0])
        #expect(result == expected, "Right conjugate multiply failed")
    }
}
