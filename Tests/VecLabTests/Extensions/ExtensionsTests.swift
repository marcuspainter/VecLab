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

    // MARK: Complex unit

    func testComplexUnit() throws {
        let result = Real.i
        let expected: Complex = (0.0, 1.0)
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
        let result = RealArray(count: 10)
        XCTAssertEqual(result.count, count, "Array init count failed")
    }

    // MARK: Array init range

    func testArrayInitRangeInt() throws {
        let count: Int = 5
        let result = RealArray(1..<count)
        let expected: RealArray = [1.0, 2.0, 3.0, 4.0]
        XCTAssertEqual(result, expected, "Array init count failed")
    }

    func testArrayInitRangeReal() throws {
        let count: Real = 5.0
        let result = RealArray(1..<count)
        let expected: RealArray = [1.0, 2.0, 3.0, 4.0]
        XCTAssertEqual(result, expected, "Array init count failed")
    }

    func testArrayInitRangeIntBy() throws {
        let count: Int = 5
        let by: Int = 2
        let result = RealArray(1..<count, by)
        let expected: RealArray = [1.0, 3.0]
        XCTAssertEqual(result, expected, "Array init count failed")
    }

    func testArrayInitRangeRealBy() throws {
        let count: Real = 5.0
        let by: Real = 2.0
        let result = RealArray(1..<count, by)
        let expected: RealArray = [1.0, 3.0]
        XCTAssertEqual(result, expected, "Array init count failed")
    }

    func testArrayInitClosedRangeInt() throws {
        let count: Int = 4
        let result = RealArray(1...count)
        let expected: RealArray = [1.0, 2.0, 3.0, 4.0]
        XCTAssertEqual(result, expected, "Array init count failed")
    }

    func testArrayInitClosedRangeReal() throws {
        let count: Real = 4.0
        let result = RealArray(1...count)
        let expected: RealArray = [1.0, 2.0, 3.0, 4.0]
        XCTAssertEqual(result, expected, "Array init count failed")
    }

    func testArrayInitClosedRangeIntBy() throws {
        let count: Int = 4
        let by: Int = 2
        let result = RealArray(1...count, by)
        let expected: RealArray = [1.0, 3.0]
        XCTAssertEqual(result, expected, "Array init count failed")
    }

    func testArrayInitClosedRangeRealBy() throws {
        let count: Real = 4.0
        let by: Real = 2.0
        let result = RealArray(1...count, by)
        let expected: RealArray = [1.0, 3.0]
        XCTAssertEqual(result, expected, "Array init count failed")
    }
    
    func testImaginarytUnitReal() throws {
        let result: Complex = Real(1.0).i
        let expected: Complex =  (0.0, 1.0)
        XCTAssertEqual(result, expected, "Real maginary unit failed")
    }
    
    func testImaginarytUnitFloat() throws {
        let result: Complex = Float(1.0).i
        let expected: Complex =  (0.0, 1.0)
        XCTAssertEqual(result, expected, "Float imaginary unit failed")
    }
    
    func testImaginarytUnitDouble() throws {
        let result: Complex = 1.0.i
        let expected: Complex =  (0.0, 1.0)
        XCTAssertEqual(result, expected, "Double imaginary unit failed")
    }
    
    func testImaginarytUnitInt() throws {
        let result: Complex = 1.i
        let expected: Complex =  (0.0, 1.0)
        XCTAssertEqual(result, expected, "Int Imaginary unit failed")
    }
    
    func testImaginaryStaticRealExtension() throws {
        let result: Complex = (1 + 1 * Real.i) + (2 + 2 * Real.i)
        let expected: Complex =  (3, 3)
        XCTAssertEqual(result, expected, "Real Imaginary unit failed")
    }
    
    func testImaginaryDoubleExtension() throws {
        let result: Complex = (1+1.i) + (2+2.i)
        let expected: Complex =  (3.0, 3.0)
        XCTAssertEqual(result, expected, "Double Imaginary unit failed")
    }
    
    func testImaginaryTuple() throws {
        let result: Complex = (1.0, 1.0) * (2.0, 2.0)
        let expected: Complex =  (0.0, 4.0)
        XCTAssertEqual(result, expected, "Tuple Imaginary unit failed")
    }
    
    //func testImaginaryTupleMultiply() throws {
    //    let result = (1.0, 1.0) * (2.0, 2.0)
    //    let expected = (0.0, 4.0)
    //    XCTAssertEqual(result, expected, "Tuple multiplication failed")
    //}
}



