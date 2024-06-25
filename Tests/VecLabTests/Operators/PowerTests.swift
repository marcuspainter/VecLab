//
//  PowerTestsNew.swift
//
//
//  Created by Marcus Painter on 25/09/2023.
//

import Foundation
import Testing
import VecLab

struct PowerTestsNew {

    let accuracy: Real = 1e-6

    var realA: Real = 1.0
    var realArrayA: RealArray = [1.0, 2.0]
    var complexA: Complex = (1.0, 1.0)
    var complexArrayA: ComplexArray = ([1.0, 1.0], [1.0, 1.0])

    var realB: Real = 1.0
    var realArrayB: RealArray = [1.0, 2.0]
    var complexB: Complex = (1.0, 1.0)
    var complexArrayB: ComplexArray = ([1.0, 1.0], [1.0, 1.0])

    var intA = 2
    var intB = 2

    @Test func testPowerRealInt() {
        let result: Real = realA ** intB
        let expected: Real = 1.0
        #expect(abs(result - expected) < accuracy, "Power failed")
    }

    @Test func testPowerRealArrayInt() {
        let result: RealArray = realArrayA ** intB
        let expected: RealArray = [1.0, 4.0]
        #expect(abs(result[0] - expected[0]) < accuracy && abs(result[1] - expected[1]) < accuracy, "Power failed")
    }

    @Test func testPowerComplexInt() {
        let result: Complex = complexA ** intB
        let expected: Complex = (0.0, 2.0)
        #expect(abs(result.0 - expected.0) < accuracy && abs(result.1 - expected.1) < accuracy, "Power failed")
    }

    @Test func testPowerRealReal() {
        let result: Real = realA ** realB
        let expected: Real = 1.0
        #expect(abs(result - expected) < accuracy, "Power failed")
    }

    @Test func testPowerRealArrayRealArray() {
        let result: RealArray = realArrayA ** realArrayB
        let expected: RealArray = [1.0, 4.0]
        #expect(abs(result[0] - expected[0]) < accuracy && abs(result[1] - expected[1]) < accuracy, "Power failed")
    }

    @Test func testPowerRealArrayReal() {
        let result: RealArray = realArrayA ** realB
        let expected: RealArray = [1.0, 2.0]
        #expect(abs(result[0] - expected[0]) < accuracy && abs(result[1] - expected[1]) < accuracy, "Power failed")
    }

    @Test func testPowerRealRealArray() {
        let result: RealArray = realA ** realArrayB
        let expected: RealArray = [1.0, 1.0]
        #expect(abs(result[0] - expected[0]) < accuracy && abs(result[1] - expected[1]) < accuracy, "Power failed")
    }

    @Test func testPowerComplexReal() {
        let result: Complex = complexA ** realB
        let expected: Complex = (1.0, 1.0)
        #expect(abs(result.0 - expected.0) < accuracy && abs(result.1 - expected.1) < accuracy, "Power failed")
    }

    @Test func testPowerRealComplex() {
        let result: Complex = realA ** complexB
        let expected: Complex = (1.0, 0.0)
        #expect(abs(result.0 - expected.0) < accuracy && abs(result.1 - expected.1) < accuracy, "Power failed")
    }

    @Test func testPowerComplexRealArray() {
        let result: ComplexArray = complexA ** realArrayB
        let expected: ComplexArray = ([1.0, 0.0], [1.0, 2.0])
        #expect(abs(result.0[0] - expected.0[0]) < accuracy && abs(result.0[1] - expected.0[1]) < accuracy && abs(result.1[0] - expected.1[0]) < accuracy && abs(result.1[1] - expected.1[1]) < accuracy, "Power failed")
    }

    @Test func testPowerRealArrayComplex() {
        let result: ComplexArray = realArrayA ** complexB
        let expected: ComplexArray = ([1.0, 1.538477802728], [0.0, 1.277922552627])
        #expect(abs(result.0[0] - expected.0[0]) < accuracy && abs(result.0[1] - expected.0[1]) < accuracy && abs(result.1[0] - expected.1[0]) < accuracy && abs(result.1[1] - expected.1[1]) < accuracy, "Power failed")
    }

    @Test func testPowerComplexArrayReal() {
        let result: ComplexArray = complexArrayA ** realB
        let expected: ComplexArray = ([1.0, 1.0], [1.0, 1.0])
        #expect(abs(result.0[0] - expected.0[0]) < accuracy && abs(result.0[1] - expected.0[1]) < accuracy && abs(result.1[0] - expected.1[0]) < accuracy && abs(result.1[1] - expected.1[1]) < accuracy, "Power failed")
    }

    @Test func testPowerRealComplexArray() {
        let result: ComplexArray = realA ** complexArrayB
        let expected: ComplexArray = ([1.0, 1.0], [0.0, 0.0])
        #expect(abs(result.0[0] - expected.0[0]) < accuracy && abs(result.0[1] - expected.0[1]) < accuracy && abs(result.1[0] - expected.1[0]) < accuracy && abs(result.1[1] - expected.1[1]) < accuracy, "Power failed")
    }

    @Test func testPowerComplexArrayRealArray() {
        let result: ComplexArray = complexArrayA ** realArrayB
        let expected: ComplexArray = ([1.0, 0.0], [1.0, 2.0])
        #expect(abs(result.0[0] - expected.0[0]) < accuracy && abs(result.0[1] - expected.0[1]) < accuracy && abs(result.1[0] - expected.1[0]) < accuracy && abs(result.1[1] - expected.1[1]) < accuracy, "Power failed")
    }

    @Test func testPowerRealArrayComplexArray() {
        let result: ComplexArray = realArrayA ** complexArrayB
        let expected: ComplexArray = ([1.0, 1.538477802728], [0.0, 1.277922552627])
        #expect(abs(result.0[0] - expected.0[0]) < accuracy && abs(result.0[1] - expected.0[1]) < accuracy && abs(result.1[0] - expected.1[0]) < accuracy && abs(result.1[1] - expected.1[1]) < accuracy, "Power failed")
    }
}
