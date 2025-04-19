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

    let accuracy: Real = 1e-6

    // MARK: array

    func testAbsRealArray() throws {
        let realArrayA: RealArray = [-1.0, 2.0, -3.0, 4.0]
        let result: RealArray = abs(realArrayA)
        let expected: RealArray = [1.0, 2.0, 3.0, 4.0]
        XCTAssertEqual(result, expected, accuracy: accuracy, "abs failed")
    }

    // MARK: cumsum

    func testCumsumRealArray() throws {
        let realArrayA: RealArray = [1.0, 2.0, 3.0, 4.0]
        let result: RealArray = cumsum(realArrayA)
        let expected: RealArray = [1.0, 3.0, 6.0, 10.0]
        XCTAssertEqual(result, expected, accuracy: accuracy, "cumsum failed")
    }

    func testCumsumComplexArray() throws {
        let complexArrayA: ComplexArray = ComplexArray([1.0, 2.0, 3.0, 4.0], [1.0, 2.0, 3.0, 4.0])
        let result: ComplexArray = cumsum(complexArrayA)
        let expected: ComplexArray = ComplexArray([1.0, 3.0, 6.0, 10.0], [1.0, 3.0, 6.0, 10.0])
        XCTAssertEqual(result, expected, accuracy: accuracy, "cumsum failed")
    }

    // MARK: disp

    func testDispRealArray() throws {
        let realArrayA: RealArray = [1.0, 2.0, 3.0, 4.0]
        disp(realArrayA)
    }

    func testDispComplexArray() throws {
        let complexArrayA: ComplexArray = ComplexArray([1.0, 2.0, 3.0, 4.0], [1.0, 2.0, 3.0, 4.0])
        disp(complexArrayA)
    }

    func testDispAny() throws {
        let object: Any = (1, 2, 3)
        disp(object)
    }

    // MARK: iterate

    func testIterateRealArray() throws {
        let realArrayA: RealArray = [1.0, 2.0, 3.0, 4.0]
        let result: RealArray = iterate(realArrayA) { -$0 }
        let expected: RealArray = [-1.0, -2.0, -3.0, -4.0]
        XCTAssertEqual(result, expected, accuracy: accuracy, "iterate failed")
    }

    func testIterateRealArrayInt() throws {
        let realArrayA: RealArray = [1.0, 2.0, 3.0, 4.0]
        let result: RealArray = iterate(realArrayA) { $0 * Real($1) }
        let expected: RealArray = [0.0, 2.0, 6.0, 12.0]
        XCTAssertEqual(result, expected, accuracy: accuracy, "iterate failed")
    }

    func testIterateComplexArray() throws {
        let complexArrayA: ComplexArray = ComplexArray([1.0, 2.0, 3.0, 4.0], [1.0, 2.0, 3.0, 4.0])
        let result: ComplexArray = iterate(complexArrayA) { -$0 }
        let expected: ComplexArray = ComplexArray([-1.0, -2.0, -3.0, -4.0], [-1.0, -2.0, -3.0, -4.0])
        XCTAssertEqual(result, expected, accuracy: accuracy, "iterate failed")
    }

    func testIterateComplexArrayInt() throws {
        let complexArrayA: ComplexArray = ComplexArray([1.0, 2.0, 3.0, 4.0], [1.0, 2.0, 3.0, 4.0])
        let result: ComplexArray = iterate(complexArrayA) { $0 * Real($1) }
        let expected: ComplexArray = ComplexArray([0.0, 2.0, 6.0, 12.0], [0.0, 2.0, 6.0, 12.0])
        XCTAssertEqual(result, expected, accuracy: accuracy, "iterate failed")
    }

    // MARK: norm

    func testNormRealArray() throws {
        let realArrayA: RealArray = [1.0, 2.0, 3.0, 4.0]
        let result: Real = norm(realArrayA)
        let expected: Real = 5.477225575051661
        XCTAssertEqual(result, expected, accuracy: accuracy, "norm failed")
    }

    // MARK: prod

    func testProdRealArray() throws {
        let realArrayA: RealArray = [1.0, 2.0, 3.0, 4.0]
        let result: Real = prod(realArrayA)
        let expected: Real = 24.0
        XCTAssertEqual(result, expected, accuracy: accuracy, "prod failed")
    }

    func testProdComplexArray() throws {
        let complexArrayA: ComplexArray = ComplexArray([1.0, 2.0, 3.0, 4.0], [1.0, 2.0, 3.0, 4.0])
        let result: Complex = prod(complexArrayA)
        let expected: Complex = Complex(-96.0, 0.0)
        XCTAssertEqual(result, expected, accuracy: accuracy, "prod failed")
    }

    // MARK: sign

    func testSignReal2() throws {
        let realA: Real = 2.0
        let result: Real = sign(realA)
        let expected: Real = 1.0
        XCTAssertEqual(result, expected, accuracy: accuracy, "sign failed")
    }

    func testSignReal0() throws {
        let realA: Real = 0.0
        let result: Real = sign(realA)
        let expected: Real = 0.0
        XCTAssertEqual(result, expected, accuracy: accuracy, "sign failed")
    }

    func testSignRealMinus2() throws {
        let realA: Real = -2.0
        let result: Real = sign(realA)
        let expected: Real = -1.0
        XCTAssertEqual(result, expected, accuracy: accuracy, "sign failed")
    }

    func testSignRealArray() throws {
        let realArrayA: RealArray = [-2.0, 0.0, 2.0]
        let result: RealArray = sign(realArrayA)
        let expected: RealArray = [-1.0, 0.0, 1.0]
        XCTAssertEqual(result, expected, accuracy: accuracy, "sign failed")
    }

    func testSignComplex() throws {
        let complexA: Complex = Complex(1.0, 2.0)
        let result: Complex = sign(complexA)
        let expected: Complex = Complex(0.447213595499958, 0.894427190999916)
        XCTAssertEqual(result, expected, accuracy: accuracy, "sign failed")
    }

    func testSignComplexArray() throws {
        let complexA: ComplexArray = ComplexArray([1.0, 2.0], [1.0, 2.0])
        let result: ComplexArray = sign(complexA)
        let expected: ComplexArray = ComplexArray([0.707106781186547, 0.707106781186547], [0.707106781186547, 0.707106781186547])
        XCTAssertEqual(result, expected, accuracy: accuracy, "sign failed")
    }

    // MARK: sinc

    func testSincReal() throws {
        let realA: Real = 2.0
        let result: Real = sinc(realA)
        let expected: Real = -3.898171832519375e-17
        XCTAssertEqual(result, expected, accuracy: accuracy, "sinc failed")
    }

    func testSincReal0() throws {
        let realA: Real = 0.0
        let result: Real = sinc(realA)
        let expected: Real = 1.0
        XCTAssertEqual(result, expected, accuracy: accuracy, "sinc failed")
    }

    func testSincRealArray() throws {
        let realArrayA: RealArray = [1.0, 2.0, 3.0, 4.0]
        let result: RealArray = sinc(realArrayA)
        let expected: RealArray = [3.898171832519375e-17, -3.898171832519375e-17, 3.898171832519375e-17, -3.898171832519375e-17]
        XCTAssertEqual(result, expected, accuracy: accuracy, "sinc failed")
    }

    // MARK: sum

    func testSumdRealArray() throws {
        let realArrayA: RealArray = [1.0, 2.0, 3.0, 4.0]
        let result: Real = sum(realArrayA)
        let expected: Real = 10.0
        XCTAssertEqual(result, expected, accuracy: accuracy, "sum failed")
    }

    func testSumComplexArray() throws {
        let complexArrayA: ComplexArray = ComplexArray([1.0, 2.0, 3.0, 4.0], [1.0, 2.0, 3.0, 4.0])
        let result: Complex = sum(complexArrayA)
        let expected: Complex = Complex(10.0, 10.0)
        XCTAssertEqual(result, expected, accuracy: accuracy, "sum failed")
    }
    
    func testDotReal1() throws {
        let realArrayA: RealArray = [1.0, 2.0, 3.0, 4.0]
        let result: Real = dot(realArrayA, realArrayA)
        let expected: Real = 30.0
        XCTAssertEqual(result, expected, accuracy: accuracy, "dot failed")
    }
    
    func testDot2Real() throws {
        let realArrayA: RealArray = [1.0, 2.0, 3.0, 4.0]
        let realArrayB: RealArray = [5.0, 6.0, 7.0, 8.0]
        let result: Real = dot(realArrayA, realArrayB)
        let expected: Real = 70.0
        XCTAssertEqual(result, expected, accuracy: accuracy, "dot failed")
    }

    func testDotRealComplex() throws {
        let realArrayA: RealArray = [1.0, 2.0, 3.0, 4.0]
        let complexArrayB: ComplexArray = ComplexArray([1.0, 2.0, 3.0, 4.0], [1.0, 2.0, 3.0, 4.0])
        let result: Complex = dot(realArrayA, complexArrayB)
        let expected: Complex = Complex(30.0000, 30.0000)
        XCTAssertEqual(result, expected, accuracy: accuracy, "dot failed")
    }
    
    func testDotComplexReal() throws {
        let complexArrayA: ComplexArray = ComplexArray([1.0, 2.0, 3.0, 4.0], [1.0, 2.0, 3.0, 4.0])
        let realArrayB: RealArray = [1.0, 2.0, 3.0, 4.0]
        let result: Complex = dot(complexArrayA, realArrayB)
        let expected: Complex = Complex(30.0000, -30.0000)
        XCTAssertEqual(result, expected, accuracy: accuracy, "dot failed")
    }

    func testDotComplexComplex() throws {
        let complexArrayA: ComplexArray = ComplexArray([1.0, 2.0, 3.0, 4.0], [1.0, 2.0, 3.0, 4.0])
        let complexArrayB: ComplexArray = ComplexArray([5.0, 6.0, 7.0, 8.0], [5.0, 6.0, 7.0, 8.0])
        let result: Complex = dot(complexArrayA, complexArrayB)
        let expected: Complex = Complex(140.0, 0.0)
        XCTAssertEqual(result, expected, accuracy: accuracy, "dot failed")
    }
}

/*
 [0.0, 0.0, 0.0, 0.0]

 any(): Returns true if at least one element is non-zero.
 all(): Returns true if all elements are non-zero.
 */
