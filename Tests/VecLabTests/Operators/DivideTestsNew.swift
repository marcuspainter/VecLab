//
//  DivideTestsNew.swift
//
//
//  Created by Marcus Painter on 25/09/2023.
//

import Foundation
import Testing
import VecLab

struct DivideTestsNew {

    var realA: Real = 1.0
    var realArrayA: RealArray = [1.0, 2.0]
    var complexA: Complex = (1.0, 1.0)
    var complexArrayA: ComplexArray = ([1.0, 1.0], [1.0, 1.0])

    var realB: Real = 1.0
    var realArrayB: RealArray = [1.0, 2.0]
    var complexB: Complex = (1.0, 1.0)
    var complexArrayB: ComplexArray = ([1.0, 1.0], [1.0, 1.0])

    @Test func testDivideRealReal() {
        let result: Real = realA / realB
        let expected: Real = 1.0
        #expect(result == expected, "Divide failed")
    }

    @Test func testDivideRealArrayRealArray() {
        let result: RealArray = realArrayA / realArrayB
        let expected: RealArray = [1.0, 1.0]
        #expect(result == expected, "Divide failed")
    }

    @Test func testDivideRealArrayReal() {
        let result: RealArray = realArrayA / realB
        let expected: RealArray = [1.0, 2.0]
        #expect(result == expected, "Divide failed")
    }

    @Test func testDivideRealRealArray() {
        let result: RealArray = realA / realArrayB
        let expected: RealArray = [1.0, 0.5]
        #expect(result == expected, "Divide failed")
    }

    @Test func testDivideComplexComplex() {
        let result: Complex = complexA / complexB
        let expected: Complex = (1.0, 0.0)
        #expect(result == expected, "Divide failed")
    }

    @Test func testDivideComplexReal() {
        let result: Complex = complexA / realB
        let expected: Complex = (1.0, 1.0)
        #expect(result == expected, "Divide failed")
    }

    @Test func testDivideRealComplex() {
        let result: Complex = realA / complexB
        let expected: Complex = (0.5, -0.5)
        #expect(result == expected, "Divide failed")
    }

    @Test func testDivideComplexRealArray() {
        let result: ComplexArray = complexA / realArrayB
        let expected: ComplexArray = ([1.0, 0.5], [1.0, 0.5])
        #expect(result == expected, "Divide failed")
    }

    @Test func testDivideRealArrayComplex() {
        let result: ComplexArray = realArrayA / complexB
        let expected: ComplexArray = ([0.5, 1.0], [-0.5, -1.0])
        #expect(result == expected, "Divide failed")
    }

    @Test func testDivideComplexArrayComplexArray() {
        let result: ComplexArray = complexArrayA / complexArrayB
        let expected: ComplexArray = ([1.0, 1.0], [0.0, 0.0])
        #expect(result == expected, "Divide failed")
    }

    @Test func testDivideComplexArrayReal() {
        let result: ComplexArray = complexArrayA / realB
        let expected: ComplexArray = ([1.0, 1.0], [1.0, 1.0])
        #expect(result == expected, "Divide failed")
    }

    @Test func testDivideRealComplexArray() {
        let result: ComplexArray = realA / complexArrayB
        let expected: ComplexArray = ([0.5, 0.5], [-0.5, -0.5])
        #expect(result == expected, "Divide failed")
    }

    @Test func testDivideComplexArrayRealArray() {
        let result: ComplexArray = complexArrayA / realArrayB
        let expected: ComplexArray = ([1.0, 0.5], [1.0, 0.5])
        #expect(result == expected, "Divide failed")
    }

    @Test func testDivideRealArrayComplexArray() {
        let result: ComplexArray = realArrayA / complexArrayB
        let expected: ComplexArray = ([0.5, 1.0], [-0.5, -1.0])
        #expect(result == expected, "Divide failed")
    }

    @Test func testDivideComplexArrayComplex() {
        let result: ComplexArray = complexArrayA / complexB
        let expected: ComplexArray = ([1.0, 1.0], [0.0, 0.0])
        #expect(result == expected, "Divide failed")
    }

    @Test func testDivideComplexComplexArray() {
        let result: ComplexArray = complexA / complexArrayB
        let expected: ComplexArray = ([1.0, 1.0], [0.0, 0.0])
        #expect(result == expected, "Divide failed")
    }
}
