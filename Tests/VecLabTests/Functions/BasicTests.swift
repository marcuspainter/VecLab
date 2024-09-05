//
//  BasicTests.swift
//
//
//  Created by Marcus Painter on 25/09/2023.
//

import Foundation
import VecLab
import XCTest

class BasicTests: XCTestCase {

    let accuracy: RealDouble = 1e-6

    // MARK: array

    func testAbsRealArray() throws {
        let realArrayA: RealDoubleArray = [-1.0, 2.0, -3.0, 4.0]
        let result: RealDoubleArray = abs(realArrayA)
        let expected: RealDoubleArray = [1.0, 2.0, 3.0, 4.0]
        XCTAssertEqual(result, expected, accuracy: accuracy, "abs failed")
    }

    // MARK: all

    func testAllRealArrayTrue() throws {
        let realArrayA: RealDoubleArray = [0.0, 2.0, 3.0, 4.0]
        let result: Bool = all(realArrayA)
        XCTAssert(result, "all failed")
    }

    func testAllRealArrayFalse() throws {
        let realArrayA: RealDoubleArray = [0.0, 0.0, 0.0, 0.0]
        let result: Bool = all(realArrayA)
        XCTAssert(!result, "all failed")
    }

    // MARK: any

    func testAnyRealArrayTrue() throws {
        let realArrayA: RealDoubleArray = [0.0, 2.0, 3.0, 4.0]
        let result: Bool = any(realArrayA)
        XCTAssert(result, "any failed")
    }

    // TODO: Fix
/*
    func testAnyRealArrayFalse() throws {
        let realArrayA: RealDoubleArray = [1.0, 2.0, 3.0, 4.0]
        let result: Bool = any(realArrayA)
        XCTAssert(!result, "any failed")
    }
*/
    // MARK: cumsum

    func testCumsumRealArray() throws {
        let realArrayA: RealDoubleArray = [1.0, 2.0, 3.0, 4.0]
        let result: RealDoubleArray = cumsum(realArrayA)
        let expected: RealDoubleArray = [1.0, 3.0, 6.0, 10.0]
        XCTAssertEqual(result, expected, accuracy: accuracy, "cumsum failed")
    }

    func testCumsumComplexArray() throws {
        let complexArrayA: ComplexDoubleArray = ([1.0, 2.0, 3.0, 4.0], [1.0, 2.0, 3.0, 4.0])
        let result: ComplexDoubleArray = cumsum(complexArrayA)
        let expected: ComplexDoubleArray = ([1.0, 3.0, 6.0, 10.0], [1.0, 3.0, 6.0, 10.0])
        XCTAssertEqual(result, expected, accuracy: accuracy, "cumsum failed")
    }

    // MARK: disp

    func testDispRealArray() throws {
        let realArrayA: RealDoubleArray = [1.0, 2.0, 3.0, 4.0]
        disp(realArrayA)
    }

    func testDispComplexArray() throws {
        let complexArrayA: ComplexDoubleArray = ([1.0, 2.0, 3.0, 4.0], [1.0, 2.0, 3.0, 4.0])
        disp(complexArrayA)
    }

    func testDispAny() throws {
        let object: Any = (1, 2, 3)
        disp(object)
    }

    // MARK: iterate

    func testIterateRealArray() throws {
        let realArrayA: RealDoubleArray = [1.0, 2.0, 3.0, 4.0]
        let result: RealDoubleArray = iterate(realArrayA) { -$0 }
        let expected: RealDoubleArray = [-1.0, -2.0, -3.0, -4.0]
        XCTAssertEqual(result, expected, accuracy: accuracy, "iterate failed")
    }

    func testIterateRealArrayInt() throws {
        let realArrayA: RealDoubleArray = [1.0, 2.0, 3.0, 4.0]
        let result: RealDoubleArray = iterate(realArrayA) { $0 * Double($1) }
        let expected: RealDoubleArray = [0.0, 2.0, 6.0, 12.0]
        XCTAssertEqual(result, expected, accuracy: accuracy, "iterate failed")
    }

    func testIterateComplexArray() throws {
        let complexArrayA: ComplexDoubleArray = ([1.0, 2.0, 3.0, 4.0], [1.0, 2.0, 3.0, 4.0])
        let result: ComplexDoubleArray = iterate(complexArrayA) { -$0 }
        let expected: ComplexDoubleArray = ([-1.0, -2.0, -3.0, -4.0], [-1.0, -2.0, -3.0, -4.0])
        XCTAssertEqual(result, expected, accuracy: accuracy, "iterate failed")
    }

    func testIterateComplexArrayInt() throws {
        let complexArrayA: ComplexDoubleArray = ([1.0, 2.0, 3.0, 4.0], [1.0, 2.0, 3.0, 4.0])
        let result: ComplexDoubleArray = iterate(complexArrayA) { $0 * Double($1) }
        let expected: ComplexDoubleArray = ([0.0, 2.0, 6.0, 12.0], [0.0, 2.0, 6.0, 12.0])
        XCTAssertEqual(result, expected, accuracy: accuracy, "iterate failed")
    }

    // MARK: norm

    func testNormRealArray() throws {
        let realArrayA: RealDoubleArray = [1.0, 2.0, 3.0, 4.0]
        let result: RealDouble = norm(realArrayA)
        let expected: RealDouble = 5.477225575051661
        XCTAssertEqual(result, expected, accuracy: accuracy, "norm failed")
    }

    // MARK: prod

    func testProdRealArray() throws {
        let realArrayA: RealDoubleArray = [1.0, 2.0, 3.0, 4.0]
        let result: RealDouble = prod(realArrayA)
        let expected: RealDouble = 24.0
        XCTAssertEqual(result, expected, accuracy: accuracy, "prod failed")
    }

    func testProdComplexArray() throws {
        let complexArrayA: ComplexDoubleArray = ([1.0, 2.0, 3.0, 4.0], [1.0, 2.0, 3.0, 4.0])
        let result: ComplexDouble = prod(complexArrayA)
        let expected: ComplexDouble = (-96.0, 0.0)
        XCTAssertEqual(result, expected, accuracy: accuracy, "prod failed")
    }

    // MARK: sign

    func testSignReal2() throws {
        let realA: RealDouble = 2.0
        let result: RealDouble = sign(realA)
        let expected: RealDouble = 1.0
        XCTAssertEqual(result, expected, accuracy: accuracy, "sign failed")
    }

    func testSignReal0() throws {
        let realA: RealDouble = 0.0
        let result: RealDouble = sign(realA)
        let expected: RealDouble = 0.0
        XCTAssertEqual(result, expected, accuracy: accuracy, "sign failed")
    }

    func testSignRealMinus2() throws {
        let realA: RealDouble = -2.0
        let result: RealDouble = sign(realA)
        let expected: RealDouble = -1.0
        XCTAssertEqual(result, expected, accuracy: accuracy, "sign failed")
    }

    func testSignRealArray() throws {
        let realArrayA: RealDoubleArray = [-2.0, 0.0, 2.0]
        let result: RealDoubleArray = sign(realArrayA)
        let expected: RealDoubleArray = [-1.0, 0.0, 1.0]
        XCTAssertEqual(result, expected, accuracy: accuracy, "sign failed")
    }

    func testSignComplex() throws {
        let complexA: ComplexDouble = (1.0, 2.0)
        let result: ComplexDouble = sign(complexA)
        let expected: ComplexDouble = (0.447213595499958, 0.894427190999916)
        XCTAssertEqual(result, expected, accuracy: accuracy, "sign failed")
    }

    func testSignComplexArray() throws {
        let complexA: ComplexDoubleArray = ([1.0, 2.0], [1.0, 2.0])
        let result: ComplexDoubleArray = sign(complexA)
        let expected: ComplexDoubleArray = ([0.707106781186547, 0.707106781186547], [0.707106781186547, 0.707106781186547])
        XCTAssertEqual(result, expected, accuracy: accuracy, "sign failed")
    }

    // MARK: sinc

    func testSincReal() throws {
        let realA: RealDouble = 2.0
        let result: RealDouble = sinc(realA)
        let expected: RealDouble = -3.898171832519375e-17
        XCTAssertEqual(result, expected, accuracy: accuracy, "sinc failed")
    }

    func testSincReal0() throws {
        let realA: RealDouble = 0.0
        let result: RealDouble = sinc(realA)
        let expected: RealDouble = 1.0
        XCTAssertEqual(result, expected, accuracy: accuracy, "sinc failed")
    }

    func testSincRealArray() throws {
        let realArrayA: RealDoubleArray = [1.0, 2.0, 3.0, 4.0]
        let result: RealDoubleArray = sinc(realArrayA)
        let expected: RealDoubleArray = [3.898171832519375e-17, -3.898171832519375e-17, 3.898171832519375e-17, -3.898171832519375e-17]
        XCTAssertEqual(result, expected, accuracy: accuracy, "sinc failed")
    }

    // MARK: sum

    func testSumdRealArray() throws {
        let realArrayA: RealDoubleArray = [1.0, 2.0, 3.0, 4.0]
        let result: RealDouble = sum(realArrayA)
        let expected: RealDouble = 10.0
        XCTAssertEqual(result, expected, accuracy: accuracy, "sum failed")
    }

    func testSumComplexArray() throws {
        let complexArrayA: ComplexDoubleArray = ([1.0, 2.0, 3.0, 4.0], [1.0, 2.0, 3.0, 4.0])
        let result: ComplexDouble = sum(complexArrayA)
        let expected: ComplexDouble = (10.0, 10.0)
        XCTAssertEqual(result, expected, accuracy: accuracy, "sum failed")
    }
    
    func testDotReal1() throws {
        let realArrayA: RealDoubleArray = [1.0, 2.0, 3.0, 4.0]
        let result: RealDouble = dot(realArrayA, realArrayA)
        let expected: RealDouble = 30.0
        XCTAssertEqual(result, expected, accuracy: accuracy, "dot failed")
    }
    
    func testDot2Real() throws {
        let realArrayA: RealDoubleArray = [1.0, 2.0, 3.0, 4.0]
        let realArrayB: RealDoubleArray = [5.0, 6.0, 7.0, 8.0]
        let result: RealDouble = dot(realArrayA, realArrayB)
        let expected: RealDouble = 70.0
        XCTAssertEqual(result, expected, accuracy: accuracy, "dot failed")
    }

    func testDotRealComplex() throws {
        let realArrayA: RealDoubleArray = [1.0, 2.0, 3.0, 4.0]
        let complexArrayB: ComplexDoubleArray = ([1.0, 2.0, 3.0, 4.0], [1.0, 2.0, 3.0, 4.0])
        let result: ComplexDouble = dot(realArrayA, complexArrayB)
        let expected: ComplexDouble = (30.0000, 30.0000)
        XCTAssertEqual(result, expected, accuracy: accuracy, "dot failed")
    }
    
    func testDotComplexReal() throws {
        let complexArrayA: ComplexDoubleArray = ([1.0, 2.0, 3.0, 4.0], [1.0, 2.0, 3.0, 4.0])
        let realArrayB: RealDoubleArray = [1.0, 2.0, 3.0, 4.0]
        let result: ComplexDouble = dot(complexArrayA, realArrayB)
        let expected: ComplexDouble = (30.0000, -30.0000)
        XCTAssertEqual(result, expected, accuracy: accuracy, "dot failed")
    }

    func testDotComplexComplex() throws {
        let complexArrayA: ComplexDoubleArray = ([1.0, 2.0, 3.0, 4.0], [1.0, 2.0, 3.0, 4.0])
        let complexArrayB: ComplexDoubleArray = ([5.0, 6.0, 7.0, 8.0], [5.0, 6.0, 7.0, 8.0])
        let result: ComplexDouble = dot(complexArrayA, complexArrayB)
        let expected: ComplexDouble = (140.0, 0.0)
        XCTAssertEqual(result, expected, accuracy: accuracy, "dot failed")
    }
}

/*
 [0.0, 0.0, 0.0, 0.0]

 any(): Returns true if at least one element is non-zero.
 all(): Returns true if all elements are non-zero.
 */
