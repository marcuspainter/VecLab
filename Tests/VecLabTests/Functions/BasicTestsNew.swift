//
//  BasicTestsNew.swift
//
//
//  Created by Marcus Painter on 25/09/2023.
//

import Foundation
import VecLab
import Testing

struct BasicTestsNew {

    let accuracy: Real = 1e-6

    // MARK: array

    @Test func testAbsRealArray() throws {
        let realArrayA: RealArray = [-1.0, 2.0, -3.0, 4.0]
        let result: RealArray = abs(realArrayA)
        let expected: RealArray = [1.0, 2.0, 3.0, 4.0]
        #expect(abs(result[0] - expected[0]) < accuracy && abs(result[1] - expected[1]) < accuracy && abs(result[2] - expected[2]) < accuracy && abs(result[3] - expected[3]) < accuracy, "abs failed")
    }

    // MARK: all

    @Test func testAllRealArrayTrue() throws {
        let realArrayA: RealArray = [0.0, 2.0, 3.0, 4.0]
        let result: Bool = all(realArrayA)
        #expect(result, "all failed")
    }

    @Test func testAllRealArrayFalse() throws {
        let realArrayA: RealArray = [0.0, 0.0, 0.0, 0.0]
        let result: Bool = all(realArrayA)
        #expect(!result, "all failed")
    }

    // MARK: any

    @Test func testAnyRealArrayTrue() throws {
        let realArrayA: RealArray = [0.0, 2.0, 3.0, 4.0]
        let result: Bool = any(realArrayA)
        #expect(result, "any failed")
    }

    // TODO: Fix
/*
    @Test func testAnyRealArrayFalse() throws {
        let realArrayA: RealArray = [1.0, 2.0, 3.0, 4.0]
        let result: Bool = any(realArrayA)
        #expect(!result, "any failed")
    }
*/
    // MARK: cumsum

    @Test func testCumsumRealArray() throws {
        let realArrayA: RealArray = [1.0, 2.0, 3.0, 4.0]
        let result: RealArray = cumsum(realArrayA)
        let expected: RealArray = [1.0, 3.0, 6.0, 10.0]
        #expect(abs(result[0] - expected[0]) < accuracy && abs(result[1] - expected[1]) < accuracy && abs(result[2] - expected[2]) < accuracy && abs(result[3] - expected[3]) < accuracy, "cumsum failed")
    }

    @Test func testCumsumComplexArray() throws {
        let complexArrayA: ComplexArray = ([1.0, 2.0, 3.0, 4.0], [1.0, 2.0, 3.0, 4.0])
        let result: ComplexArray = cumsum(complexArrayA)
        let expected: ComplexArray = ([1.0, 3.0, 6.0, 10.0], [1.0, 3.0, 6.0, 10.0])
        #expect(abs(result.0[0] - expected.0[0]) < accuracy && abs(result.0[1] - expected.0[1]) < accuracy && abs(result.0[2] - expected.0[2]) < accuracy && abs(result.0[3] - expected.0[3]) < accuracy && abs(result.1[0] - expected.1[0]) < accuracy && abs(result.1[1] - expected.1[1]) < accuracy && abs(result.1[2] - expected.1[2]) < accuracy && abs(result.1[3] - expected.1[3]) < accuracy, "cumsum failed")
    }

    // MARK: disp

    @Test func testDispRealArray() throws {
        let realArrayA: RealArray = [1.0, 2.0, 3.0, 4.0]
        disp(realArrayA)
    }

    @Test func testDispComplexArray() throws {
        let complexArrayA: ComplexArray = ([1.0, 2.0, 3.0, 4.0], [1.0, 2.0, 3.0, 4.0])
        disp(complexArrayA)
    }

    @Test func testDispAny() throws {
        let object: Any = (1, 2, 3)
        disp(object)
    }

    // MARK: iterate

    @Test func testIterateRealArray() throws {
        let realArrayA: RealArray = [1.0, 2.0, 3.0, 4.0]
        let result: RealArray = iterate(realArrayA) { -$0 }
        let expected: RealArray = [-1.0, -2.0, -3.0, -4.0]
        #expect(abs(result[0] - expected[0]) < accuracy && abs(result[1] - expected[1]) < accuracy && abs(result[2] - expected[2]) < accuracy && abs(result[3] - expected[3]) < accuracy, "iterate failed")
    }

    @Test func testIterateRealArrayInt() throws {
        let realArrayA: RealArray = [1.0, 2.0, 3.0, 4.0]
        let result: RealArray = iterate(realArrayA) { $0 * Real($1) }
        let expected: RealArray = [0.0, 2.0, 6.0, 12.0]
        #expect(abs(result[0] - expected[0]) < accuracy && abs(result[1] - expected[1]) < accuracy && abs(result[2] - expected[2]) < accuracy && abs(result[3] - expected[3]) < accuracy, "iterate failed")
    }

    @Test func testIterateComplexArray() throws {
        let complexArrayA: ComplexArray = ([1.0, 2.0, 3.0, 4.0], [1.0, 2.0, 3.0, 4.0])
        let result: ComplexArray = iterate(complexArrayA) { -$0 }
        let expected: ComplexArray = ([-1.0, -2.0, -3.0, -4.0], [-1.0, -2.0, -3.0, -4.0])
        #expect(abs(result.0[0] - expected.0[0]) < accuracy && abs(result.0[1] - expected.0[1]) < accuracy && abs(result.0[2] - expected.0[2]) < accuracy && abs(result.0[3] - expected.0[3]) < accuracy && abs(result.1[0] - expected.1[0]) < accuracy && abs(result.1[1] - expected.1[1]) < accuracy && abs(result.1[2] - expected.1[2]) < accuracy && abs(result.1[3] - expected.1[3]) < accuracy, "iterate failed")
    }

    @Test func testIterateComplexArrayInt() throws {
        let complexArrayA: ComplexArray = ([1.0, 2.0, 3.0, 4.0], [1.0, 2.0, 3.0, 4.0])
        let result: ComplexArray = iterate(complexArrayA) { $0 * Real($1) }
        let expected: ComplexArray = ([0.0, 2.0, 6.0, 12.0], [0.0, 2.0, 6.0, 12.0])
        #expect(abs(result.0[0] - expected.0[0]) < accuracy && abs(result.0[1] - expected.0[1]) < accuracy && abs(result.0[2] - expected.0[2]) < accuracy && abs(result.0[3] - expected.0[3]) < accuracy && abs(result.1[0] - expected.1[0]) < accuracy && abs(result.1[1] - expected.1[1]) < accuracy && abs(result.1[2] - expected.1[2]) < accuracy && abs(result.1[3] - expected.1[3]) < accuracy, "iterate failed")
    }

    // MARK: norm

    @Test func testNormRealArray() throws {
        let realArrayA: RealArray = [1.0, 2.0, 3.0, 4.0]
        let result: Real = norm(realArrayA)
        let expected: Real = 5.477225575051661
        #expect(abs(result - expected) < accuracy, "norm failed")
    }

    // MARK: prod

    @Test func testProdRealArray() throws {
        let realArrayA: RealArray = [1.0, 2.0, 3.0, 4.0]
        let result: Real = prod(realArrayA)
        let expected: Real = 24.0
        #expect(abs(result - expected) < accuracy, "prod failed")
    }

    @Test func testProdComplexArray() throws {
        let complexArrayA: ComplexArray = ([1.0, 2.0, 3.0, 4.0], [1.0, 2.0, 3.0, 4.0])
        let result: Complex = prod(complexArrayA)
        let expected: Complex = (-96.0, 0.0)
        #expect(abs(result.0 - expected.0) < accuracy && abs(result.1 - expected.1) < accuracy, "prod failed")
    }

    // MARK: sign

    @Test func testSignReal2() throws {
        let realA: Real = 2.0
        let result: Real = sign(realA)
        let expected: Real = 1.0
        #expect(abs(result - expected) < accuracy, "sign failed")
    }

    @Test func testSignReal0() throws {
        let realA: Real = 0.0
        let result: Real = sign(realA)
        let expected: Real = 0.0
        #expect(abs(result - expected) < accuracy, "sign failed")
    }

    @Test func testSignRealMinus2() throws {
        let realA: Real = -2.0
        let result: Real = sign(realA)
        let expected: Real = -1.0
        #expect(abs(result - expected) < accuracy, "sign failed")
    }

    @Test func testSignRealArray() throws {
        let realArrayA: RealArray = [-2.0, 0.0, 2.0]
        let result: RealArray = sign(realArrayA)
        let expected: RealArray = [-1.0, 0.0, 1.0]
        #expect(abs(result[0] - expected[0]) < accuracy && abs(result[1] - expected[1]) < accuracy && abs(result[2] - expected[2]) < accuracy, "sign failed")
    }

    @Test func testSignComplex() throws {
        let complexA: Complex = (1.0, 2.0)
        let result: Complex = sign(complexA)
        let expected: Complex = (0.447213595499958, 0.894427190999916)
        #expect(abs(result.0 - expected.0) < accuracy && abs(result.1 - expected.1) < accuracy, "sign failed")
    }

    @Test func testSignComplexArray() throws {
        let complexA: ComplexArray = ([1.0, 2.0], [1.0, 2.0])
        let result: ComplexArray = sign(complexA)
        let expected: ComplexArray = ([0.707106781186547, 0.707106781186547], [0.707106781186547, 0.707106781186547])
        #expect(abs(result.0[0] - expected.0[0]) < accuracy && abs(result.0[1] - expected.0[1]) < accuracy && abs(result.1[0] - expected.1[0]) < accuracy && abs(result.1[1] - expected.1[1]) < accuracy, "sign failed")
    }

    // MARK: sinc

    @Test func testSincReal() throws {
        let realA: Real = 2.0
        let result: Real = sinc(realA)
        let expected: Real = -3.898171832519375e-17
        #expect(abs(result - expected) < accuracy, "sinc failed")
    }

    @Test func testSincReal0() throws {
        let realA: Real = 0.0
        let result: Real = sinc(realA)
        let expected: Real = 1.0
        #expect(abs(result - expected) < accuracy, "sinc failed")
    }

    @Test func testSincRealArray() throws {
        let realArrayA: RealArray = [1.0, 2.0, 3.0, 4.0]
        let result: RealArray = sinc(realArrayA)
        let expected: RealArray = [3.898171832519375e-17, -3.898171832519375e-17, 3.898171832519375e-17, -3.898171832519375e-17]
        #expect(abs(result[0] - expected[0]) < accuracy && abs(result[1] - expected[1]) < accuracy && abs(result[2] - expected[2]) < accuracy && abs(result[3] - expected[3]) < accuracy, "sinc failed")
    }

    // MARK: sum

    @Test func testSumdRealArray() throws {
        let realArrayA: RealArray = [1.0, 2.0, 3.0, 4.0]
        let result: Real = sum(realArrayA)
        let expected: Real = 10.0
        #expect(abs(result - expected) < accuracy, "sum failed")
    }

    @Test func testSumComplexArray() throws {
        let complexArrayA: ComplexArray = ([1.0, 2.0, 3.0, 4.0], [1.0, 2.0, 3.0, 4.0])
        let result: Complex = sum(complexArrayA)
        let expected: Complex = (10.0, 10.0)
        #expect(abs(result.0 - expected.0) < accuracy && abs(result.1 - expected.1) < accuracy, "sum failed")
    }

}

/*
 [0.0, 0.0, 0.0, 0.0]

 any(): Returns true if at least one element is non-zero.
 all(): Returns true if all elements are non-zero.
 */
