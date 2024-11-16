//
//  ExponentTests.swift
//
//
//  Created by Marcus Painter on 25/09/2023.
//

import XCTest
import VecLab

class ExponentTests: XCTestCase {

    let accuracy: Real = 1e-6

    // MARK: exp

    func testExpRealArray() throws {
        let realArrayA: RealArray = [1.0, 2.0]
        let result: RealArray = exp(realArrayA)
        let expected: RealArray = [2.718281828459046, 7.389056098930650]
        XCTAssertEqual(result, expected, accuracy: accuracy, "exp failed")
    }

    func testExpComplex() throws {
        let complexA: Complex = (1.0, 2.0)
        let result: Complex = exp(complexA)
        let expected: Complex = (-1.131204383756814, 2.471726672004819)
        XCTAssertEqual(result, expected, accuracy: accuracy, "exp failed")
    }

    func testExpComplexArray() throws {
        let complexArrayA: ComplexArray = ([1.0, 2.0], [1.0, 2.0])
        let result: ComplexArray = exp(complexArrayA)
        let expected: ComplexArray =  ([1.468693939915885, -3.074932320639359], [2.287355287178843, 6.718849697428250])
        XCTAssertEqual(result, expected, accuracy: accuracy, "exp failed")
    }

    // MARK: log

    func testLogRealArray() throws {
        let realArrayA: RealArray = [1.0, 2.0]
        let result: RealArray = log(realArrayA)
        let expected: RealArray = [0, 0.693147180559945]
        XCTAssertEqual(result, expected, accuracy: accuracy, "log failed")
    }

    func testLogComplex() throws {
        let complexA: Complex = (1.0, 2.0)
        let result: Complex = log(complexA)
        let expected: Complex = (0.804718956217050, 1.107148717794090)
        XCTAssertEqual(result, expected, accuracy: accuracy, "log failed")
    }

    func testLogComplexArray() throws {
        let complexArrayA: ComplexArray = ([1.0, 2.0], [1.0, 2.0])
        let result: ComplexArray = log(complexArrayA)
        let expected: ComplexArray =  ([0.346573590279973, 1.039720770839918], [0.785398163397448, 0.785398163397448])
        XCTAssertEqual(result, expected, accuracy: accuracy, "log failed")
    }

    // MARK: log2

    func testLog2RealArray() throws {
        let realArrayA: RealArray = [1.0, 2.0]
        let result: RealArray = log2(realArrayA)
        let expected: RealArray = [0.0, 1.0]
        XCTAssertEqual(result, expected, accuracy: accuracy, "log2 failed")
    }

    func testLog2Complex() throws {
        let complexA: Complex = (1.0, 2.0)
        let result: Complex = log2(complexA)
        let expected: Complex = (1.160964047443681, 1.597277964688109)
        XCTAssertEqual(result, expected, accuracy: accuracy, "log2 failed")
    }

    func testLog2ComplexArray() throws {
        let complexArrayA: ComplexArray = ([1.0, 2.0], [1.0, 2.0])
        let result: ComplexArray = log2(complexArrayA)
        let expected: ComplexArray =  ([0.500000000000000, 1.500000000000000], [1.133090035456799, 1.133090035456799])
        XCTAssertEqual(result, expected, accuracy: accuracy, "log2 failed")
    }

    // MARK: log10

    func testLog10RealArray() throws {
        let realArrayA: RealArray = [1.0, 2.0]
        let result: RealArray = log10(realArrayA)
        let expected: RealArray = [0.0, 0.301029995663981]
        XCTAssertEqual(result, expected, accuracy: accuracy, "log10 failed")
    }

    // TODO: fix

    func testLog10Complex() throws {
        let complexA: Complex = (1.0, 2.0)
        let result: Complex = log10(complexA)
        let expected: Complex = (0.349485002168009, 0.480828578784234)
        XCTAssertEqual(result, expected, accuracy: accuracy, "log10 failed")
    }

    func testLog10ComplexArray() throws {
        let complexArrayA: ComplexArray = ([1.0, 2.0], [1.0, 2.0])
        let result: ComplexArray = log10(complexArrayA)
        let expected: ComplexArray =  ([0.150514997831991, 0.451544993495972], [0.341094088460460, 0.341094088460460])
        XCTAssertEqual(result, expected, accuracy: accuracy, "log10 failed")
    }

    // MARK: nextpow2

    func testNextpow2() throws {
        let result: Int = nextpow2(3000)
        let expected: Int = 12
        XCTAssertEqual(result, expected, "nextpow2 failed")
    }

    func testNextpow2_0() throws {
        let result: Int = nextpow2(0)
        let expected: Int = 0
        XCTAssertEqual(result, expected, "nextpow2 failed")
    }

    func testNextpow2Minus1() throws {
        let result: Int = nextpow2(-1)
        let expected: Int = 0
        XCTAssertEqual(result, expected, "nextpow2 failed")
    }

    // MARK: sqrt

    func testSqrtRealArray() throws {
        let realArrayA: RealArray = [1.0, 2.0]
        let result: RealArray = sqrt(realArrayA)
        let expected: RealArray = [1.000000000000000, 1.414213562373095]
        XCTAssertEqual(result, expected, accuracy: accuracy, "sqrt failed")
    }

    func testSqrtComplex() throws {
        let complexA: Complex = (1.0, 2.0)
        let result: Complex = sqrt(complexA)
        let expected: Complex = (1.272019649514069, 0.786151377757423)
        XCTAssertEqual(result, expected, accuracy: accuracy, "sqrt failed")
    }

    func testSqrtComplexArray() throws {
        let complexArrayA: ComplexArray = ([1.0, 2.0], [1.0, 2.0])
        let result: ComplexArray = sqrt(complexArrayA)
        let expected: ComplexArray = ([1.098684113467810, 1.553773974030037], [0.455089860562227, 0.643594252905583])
        XCTAssertEqual(result, expected, accuracy: accuracy, "sqrt failed")
    }

}

