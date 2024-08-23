//
//  DiscreteTests.swift
//
//
//  Created by Marcus Painter on 25/09/2023.
//

import XCTest
import VecLab

class DiscreteTests: XCTestCase {

    // MARK: Factor

    func testFactor12() throws {
        let result = factor(12)
        let expected = [2, 2, 3]
        XCTAssertEqual(result, expected, "factor failed")
    }

    func testFactorPrime1009() throws {
        let result = factor(1009)
        let expected = [1009]
        XCTAssertEqual(result, expected, "factor failed")
    }

    func testFactor0() throws {
        let result = factor(0)
        let expected: [Int] = []
        XCTAssertEqual(result, expected, "factor failed")
    }

    func testFactorMinus1() throws {
        let result = factor(-1)
        let expected: [Int] = []
        XCTAssertEqual(result, expected, "factor failed")
    }

    // MARK: Factorial

    func testFactorial5() throws {
        let result: Real = factorial(5)
        let expected: Real = 120.0
        XCTAssertEqual(result, expected, "factorial failed")
    }

    func testFactorial1() throws {
        let result: Real = factorial(1)
        let expected: Real = 1.0
        XCTAssertEqual(result, expected, "factorial failed")
    }

    func testFactorial0() throws {
        let result: Real = factorial(1)
        let expected: Real = 1.0
        XCTAssertEqual(result, expected, "factorial failed")
    }

    // TODO: Fix
    func testFactorialMinus1() throws {
        _ = factorial(-1)
        let expected = Real.nan
        XCTAssert(expected.isNaN, "factorial failed")
    }

    // MARK: gcd

    func testGcd() throws {
        let result: Int = gcd(8, 12)
        let expected: Int = 4
        XCTAssertEqual(result, expected, "gcd failed")
    }

    func testGcd0_12() throws {
        let result: Int = gcd(0, 12)
        let expected: Int = 12
        XCTAssertEqual(result, expected, "gcd failed")
    }

    func testGcd12_0() throws {
        let result: Int = gcd(12, 0)
        let expected: Int = 12
        XCTAssertEqual(result, expected, "gcd failed")
    }

    func testGcdMinus1_12() throws {
        let result: Int = gcd(-1, 12)
        let expected: Int = 1
        XCTAssertEqual(result, expected, "gcd failed")
    }

    // MARK: isprime

    func testIsprimeTrue() throws {
        let result: Bool = isprime(1009)
        let expected: Bool = true
        XCTAssertEqual(result, expected, "isprime failed")
    }

    func testIsprimeFalse() throws {
        let result: Bool = isprime(1010101)
        let expected: Bool = false
        XCTAssertEqual(result, expected, "isprime failed")
    }

    func testIsprime1() throws {
        let result: Bool = isprime(1)
        let expected: Bool = false
        XCTAssertEqual(result, expected, "isprime failed")
    }

    func testIsprime3() throws {
        let result: Bool = isprime(3)
        let expected = true
        XCTAssertEqual(result, expected, "isprime failed")
    }

    func testIsprime9() throws {
        let result: Bool = isprime(9)
        let expected: Bool = false
        XCTAssertEqual(result, expected, "isprime failed")
    }

    func testIsprimeMinus1() throws {
        // All entries of X must be nonnegative integers.
        let result: Bool = isprime(-17)
        let expected: Bool = false
        XCTAssertEqual(result, expected, "isprime failed")
    }

    // MARK: lcm

    func testLcm() throws {
        let result: Int = lcm(45, 85)
        let expected: Int = 765
        XCTAssertEqual(result, expected, "lcm failed")
    }

    // TODO: Fix
    func testLcm0() throws {
        // Input arguments must contain positive integers.
        _ = lcm(0, 85)
    }

    // MARK: nextprime

    func testNextprime() throws {
        let result: Int = nextprime(20)
        let expected: Int = 23
        XCTAssertEqual(result, expected, "nextprime failed")
    }

    func testNextprime0() throws {
        let result: Int = nextprime(0)
        let expected: Int = 2
        XCTAssertEqual(result, expected, "nextprime failed")
    }

    func testNextprimeMinus10() throws {
        let result: Int = nextprime(-10)
        let expected: Int = 2
        XCTAssertEqual(result, expected, "nextprime failed")
    }

    // MARK: nchoosek

    func testNchoosek7_2() throws {
        let result: Int = nchoosek(7, 2)
        let expected: Int = 21
        XCTAssertEqual(result, expected, "nchoosek failed")
    }

    func testNchoosek7_0() throws {
        let result: Int = nchoosek(7, 0)
        let expected: Int = 1
        XCTAssertEqual(result, expected, "nchoosek failed")
    }

    // MARK: perms

    // MARK: prevprime

    func testPrevprime() throws {
        let result: Real = prevprime(1000)
        let expected: Real = 997.0
        XCTAssertEqual(result, expected, "prevprime failed")
    }
    
    func testPrevprime2() throws {
        let result: Real = prevprime(2)
        XCTAssert(result == 2, "prevprime failed")
    }
    func testPrevprime1() throws {
        let result: Real = prevprime(1)
        XCTAssert(result.isNaN, "prevprime failed")
    }

    func testPrevprime0() throws {
        let result: Real = prevprime(0)
        XCTAssert(result.isNaN, "prevprime failed")
    }
    
    func testPrevprimeNegative() throws {
        let result: Real = prevprime(-1)
        XCTAssert(result.isNaN, "prevprime failed")
    }

    // MARK: primes

    func testPrimes10() throws {
        let result: RealArray = primes(10)
        let expected: RealArray = [2.0, 3.0, 5.0, 7.0]
        XCTAssertEqual(result, expected, "primes failed")
    }

    func testPrimes0() throws {
        let result: RealArray = primes(0)
        let expected: RealArray = []
        XCTAssertEqual(result, expected, "primes failed")
    }
}
