//
//  Precedence.swift
//  VecLab
//
//  Created by Marcus Painter on 27/02/2025.
//

import VecLab
import XCTest

final class
    PrecedenceTests: XCTestCase
{

    let accuracy: Real = 1e-6

    func testMultiplicationBeforeAddition() {
        let a: RealArray = [1.0, 2.0, 3.0, 4.0]
        let b: RealArray = [5.0, 6.0, 7.0, 8.0]
        let result: RealArray = a + b * 2.0
        XCTAssertEqual(result, [11.0, 14.0, 17.0, 20.0])  // b * 2 first, then addition
    }

    func testDivisionBeforeSubtraction() {
        let a: RealArray = [10.0, 20.0, 30.0, 40.0]
        let b: RealArray = [2.0, 4.0, 5.0, 8.0]
        let result = a - b / 2.0
        XCTAssertEqual(result, [9.0, 18.0, 27.5, 36.0])  // b / 2 first, then subtraction
    }

    func testLeftAssociativityOfAddition() {
        let a: RealArray = [1.0, 2.0, 3.0, 4.0]
        let b: RealArray = [5.0, 6.0, 7.0, 8.0]
        let c: RealArray = [10.0, 20.0, 30.0, 40.0]
        let result: RealArray = (a + b) + c
        XCTAssertEqual(result, [16.0, 28.0, 40.0, 52.0])
    }

    func testLeftAssociativityOfSubtraction() {
        let a: RealArray = [20.0, 30.0, 40.0, 50.0]
        let b: RealArray = [5.0, 6.0, 7.0, 8.0]
        let c: RealArray = [2.0, 3.0, 4.0, 5.0]
        let result: RealArray = (a - b) - c
        XCTAssertEqual(result, [13.0, 21.0, 29.0, 37.0])
    }

    func testExplicitParenthesesChangePrecedence() {
        let a: RealArray = [1.0, 2.0, 3.0, 4.0]
        let b: RealArray = [5.0, 6.0, 7.0, 8.0]
        let result: RealArray = a + (b * 2.0)  // Ensuring explicit parentheses work correctly
        XCTAssertEqual(result, [11.0, 14.0, 17.0, 20.0])
    }

    func testPowerOperatorPrecedence() {
        let a: RealArray = [2.0, 3.0, 4.0, 5.0]
        let b: RealArray = [3.0, 2.0, 1.0, 0.5]
        let result: RealArray = a ** b
        XCTAssertEqual(result, [8.0, 9.0, 4.0, sqrt(5.0)])  // Power operation
    }

    func testPowerWithMultiplication() {
        let a: RealArray = [2.0, 3.0, 4.0, 5.0]
        let result: RealArray = 2.0 * a ** 2.0
        XCTAssertEqual(result, [8.0, 18.0, 32.0, 50.0])  // Exponentiation first, then multiplication
    }

    func testMixedOperatorsWithAdditionMultiplicationAndExponentiation() {
        let a: RealArray = [1.0, 2.0, 3.0, 4.0]
        let b: RealArray = [2.0, 3.0, 4.0, 5.0]
        let result: RealArray = a + b * 2.0 ** 2.0

        print(result)
        XCTAssertEqual(result, [9.0, 14.0, 19.0, 24.0])  // Power first, then multiplication, then addition
    }

    func testMixedOperatorsWithDivisionSubtractionAndExponentiation() {
        let a: RealArray = [1.0, 2.0, 3.0, 4.0]
        let b: RealArray = [2.0, 3.0, 4.0, 5.0]
        let result: RealArray = a / b - 2.0 ** 2.0
        print(result)
        XCTAssertEqual(
            result,
            [-3.500000000000000, -3.333333333333333, -3.250000000000000, -3.200000000000000],
            accuracy: accuracy
        )  // Power first, then division, then subtraction
    }

    func testExponentiation1() {
        let result: Real = 2 ** 2 ** 3
        print(result)
        XCTAssertEqual(
            result,
            64.0,
            accuracy: accuracy
        )  //
    }

    func testExponentiation2() {
        let result = (2 ** 2) ** 3
        print(result)
        XCTAssertEqual(
            result,
            64.0,
            accuracy: accuracy
        )  //
    }

    func testExponentiation3() {
        let result = 2 ** (2 ** 3)
        print(result)
        XCTAssertEqual(result, 256.0, accuracy: accuracy)  // Large number, decrease accuracy
    }

    func testExponentiationUnary() {
        let a = 2
        let result = -(a ** 2)
        print(result)
        XCTAssertEqual(result, -4.0, accuracy: accuracy)
    }

}
