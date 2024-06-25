
//
//  MultiplyTestsNew.swift
//
//
//  Created by Marcus Painter on 25/09/2023.
//

import Foundation
import Testing
import VecLab

struct MultiplyTestsNew {

    var realA: Real = 1.0
    var realArrayA: RealArray = [1.0, 2.0]
    var complexA: Complex = (1.0, 1.0)
    var complexArrayA: ComplexArray = ([1.0, 1.0], [1.0, 1.0])

    var realB: Real = 1.0
    var realArrayB: RealArray = [1.0, 2.0]
    var complexB: Complex = (1.0, 1.0)
    var complexArrayB: ComplexArray = ([1.0, 1.0], [1.0, 1.0])

    @Test func testMultiplyRealReal() {
        let result: Real = realA * realB
        let expected: Real = 1.0
        #expect(result == expected, "Multiply failed")
    }

    @Test func testMultiplyRealArrayRealArray() {
        let result: RealArray = realArrayA * realArrayB
        let expected: RealArray = [1.0, 4.0]
        #expect(result == expected, "Multiply failed")
    }

    @Test func testMultiplyRealArrayReal() {
        let result: RealArray = realArrayA * realB
        let expected: RealArray = [1.0, 2.0]
        #expect(result == expected, "Multiply failed")
    }

    @Test func testMultiplyRealRealArray() {
        let result: RealArray = realA * realArrayB
        let expected: RealArray = [1.0, 2.0]
        #expect(result == expected, "Multiply failed")
    }

    @Test func testMultiplyComplexComplex() {
        let result: Complex = complexA * complexB
        let expected: Complex = (0.0, 2.0)
        #expect(result == expected, "Multiply failed")
    }

    @Test func testMultiplyComplexReal() {
        let result: Complex = complexA * realB
        let expected: Complex = (1.0, 1.0)
        #expect(result == expected, "Multiply failed")
    }

    @Test func testMultiplyRealComplex() {
        let result: Complex = realA * complexB
        let expected: Complex = (1.0, 1.0)
        #expect(result == expected, "Multiply failed")
    }

    @Test func testMultiplyComplexRealArray() {
        let result: ComplexArray = complexA * realArrayB
        let expected: ComplexArray = ([1.0, 2.0], [1.0, 2.0])
        #expect(result == expected, "Multiply failed")
    }

    @Test func testMultiplyRealArrayComplex() {
        let result: ComplexArray = realArrayA * complexB
        let expected: ComplexArray = ([1.0, 2.0], [1.0, 2.0])
        #expect(result == expected, "Multiply failed")
    }

    @Test func testMultiplyComplexArrayComplexArray() {
        let result: ComplexArray = complexArrayA * complexArrayB
        let expected: ComplexArray = ([0.0, 0.0], [2.0, 2.0])
        #expect(result == expected, "Multiply failed")
    }

    @Test func testMultiplyComplexArrayReal() {
        let result: ComplexArray = complexArrayA * realB
        let expected: ComplexArray = ([1.0, 1.0], [1.0, 1.0])
        #expect(result == expected, "Multiply failed")
    }

    @Test func testMultiplyRealComplexArray() {
        let result: ComplexArray = realA * complexArrayB
        let expected: ComplexArray = ([1.0, 1.0], [1.0, 1.0])
        #expect(result == expected, "Multiply failed")
    }

    @Test func testMultiplyComplexArrayRealArray() {
        let result: ComplexArray = complexArrayA * realArrayB
        let expected: ComplexArray = ([1.0, 2.0], [1.0, 2.0])
        #expect(result == expected, "Multiply failed")
    }

    @Test func testMultiplyRealArrayComplexArray() {
        let result: ComplexArray = realArrayA * complexArrayB
        let expected: ComplexArray = ([1.0, 2.0], [1.0, 2.0])
        #expect(result == expected, "Multiply failed")
    }

    @Test func testMultiplyComplexArrayComplex() {
        let result: ComplexArray = complexArrayA * complexB
        let expected: ComplexArray = ([0.0, 0.0], [2.0, 2.0])
        #expect(result == expected, "Multiply failed")
    }

    @Test func testMultiplyComplexComplexArray() {
        let result: ComplexArray = complexA * complexArrayB
        let expected: ComplexArray = ([0.0, 0.0], [2.0, 2.0])
        #expect(result == expected, "Multiply failed")
    }
}
