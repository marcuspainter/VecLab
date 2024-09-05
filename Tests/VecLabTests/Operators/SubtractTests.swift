import VecLab
import XCTest

class SubtractTests: XCTestCase {

    func testSubtractReal() {
        let a: RealDoubleArray = [1.0, 2.0, 3.0]
        let b: RealDoubleArray = [3.0, 2.0, 1.0]
        let result = a - b
        XCTAssertEqual(result, [-2.0, 0.0, 2.0], "Real subtraction failed")
    }

    func testSubtractRealRealArray() {
        let a: RealDouble = 2.0
        let b: RealDoubleArray = [1.0, 2.0, 3.0]
        let result = a - b
        XCTAssertEqual(result, [1.0, 0.0, -1.0], "Real and real array subtraction failed")
    }

    func testSubtractComplex() {
        let a: ComplexDouble = (1.0, 2.0)
        let b: ComplexDouble = (2.0, 3.0)
        let result = a - b
        XCTAssertEqual(result, (-1.0, -1.0), "Complex subtraction failed")
    }

    func testSubtractComplexReal() {
        let a: ComplexDouble = (1.0, 2.0)
        let b: RealDouble = 3.0
        let result = a - b
        XCTAssertEqual(result, (-2.0, 2.0), "Complex and real subtraction failed")
    }

    func testSubtractRealComplex() {
        let a: RealDouble = 3.0
        let b: ComplexDouble = (1.0, 2.0)
        let result = a - b
        XCTAssertEqual(result, (2.0, -2.0), "Real and complex subtraction failed")
    }

    func testSubtractComplexArray() {
        let a: ComplexDoubleArray = ([1.0, 2.0], [2.0, 3.0])
        let b: ComplexDoubleArray = ([2.0, 3.0], [3.0, 4.0])
        let result = a - b
        XCTAssertEqual(result, ([-1.0, -1.0], [-1.0, -1.0]), "Complex array subtraction failed")
    }

    func testSubtractComplexComplexArray() {
        let a: ComplexDouble = (1.0, 2.0)
        let b: ComplexDoubleArray = ([2.0, 3.0], [3.0, 4.0])
        let result = a - b
        XCTAssertEqual(result, ([1.0, 2.0], [1.0, 2.0]), "Complex and complex array subtraction failed")
    }

    func testSubtractRealArrayComplexArray() {
        let a: RealDoubleArray = [1.0, 2.0]
        let b: ComplexDoubleArray = ([2.0, 3.0], [3.0, 4.0])
        let result = a - b
        XCTAssertEqual(result, ([1.0, 1.0], [3.0, 4.0]), "Real array and complex array subtraction failed")
    }

    func testSubtractRealArrayComplex() {
        let a: RealDoubleArray = [1.0, 2.0]
        let b: ComplexDouble = (2.0, 3.0)
        let result = a - b
        XCTAssertEqual(result, ([-1.0, 0.0], [-3.0, -3.0]), "Real array and complex subtraction failed")
    }

    func testSubtractComplexArrayReal() {
        let a: ComplexDoubleArray = ([1.0, 2.0], [2.0, 3.0])
        let b: RealDouble = 2.0
        let result = a - b
        XCTAssertEqual(result, ([-1.0, 0.0], [2.0, 3.0]), "Complex array and real subtraction failed")
    }

    func testSubtractRealComplexArray() {
        let a: RealDouble = 2.0
        let b: ComplexDoubleArray = ([1.0, 2.0], [2.0, 3.0])
        let result = a - b
        XCTAssertEqual(result, ([1.0, 0.0], [2.0, 3.0]), "Real and complex array subtraction failed")
    }

    func testSubtractComplexRealArray() {
        let a: ComplexDouble = (1.0, 2.0)
        let b: RealDoubleArray = [1.0, 2.0]
        let result = a - b
        XCTAssertEqual(result, ([0.0, -1.0], [2.0, 2.0]), "Complex and real array subtraction failed")
    }
}

// Reuse the assert helper functions you provided in the AddTests
