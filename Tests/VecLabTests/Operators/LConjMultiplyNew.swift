//
//  LConjMultiplyTestsNew.swift
//
//
//  Created by Marcus Painter on 25/09/2023.
//

import Foundation
import Testing
import VecLab

struct LConjMultiplyTestsNew {

    var realA: Real = 1.0
    var realArrayA: RealArray = [1.0, 2.0]
    var complexA: Complex = (1.0, 1.0)
    var complexArrayA: ComplexArray = ([1.0, 1.0], [1.0, 1.0])

    var realB: Real = 1.0
    var realArrayB: RealArray = [1.0, 2.0]
    var complexB: Complex = (1.0, 1.0)
    var complexArrayB: ComplexArray = ([1.0, 1.0], [1.0, 1.0])

    @Test func testLConjMultiplyComplexComplex() {
        let result: Complex = complexA ~* complexB
        let expected: Complex = (2.0, 0.0)
        #expect(result == expected, "Left conjugate multiply failed")
    }

    @Test func testLConjMultiplyComplexReal() {
        let result: Complex = complexA ~* realB
        let expected: Complex = (1.0, -1.0)
        #expect(result == expected, "Left conjugate multiply failed")
    }

    @Test func testLConjMultiplyComplexRealArray() {
        let result: ComplexArray = complexA ~* realArrayB
        let expected: ComplexArray = ([1.0, 2.0], [-1.0, -2.0])
        #expect(result == expected, "Left conjugate multiply failed")
    }

    @Test func testLConjMultiplyComplexArrayComplexArray() {
        let result: ComplexArray = complexArrayA ~* complexArrayB
        let expected: ComplexArray = ([2.0, 2.0], [0.0, 0.0])
        #expect(result == expected, "Left conjugate multiply failed")
    }

    @Test func testLConjMultiplyComplexArrayReal() {
        let result: ComplexArray = complexArrayA ~* realB
        let expected: ComplexArray = ([1.0, 1.0], [-1.0, -1.0])
        #expect(result == expected, "Left conjugate multiply failed")
    }

    @Test func testLConjMultiplyComplexArrayRealArray() {
        let result: ComplexArray = complexArrayA ~* realArrayB
        let expected: ComplexArray = ([1.0, 2.0], [-1.0, -2.0])
        #expect(result == expected, "Left conjugate multiply failed")
    }

    @Test func testLConjMultiplyComplexArrayComplex() {
        let result: ComplexArray = complexArrayA ~* complexB
        let expected: ComplexArray = ([2.0, 2.0], [0.0, 0.0])
        #expect(result == expected, "Left conjugate multiply failed")
    }

    @Test func testLConjMultiplyComplexComplexArray() {
        let result: ComplexArray = complexA ~* complexArrayB
        let expected: ComplexArray = ([2.0, 2.0], [0.0, 0.0])
        #expect(result == expected, "Left conjugate multiply failed")
    }

}
