import XCTest

@testable import VecLab  // Replace with your actual module name

class PolyvalTests: XCTestCase {

    let tolerance: Real = 1e-10

    // MARK: - Real Coefficients, Real Inputs

    func testRealPolyRealPoint() {
        // Test p(x) = 2x² + 3x + 1 at x = 2
        // Expected: 2(4) + 3(2) + 1 = 15
        let coeffs: RealArray = [2, 3, 1]  // [x², x¹, x⁰]
        let result = polyval(coefficients: coeffs, point: 2.0)
        XCTAssertEqual(result, 15.0, accuracy: tolerance)
    }

    func testRealPolyRealPoints() {
        // Test p(x) = x² - 1 at x = [0, 1, 2, 3]
        // Expected: [-1, 0, 3, 8]
        let coeffs: RealArray = [1, 0, -1]  // x² - 1
        let points: RealArray = [0, 1, 2, 3]
        let results = polyval(coefficients: coeffs, points: points)
        let expected: RealArray = [-1, 0, 3, 8]

        XCTAssertEqual(results.count, expected.count)
        for i in 0..<results.count {
            XCTAssertEqual(results[i], expected[i], accuracy: tolerance)
        }
    }

    func testLinearPolynomial() {
        // Test p(x) = 2x + 3 at x = 5
        // Expected: 2(5) + 3 = 13
        let coeffs: RealArray = [2, 3]  // [x¹, x⁰]
        let result = polyval(coefficients: coeffs, point: 5.0)
        XCTAssertEqual(result, 13.0, accuracy: tolerance)
    }

    func testConstantPolynomial() {
        // Test p(x) = 7 at x = 100
        // Expected: 7
        let coeffs: RealArray = [7]  // constant
        let result = polyval(coefficients: coeffs, point: 100.0)
        XCTAssertEqual(result, 7.0, accuracy: tolerance)
    }

    // MARK: - Real Coefficients, Complex Inputs

    func testRealPolyComplexPoint() {
        // Test p(x) = x² + 1 at x = i
        // Expected: i² + 1 = -1 + 1 = 0
        let coeffs: RealArray = [1, 0, 1]  // x² + 1
        let point = Complex(0, 1)  // i
        let result = polyval(coefficients: coeffs, point: point)

        XCTAssertEqual(result.real, 0.0, accuracy: tolerance)
        XCTAssertEqual(result.imag, 0.0, accuracy: tolerance)
    }

    func testRealPolyComplexPoints() {
        // Test p(x) = x² + 1 at x = [i, -i, 1+i]
        let coeffs: RealArray = [1, 0, 1]  // x² + 1
        let points: ComplexArray = [
            Complex(0, 1),  // i -> 0
            Complex(0, -1),  // -i -> 0
            Complex(1, 1),  // 1+i -> (1+i)² + 1 = 1 + 2i - 1 + 1 = 1 + 2i
        ]
        let results = polyval(coefficients: coeffs, points: points)

        // Check i result
        XCTAssertEqual(results[0].real, 0.0, accuracy: tolerance)
        XCTAssertEqual(results[0].imag, 0.0, accuracy: tolerance)

        // Check -i result
        XCTAssertEqual(results[1].real, 0.0, accuracy: tolerance)
        XCTAssertEqual(results[1].imag, 0.0, accuracy: tolerance)

        // Check 1+i result
        XCTAssertEqual(results[2].real, 1.0, accuracy: tolerance)
        XCTAssertEqual(results[2].imag, 2.0, accuracy: tolerance)
    }

    // MARK: - Complex Coefficients, Real Inputs

    func testComplexPolyRealPoint() {
        // Test p(x) = (1+i)x + (2-i) at x = 1
        // Expected: (1+i)(1) + (2-i) = 1+i + 2-i = 3
        let coeffs: ComplexArray = [
            Complex(1, 1),  // 1+i (coefficient of x)
            Complex(2, -1),  // 2-i (constant term)
        ]
        let result = polyval(coefficients: coeffs, point: 1.0)

        XCTAssertEqual(result.real, 3.0, accuracy: tolerance)
        XCTAssertEqual(result.imag, 0.0, accuracy: tolerance)
    }

    func testComplexPolyRealPoints() {
        // Test p(x) = ix + 1 at x = [0, 1, 2]
        // Expected: [1, 1+i, 1+2i]
        let coeffs: ComplexArray = [
            Complex(0, 1),  // i (coefficient of x)
            Complex(1, 0),  // 1 (constant term)
        ]
        let points: RealArray = [0, 1, 2]
        let results = polyval(coefficients: coeffs, points: points)

        // x = 0: result = 1
        XCTAssertEqual(results[0].real, 1.0, accuracy: tolerance)
        XCTAssertEqual(results[0].imag, 0.0, accuracy: tolerance)

        // x = 1: result = i + 1 = 1 + i
        XCTAssertEqual(results[1].real, 1.0, accuracy: tolerance)
        XCTAssertEqual(results[1].imag, 1.0, accuracy: tolerance)

        // x = 2: result = 2i + 1 = 1 + 2i
        XCTAssertEqual(results[2].real, 1.0, accuracy: tolerance)
        XCTAssertEqual(results[2].imag, 2.0, accuracy: tolerance)
    }

    // MARK: - Complex Coefficients, Complex Inputs

    func testComplexPolyComplexPoint() {
        // Test p(x) = ix + (1+i) at x = 1-i
        // Expected: i(1-i) + (1+i) = i - i² + 1 + i = i + 1 + 1 + i = 2 + 2i
        let coeffs: ComplexArray = [
            Complex(0, 1),  // i (coefficient of x)
            Complex(1, 1),  // 1+i (constant term)
        ]
        let point = Complex(1, -1)  // 1-i
        let result = polyval(coefficients: coeffs, point: point)

        XCTAssertEqual(result.real, 2.0, accuracy: tolerance)
        XCTAssertEqual(result.imag, 2.0, accuracy: tolerance)
    }

    // MARK: - Edge Cases

    func testEmptyCoefficients() {
        // Test with empty coefficient array - should handle gracefully
        let coeffs: RealArray = []
        let result = polyval(coefficients: coeffs, point: 1.0)
        // Behavior depends on your implementation - might return 0, NaN, or crash
        // Update this test based on your expected behavior
        XCTAssert(result.isNaN)
    }

    func testSingleCoefficientZero() {
        // Test p(x) = 0
        let coeffs: RealArray = [0]
        let result = polyval(coefficients: coeffs, point: 5.0)
        XCTAssertEqual(result, 0.0, accuracy: tolerance)
    }

    func testHighDegreePolynomial() {
        // Test p(x) = x⁴ - 2x³ + x² - 2x + 1 at x = 2
        // Expected: 16 - 16 + 4 - 4 + 1 = 1
        let coeffs: RealArray = [1, -2, 1, -2, 1]  // [x⁴, x³, x², x¹, x⁰]
        let result = polyval(coefficients: coeffs, point: 2.0)
        XCTAssertEqual(result, 1.0, accuracy: tolerance)
    }

    // MARK: - MATLAB Compatibility Tests

    func testMatlabCompatibility() {
        // Verify MATLAB compatibility with known results
        // MATLAB: polyval([1, 2, 3], 2) = 11 (for x² + 2x + 3)
        let coeffs: RealArray = [1, 2, 3]
        let result = polyval(coefficients: coeffs, point: 2.0)
        XCTAssertEqual(result, 11.0, accuracy: tolerance, "Should match MATLAB polyval([1,2,3], 2)")

        // MATLAB: polyval([1, 0, -4], [1, 2]) = [-3, 0] (for x² - 4)
        let coeffs2: RealArray = [1, 0, -4]
        let points: RealArray = [1, 2]
        let results = polyval(coefficients: coeffs2, points: points)
        XCTAssertEqual(results[0], -3.0, accuracy: tolerance)
        XCTAssertEqual(results[1], 0.0, accuracy: tolerance)
    }

    // MARK: - Performance Tests

    func testPerformanceRealArray() {
        let coeffs: RealArray = vector(1...100)  // Large polynomial
        let points: RealArray = vector(1...1000)  // Many evaluation points

        measure {
            _ = polyval(coefficients: coeffs, points: points)
        }
    }

    func testPerformanceComplexArray() {
        let n = vector(1...50)
        let m = vector(1...500)
        let coeffs: ComplexArray = ComplexArray(n, n)
        let points: ComplexArray = ComplexArray(m, m)

        measure {
            _ = polyval(coefficients: coeffs, points: points)
        }
    }

}

// MARK: - Helper Extensions for Testing
