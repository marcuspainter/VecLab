//
//  AddTests.swift
//
//
//  Created by Marcus Painter on 25/09/2023.
//

import VecLab
import XCTest

class AddTests: XCTestCase {
    // Test real number addition
    func testAddReal() {
        let a: RealDoubleArray = [1.0, 2.0, 3.0]
        let b: RealDoubleArray = [3.0, 2.0, 1.0]
        let result = a + b
        XCTAssertEqual(result, [4.0, 4.0, 4.0], "Real addition failed")
    }

    // Test real and real array addition
    func testAddRealRealArray() {
        let a: RealDouble = 2.0
        let b: RealDoubleArray = [1.0, 2.0, 3.0]
        let result = a + b
        XCTAssertEqual(result, [3.0, 4.0, 5.0], "Real and real array addition failed")
    }
    
    // Test real array and real addition
    func testAddRealArrayReal() {
        let a: RealDoubleArray = [1.0, 2.0, 3.0]
        let b: RealDouble = 2.0
        let result = a + b
        XCTAssertEqual(result, [3.0, 4.0, 5.0], "Real array and real addition failed")
    }

    // Test complex and complex addition
    func testAddComplex() {
        let a: ComplexDouble = (1.0, 2.0)
        let b: ComplexDouble = (2.0, 3.0)
        let result = a + b
        XCTAssertEqual(result, (3.0, 5.0), "Complex addition failed")
    }

    // Text complex real addition
    func testAddComplexReal() {
        let a: ComplexDouble = (1.0, 2.0)
        let b: RealDouble = 3.0
        let result = a + b
        XCTAssertEqual(result, (4.0, 2.0), "Complex and real addition failed")
    }

    // Text complex real addition
    func testAddRealComplex() {
        let a: RealDouble = 3.0
        let b: ComplexDouble = (1.0, 2.0)
        let result = a + b
        XCTAssertEqual(result, (4.0, 2.0), "Complex and real addition failed")
    }

    // Test complex array addition
    func testAddComplexArray() {
        let a: ComplexDoubleArray = ([1.0, 2.0], [2.0, 3.0])
        let b: ComplexDoubleArray = ([2.0, 3.0], [3.0, 4.0])
        let result = a + b
        XCTAssertEqual(result, ([3.0, 5.0], [5.0, 7.0]), "Complex array addition failed")
    }

    // Test complex and complex array addition
    func testAddComplexComplexArray() {
        let a: ComplexDouble = (1.0, 2.0)
        let b: ComplexDoubleArray = ([2.0, 3.0], [3.0, 4.0])
        let result = a + b
        XCTAssertEqual(result, ([3.0, 4.0], [5.0, 6.0]), "Complex and complex array addition failed")
    }

    // Test complex array and complex addition
    func testAddComplexArrayComplex() {
        let a: ComplexDoubleArray = ([2.0, 3.0], [3.0, 4.0])
        let b: ComplexDouble = (1.0, 2.0)
        let result = a + b
        XCTAssertEqual(result, ([3.0, 4.0], [5.0, 6.0]), "Complex and complex array addition failed")
    }

    // Test real array and complex array addition
    func testAddRealArrayComplexArray() {
        let a: RealDoubleArray = [1.0, 2.0]
        let b: ComplexDoubleArray = ([2.0, 3.0], [3.0, 4.0])
        let result = a + b
        XCTAssertEqual(result, ([3.0, 5.0], [3.0, 4.0]), "Real array and complex array addition failed")
    }

    // Test real array and complex number addition
    func testAddRealArrayComplex() {
        let a: RealDoubleArray = [1.0, 2.0]
        let b: ComplexDouble = (2.0, 3.0)
        let result = a + b
        XCTAssertEqual(result, ([3.0, 4.0], [3.0, 3.0]), "Real array and complex number addition failed")
    }

    // Test complex array and real number addition
    func testAddComplexArrayReal() {
        let a: ComplexDoubleArray = ([1.0, 2.0], [2.0, 3.0])
        let b: RealDouble = 2.0
        let result = a + b
        XCTAssertEqual(result, ([3.0, 4.0], [2.0, 3.0]), "Complex array and real number addition failed")
    }

    // Test complex array and real number addition
    func testAddRealComplexArray() {
        let a: RealDouble = 2.0
        let b: ComplexDoubleArray = ([1.0, 2.0], [2.0, 3.0])
        let result = a + b
        XCTAssertEqual(result, ([3.0, 4.0], [2.0, 3.0]), "Complex array and real number addition failed")
    }

    // Test complex array and real array addition
    func testAddComplexArrayRealArray() {
        let a: ComplexDoubleArray = ([1.0, 2.0], [2.0, 3.0])
        let b: RealDoubleArray = [2.0, 3.0]
        let result = a + b
        XCTAssertEqual(result, ([3.0, 5.0], [2.0, 3.0]), "Complex array and real array addition failed")
    }

    // Test complex number and real array addition
    func testAddComplexRealArray() {
        let a: ComplexDouble = (1.0, 2.0)
        let b: RealDoubleArray = [1.0, 2.0]
        let result = a + b
        XCTAssertEqual(result, ([2.0, 3.0], [2.0, 2.0]), "Complex number and real array addition failed")
    }

    /*
        // Test that assertSameSize throws assertion error when arrays have different sizes
        func testAddAssertSameSize() {
            let a: RealDoubleArray = [1.0, 2.0, 3.0]
            let b: RealDoubleArray = [1.0, 2.0]

            XCTAssertThrowsError(try assertSameSize(a, b), "assertSameSize did not throw an error for different size arrays")
        }
     */
}
