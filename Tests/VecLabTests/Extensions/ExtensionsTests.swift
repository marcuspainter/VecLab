//
//  ArrayTests.swift
//
//
//  Created by Marcus Painter on 25/09/2023.
//

import Foundation
import XCTest
import VecLab

class ExtensionsTests: XCTestCase {

    // MARK: ComplexDouble unit

    func testComplexUnit() throws {
        let result = Double.i
        let expected: ComplexDouble = (0.0, 1.0)
        XCTAssertEqual(result, expected, "Complex unit failed")
    }

    // MARK: Float

    func testNumericFloat() throws {
        let _: Float = 1.0.f
        let _: Float = Float(1.0).f
        let _: Float = 1.f
    }

    func testArrayInitCount() throws {
        let count = 10
        let result = [Double](count: 10)
        XCTAssertEqual(result.count, count, "Array init count failed")
    }

    // MARK: Array init range

    func testArrayInitRangeInt() throws {
        let count: Int = 5
        let result = [Double](1..<count)
        let expected: RealDoubleArray = [1.0, 2.0, 3.0, 4.0]
        XCTAssertEqual(result, expected, "Array init count failed")
    }

    func testArrayInitRangeReal() throws {
        let count: RealDouble = 5.0
        let result = [Double](1..<count)
        let expected: RealDoubleArray = [1.0, 2.0, 3.0, 4.0]
        XCTAssertEqual(result, expected, "Array init count failed")
    }

    func testArrayInitRangeIntBy() throws {
        let count: Int = 5
        let by: Int = 2
        let result = [Double](1..<count, by)
        let expected: RealDoubleArray = [1.0, 3.0]
        XCTAssertEqual(result, expected, "Array init count failed")
    }

    func testArrayInitRangeRealBy() throws {
        let count: RealDouble = 5.0
        let by: RealDouble = 2.0
        let result = [Double](1..<count, by)
        let expected: RealDoubleArray = [1.0, 3.0]
        XCTAssertEqual(result, expected, "Array init count failed")
    }

    func testArrayInitClosedRangeInt() throws {
        let count: Int = 4
        let result = [Double](1...count)
        let expected: RealDoubleArray = [1.0, 2.0, 3.0, 4.0]
        XCTAssertEqual(result, expected, "Array init count failed")
    }

    func testArrayInitClosedRangeReal() throws {
        let count: RealDouble = 4.0
        let result = [Double](1...count)
        let expected: RealDoubleArray = [1.0, 2.0, 3.0, 4.0]
        XCTAssertEqual(result, expected, "Array init count failed")
    }

    func testArrayInitClosedRangeIntBy() throws {
        let count: Int = 4
        let by: Int = 2
        let result = [Double](1...count, by)
        let expected: RealDoubleArray = [1.0, 3.0]
        XCTAssertEqual(result, expected, "Array init count failed")
    }

    func testArrayInitClosedRangeRealBy() throws {
        let count: RealDouble = 4.0
        let by: RealDouble = 2.0
        let result = [Double](1...count, by)
        let expected: RealDoubleArray = [1.0, 3.0]
        XCTAssertEqual(result, expected, "Array init count failed")
    }
    
    func testImaginarytUnitReal() throws {
        let result: ComplexDouble = Double(1.0).i
        let expected: ComplexDouble =  (0.0, 1.0)
        XCTAssertEqual(result, expected, "Real maginary unit failed")
    }
    
    func testImaginarytUnitFloat() throws {
        let result: ComplexFloat = Float(1.0).i
        let expected: ComplexFloat =  (0.0, 1.0)
        XCTAssertEqual(result, expected, "Float imaginary unit failed")
    }
    
    func testImaginarytUnitDouble() throws {
        let result: ComplexDouble = 1.0.i
        let expected: ComplexDouble =  (0.0, 1.0)
        XCTAssertEqual(result, expected, "Double imaginary unit failed")
    }
    
    func testImaginarytUnitInt() throws {
        let result: ComplexDouble = 1.i
        let expected: ComplexDouble =  (0.0, 1.0)
        XCTAssertEqual(result, expected, "Int Imaginary unit failed")
    }
    
    func testImaginaryStaticRealExtension() throws {
        let result: ComplexDouble = (1 + 1 * Double.i) + (2 + 2 * Double.i)
        let expected: ComplexDouble =  (3, 3)
        XCTAssertEqual(result, expected, "Real Imaginary unit failed")
    }
    
    func testImaginaryIntExtension() throws {
        let result: ComplexDouble = (1+1.i) + (2+2.i)
        let expected: ComplexDouble =  (3.0, 3.0)
        XCTAssertEqual(result, expected, "Double Imaginary unit failed")
    }
    
    func testImaginaryRealExtension() throws {
        let result: ComplexDouble = (1+1.0.i) + (2+2.0.i)
        let expected: ComplexDouble =  (3.0, 3.0)
        XCTAssertEqual(result, expected, "Double Imaginary unit failed")
    }
    
    func testImaginaryTuple() throws {
        let result: ComplexDouble = (1.0, 1.0) * (2.0, 2.0)
        let expected: ComplexDouble =  (0.0, 4.0)
        XCTAssertEqual(result, expected, "Tuple Imaginary unit failed")
    }
}



