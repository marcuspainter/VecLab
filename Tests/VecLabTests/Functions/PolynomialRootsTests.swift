//
//  PolynomialRootsTests.swift
//  VecLab
//
//  Created by Marcus Painter on 05/09/2025.
//

import VecLab
import XCTest

class PolynomialRootsTests: XCTestCase {

    // Helper function to check if two complex numbers are approximately equal
    func assertComplexEqual(
        _ a: Complex,
        _ b: Complex,
        accuracy: Real = 1e-10,
        file: StaticString = #file,
        line: UInt = #line
    ) {
        XCTAssertEqual(a.real, b.real, accuracy: accuracy, file: file, line: line)
        XCTAssertEqual(a.imag, b.imag, accuracy: accuracy, file: file, line: line)
    }

    // Helper function to check if roots array contains expected values (order may vary)
    func assertRootsContain(
        _ roots: ComplexArray,
        _ expected: [Complex],
        accuracy: Real = 1e-10,
        file: StaticString = #file,
        line: UInt = #line
    ) {
        XCTAssertEqual(roots.count, expected.count, "Wrong number of roots", file: file, line: line)

        for expectedRoot in expected {
            let found = roots.contains { root in
                abs(root.real - expectedRoot.real) < accuracy && abs(root.imag - expectedRoot.imag) < accuracy
            }
            XCTAssertTrue(found, "Root \(expectedRoot) not found in results", file: file, line: line)
        }
    }

    // Test 1: Edge cases
    func testEdgeCases() {
        // Empty array
        let empty = roots(coefficients: RealArray())
        XCTAssertEqual(empty.count, 0)

        // Single coefficient (constant)
        let constant = roots(coefficients: RealArray([5.0]))
        XCTAssertEqual(constant.count, 0)

        // All zeros
        let allZeros = roots(coefficients: RealArray([0.0, 0.0, 0.0]))
        XCTAssertEqual(allZeros.count, 0)
    }

    // Test 2: Linear polynomials
    func testLinearPolynomials() {
        // x - 3 = 0 → root at x = 3
        let linear1 = roots(coefficients: RealArray([1.0, -3.0]))
        XCTAssertEqual(linear1.count, 1)
        assertComplexEqual(linear1[0], Complex(3.0, 0.0))

        // 2x + 4 = 0 → root at x = -2
        let linear2 = roots(coefficients: RealArray([2.0, 4.0]))
        XCTAssertEqual(linear2.count, 1)
        assertComplexEqual(linear2[0], Complex(-2.0, 0.0))
    }

    // Test 3: Quadratic polynomials
    func testQuadraticPolynomials() {
        // x² - 5x + 6 = 0 → roots at x = 2, 3
        let quad1 = roots(coefficients: RealArray([1.0, -5.0, 6.0]))
        let expected1 = [Complex(2.0, 0.0), Complex(3.0, 0.0)]
        assertRootsContain(quad1, expected1)

        // x² + 1 = 0 → roots at x = ±i
        let quad2 = roots(coefficients: RealArray([1.0, 0.0, 1.0]))
        let expected2 = [Complex(0.0, 1.0), Complex(0.0, -1.0)]
        assertRootsContain(quad2, expected2)

        // x² - 4 = 0 → roots at x = ±2
        let quad3 = roots(coefficients: RealArray([1.0, 0.0, -4.0]))
        let expected3 = [Complex(2.0, 0.0), Complex(-2.0, 0.0)]
        assertRootsContain(quad3, expected3)
    }

    // Test 4: Cubic polynomials
    func testCubicPolynomials() {
        // x³ - 6x² + 11x - 6 = 0 → roots at x = 1, 2, 3
        let cubic1 = roots(coefficients: RealArray([1.0, -6.0, 11.0, -6.0]))
        let expected1 = [Complex(1.0, 0.0), Complex(2.0, 0.0), Complex(3.0, 0.0)]
        assertRootsContain(cubic1, expected1)

        // x³ - 1 = 0 → roots at x = 1, -1/2 ± i√3/2
        let cubic2 = roots(coefficients: RealArray([1.0, 0.0, 0.0, -1.0]))
        let expected2 = [
            Complex(1.0, 0.0),
            Complex(-0.5, sqrt(3.0) / 2.0),
            Complex(-0.5, -sqrt(3.0) / 2.0),
        ]
        assertRootsContain(cubic2, expected2)
    }

    // Test 5: Leading zeros (roots at origin)
    func testLeadingZeros() {
        // 0x³ + 0x² + x - 2 = 0 → equivalent to x - 2 = 0
        // Should have 2 roots at origin plus root at x = 2
        let leadingZeros1 = roots(coefficients: RealArray([0.0, 0.0, 1.0, -2.0]))
        let expected1 = [Complex(0.0, 0.0), Complex(0.0, 0.0), Complex(2.0, 0.0)]
        assertRootsContain(leadingZeros1, expected1)

        // 0x² + x² - 4 = 0 → equivalent to x² - 4 = 0
        // Should have 1 root at origin plus roots at ±2
        let leadingZeros2 = roots(coefficients: RealArray([0.0, 1.0, 0.0, -4.0]))
        let expected2 = [Complex(0.0, 0.0), Complex(2.0, 0.0), Complex(-2.0, 0.0)]
        assertRootsContain(leadingZeros2, expected2)
    }

    // Test 6: High degree polynomial with known roots
    func testHighDegreePolynomial() {
        // (x-1)(x-2)(x-3)(x-4) = x⁴ - 10x³ + 35x² - 50x + 24
        let quartic = roots(coefficients: RealArray([1.0, -10.0, 35.0, -50.0, 24.0]))
        let expected = [
            Complex(1.0, 0.0),
            Complex(2.0, 0.0),
            Complex(3.0, 0.0),
            Complex(4.0, 0.0),
        ]
        assertRootsContain(quartic, expected)
    }

    // Test 7: Polynomial with complex conjugate roots
    func testComplexConjugateRoots() {
        // (x² + 1)(x - 1) = x³ - x² + x - 1
        // Roots: 1, ±i
        let poly = roots(coefficients: RealArray([1.0, -1.0, 1.0, -1.0]))
        let expected = [
            Complex(1.0, 0.0),
            Complex(0.0, 1.0),
            Complex(0.0, -1.0),
        ]
        assertRootsContain(poly, expected)
    }

    // Test 8: Verify roots by substitution
    func testRootVerification() {
        let coeffs = RealArray([1.0, -3.0, 2.0])  // x² - 3x + 2 = 0
        let computedRoots = roots(coefficients: coeffs)

        // Verify each root by substitution
        for root in computedRoots {
            let x = root
            let result = coeffs[0] * x * x + coeffs[1] * x + coeffs[2]
            XCTAssertLessThan(abs(result), 1e-10, "Root verification failed for \(root)")
        }
    }
    
    func testPoly() {
        let r = roots(coefficients: [1,2,3])
        let p = poly(roots: r)
        
        print(p)
        
        var z = ComplexArray([1,3,2,3],[1,1,1,2])
        
        z = z.sorted { $0.real != $1.real ? $0.real < $1.real : $0.imag < $1.imag }
        print(z)
    }
    
    func testPoly2() {

        // 1) real roots
        let r1 = ComplexArray([Complex(1,0), Complex(2,0), Complex(3,0)])
        let exp1 = ComplexArray([Complex(1,0), Complex(-6,0), Complex(11,0), Complex(-6,0)])
        let got1 = poly(roots: r1)
        XCTAssertEqual(got1, exp1, accuracy: 1e-6)

        // 2) conjugate pair -> real coefficients
        let r2 = ComplexArray([Complex(1,1), Complex(1,-1)])
        let exp2 = ComplexArray([Complex(1,0), Complex(-2,0), Complex(2,0)])
        let got2 = poly(roots: r2)
        XCTAssertEqual(got2, exp2, accuracy: 1e-6)

        // 3) non-conjugate complex roots (the failing case)
        let r3 = ComplexArray([Complex(1,1), Complex(2,1)])
        let exp3 = ComplexArray([Complex(1,0), Complex(-3,-2), Complex(1,3)]) // expected complex coeffs
        let got3 = poly(roots: r3)
        XCTAssertEqual(got3, exp3, accuracy: 1e-6)
        print(got3)

        // 4) single root
        let r4 = ComplexArray([Complex(5,0)])
        let exp4 = ComplexArray([Complex(1,0), Complex(-5,0)])
        let got4 = poly(roots: r4)
        XCTAssertEqual(got4, exp4, accuracy: 1e-6)

        print("Tests passed")
    }
    
    func testPoly3() {
      
        func approxEqual(_ a: Complex, _ b: Complex, _ tol: Double = 1e-12) -> Bool {
            return abs(a.real - b.real) < tol && abs(a.imag - b.imag) < tol
        }

        // 0) Sanity check: primitive complex multiplication
        let a = Complex(1, 1)
        let b = Complex(2, 1)
        let ab = a * b
        print("a * b = \(ab)") // Expected: 1.0 + 3.0i
        assert(approxEqual(ab, Complex(1, 3)), "Complex multiplication is wrong!")

        // 1) poly() vs direct product
        let roots = ComplexArray([Complex(1,1), Complex(2,1)])
        let c = poly(roots: roots)                 // your function under test
        let prod = roots.reduce(Complex(1,0)) { $0 * $1 }  // multiply the roots

        print("poly result: \(c)")
        print("direct product: \(prod)")

        // Expectations:
        assert(approxEqual(prod, Complex(1, 3)))
        assert(approxEqual(c.last!, prod), "poly() constant term should equal product of roots")
        assert(approxEqual(c[1], Complex(-(roots[0].real + roots[1].real), -(roots[0].imag + roots[1].imag))))
    }
        
}

// Performance test (optional)
extension PolynomialRootsTests {
    func testPerformance() {
        // Test with a higher degree polynomial
        let coeffs = RealArray((0...20).map { _ in Real.random(in: -10...10) })

        measure {
            _ = roots(coefficients: coeffs)
        }
    }
}
