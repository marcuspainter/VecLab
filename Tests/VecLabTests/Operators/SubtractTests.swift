import VecLab
import XCTest

class SubtractTests: XCTestCase {

    func testSubtractReal() {
        let a: RealArray = [1.0, 2.0, 3.0]
        let b: RealArray = [3.0, 2.0, 1.0]
        let result = a - b
        XCTAssertEqual(result, [-2.0, 0.0, 2.0], "Real subtraction failed")
    }

    func testSubtractRealRealArray() {
        let a: Real = 2.0
        let b: RealArray = [1.0, 2.0, 3.0]
        let result = a - b
        XCTAssertEqual(result, [1.0, 0.0, -1.0], "Real and real array subtraction failed")
    }

    func testSubtractComplex() {
        let a: Complex = Complex(1.0, 2.0)
        let b: Complex = Complex(2.0, 3.0)
        let result = a - b
        XCTAssertEqual(result, Complex(-1.0, -1.0), "Complex subtraction failed")
    }

    func testSubtractComplexReal() {
        let a: Complex = Complex(1.0, 2.0)
        let b: Real = 3.0
        let result = a - b
        XCTAssertEqual(result, Complex(-2.0, 2.0), "Complex and real subtraction failed")
    }

    func testSubtractRealComplex() {
        let a: Real = 3.0
        let b: Complex = Complex(1.0, 2.0)
        let result = a - b
        XCTAssertEqual(result, Complex(2.0, -2.0), "Real and complex subtraction failed")
    }

    func testSubtractComplexArray() {
        let a: ComplexArray = ComplexArray([1.0, 2.0], [2.0, 3.0])
        let b: ComplexArray = ComplexArray([2.0, 3.0], [3.0, 4.0])
        let result = a - b
        XCTAssertEqual(result, ComplexArray([-1.0, -1.0], [-1.0, -1.0]), "Complex array subtraction failed")
    }

    func testSubtractComplexComplexArray() {
        let a: Complex = Complex(1.0, 2.0)
        let b: ComplexArray = ComplexArray([2.0, 3.0], [3.0, 4.0])
        let result = a - b
        XCTAssertEqual(result, ComplexArray([1.0, 2.0], [1.0, 2.0]), "Complex and complex array subtraction failed")
    }

    func testSubtractRealArrayComplexArray() {
        let a: RealArray = [1.0, 2.0]
        let b: ComplexArray = ComplexArray([2.0, 3.0], [3.0, 4.0])
        let result = a - b
        XCTAssertEqual(
            result,
            ComplexArray([1.0, 1.0], [3.0, 4.0]),
            "Real array and complex array subtraction failed"
        )
    }

    func testSubtractRealArrayComplex() {
        let a: RealArray = [1.0, 2.0]
        let b: Complex = Complex(2.0, 3.0)
        let result = a - b
        XCTAssertEqual(result, ComplexArray([-1.0, 0.0], [-3.0, -3.0]), "Real array and complex subtraction failed")
    }

    func testSubtractComplexArrayReal() {
        let a: ComplexArray = ComplexArray([1.0, 2.0], [2.0, 3.0])
        let b: Real = 2.0
        let result = a - b
        XCTAssertEqual(result, ComplexArray([-1.0, 0.0], [2.0, 3.0]), "Complex array and real subtraction failed")
    }

    func testSubtractRealComplexArray() {
        let a: Real = 2.0
        let b: ComplexArray = ComplexArray([1.0, 2.0], [2.0, 3.0])
        let result = a - b
        XCTAssertEqual(result, ComplexArray([1.0, 0.0], [-2.0, -3.0]), "Real and complex array subtraction failed")
    }

    func testSubtractComplexRealArray() {
        let a: Complex = Complex(1.0, 2.0)
        let b: RealArray = [1.0, 2.0]
        let result = a - b
        XCTAssertEqual(result, ComplexArray([0.0, -1.0], [2.0, 2.0]), "Complex and real array subtraction failed")
    }
}

// Reuse the assert helper functions you provided in the AddTests
