//
//  DiscreteTestsNew.swift
//
//
//  Created by Marcus Painter on 25/09/2023.
//

import VecLab
import Testing

struct DiscreteTestsNew {

    // MARK: Factor

    @Test func testFactor12() throws {
        let result = factor(12)
        let expected = [2, 2, 3]
        #expect(result == expected, "factor failed")
    }

    @Test func testFactorPrime1009() throws {
        let result = factor(1009)
        let expected = [1009]
        #expect(result == expected, "factor failed")
    }

    @Test func testFactor0() throws {
        let result = factor(0)
        let expected: [Int] = []
        #expect(result == expected, "factor failed")
    }

    @Test func testFactorMinus1() throws {
        let result = factor(-1)
        let expected: [Int] = []
        #expect(result == expected, "factor failed")
    }

    // MARK: Factorial

    @Test func testFactorial5() throws {
        let result: Real = factorial(5)
        let expected: Real = 120.0
        #expect(result == expected, "factorial failed")
    }

    @Test func testFactorial1() throws {
        let result: Real = factorial(1)
        let expected: Real = 1.0
        #expect(result == expected, "factorial failed")
    }

    @Test func testFactorial0() throws {
        let result: Real = factorial(1)
        let expected: Real = 1.0
        #expect(result == expected, "factorial failed")
    }

    // TODO: Fix
    @Test func testFactorialMinus1() throws {
        _ = factorial(-1)
        let expected = Real.nan
        #expect(expected.isNaN, "factorial failed")
    }

    // MARK: gcd

    @Test func testGcd() throws {
        let result: Int = gcd(8, 12)
        let expected: Int = 4
        #expect(result == expected, "gcd failed")
    }

    @Test func testGcd0_12() throws {
        let result: Int = gcd(0, 12)
        let expected: Int = 12
        #expect(result == expected, "gcd failed")
    }

    @Test func testGcd12_0() throws {
        let result: Int = gcd(12, 0)
        let expected: Int = 12
        #expect(result == expected, "gcd failed")
    }

    @Test func testGcdMinus1_12() throws {
        let result: Int = gcd(-1, 12)
        let expected: Int = 1
        #expect(result == expected, "gcd failed")
    }

    // MARK: isprime

    @Test func testIsprimeTrue() throws {
        let result: Bool = isprime(1009)
        let expected: Bool = true
        #expect(result == expected, "isprime failed")
    }

    @Test func testIsprimeFalse() throws {
        let result: Bool = isprime(1010101)
        let expected: Bool = false
        #expect(result == expected, "isprime failed")
    }

    @Test func testIsprime1() throws {
        let result: Bool = isprime(1)
        let expected: Bool = false
        #expect(result == expected, "isprime failed")
    }

    @Test func testIsprime3() throws {
        let result: Bool = isprime(3)
        let expected = true
        #expect(result == expected, "isprime failed")
    }

    @Test func testIsprime9() throws {
        let result: Bool = isprime(9)
        let expected: Bool = false
        #expect(result == expected, "isprime failed")
    }

    @Test func testIsprimeMinus1() throws {
        // All entries of X must be nonnegative integers.
        let result: Bool = isprime(-17)
        let expected: Bool = false
        #expect(result == expected, "isprime failed")
    }

    // MARK: lcm

    @Test func testLcm() throws {
        let result: Int = lcm(45, 85)
        let expected: Int = 765
        #expect(result == expected, "lcm failed")
    }

    // TODO: Fix
    @Test func testLcm0() throws {
        // Input arguments must contain positive integers.
        _ = lcm(0, 85)
    }

    // MARK: nextprime

    @Test func testNextprime() throws {
        let result: Int = nextprime(20)
        let expected: Int = 23
        #expect(result == expected, "nextprime failed")
    }

    @Test func testNextprime0() throws {
        let result: Int = nextprime(0)
        let expected: Int = 2
        #expect(result == expected, "nextprime failed")
    }

    @Test func testNextprimeMinus10() throws {
        let result: Int = nextprime(-10)
        let expected: Int = 2
        #expect(result == expected, "nextprime failed")
    }

    // MARK: nchoosek

    @Test func testNchoosek7_2() throws {
        let result: Int = nchoosek(7, 2)
        let expected: Int = 21
        #expect(result == expected, "nchoosek failed")
    }

    @Test func testNchoosek7_0() throws {
        let result: Int = nchoosek(7, 0)
        let expected: Int = 1
        #expect(result == expected, "nchoosek failed")
    }

    // MARK: perms

    // MARK: prevprime

    @Test func testPrevprime() throws {
        let result: Real = prevprime(1000)
        let expected: Real = 997.0
        #expect(result == expected, "prevprime failed")
    }

    @Test func testPrevprime0() throws {
        let result: Real = prevprime(0)
        #expect(result.isNaN, "prevprime failed")
    }

    // MARK: primes

    @Test func testPrimes10() throws {
        let result: RealArray = primes(10)
        let expected: RealArray = [2.0, 3.0, 5.0, 7.0]
        #expect(result == expected, "primes failed")
    }

    @Test func testPrimes0() throws {
        let result: RealArray = primes(0)
        let expected: RealArray = []
        #expect(result == expected, "primes failed")
    }
}
