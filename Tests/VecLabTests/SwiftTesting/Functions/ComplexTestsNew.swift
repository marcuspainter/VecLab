//
//  ComplexTestsNew.swift
//
//
//  Created by Marcus Painter on 25/09/2023.
//

import Testing
import VecLab

struct ComplexTestsNew {

    let accuracy: Real = 1e-6
    
    // TODO:

    // MARK: abs

    @Test func testAbsComplex() throws {
        let complexA: Complex = (3.0, 4.0)
        let result: Real = abs(complexA)
        let expected: Real = 5.0
        #expect(abs(result - expected) < accuracy, "abs failed")
    }

    @Test func testAbsComplexArray() throws {
        let complexArrayA: ComplexArray = ([3.0, 5.0], [4.0, 12.0])
        let result: RealArray = abs(complexArrayA)
        let expected: RealArray = [5.0, 13.0]
        #expect(abs(result[0] - expected[0]) < accuracy && abs(result[1] - expected[1]) < accuracy, "abs failed")
    }

    // MARK: angle

    @Test func testAngleComplex() throws {
        let complexA: Complex = (3.0, 4.0)
        let result: Real = angle(complexA)
        let expected: Real = 0.927295218001612
        #expect(abs(result - expected) < accuracy, "angle failed")
    }

    @Test func testAngleComplexArray() throws {
        let complexArrayA: ComplexArray = ([3.0, 5.0], [4.0, 12.0])
        let result: RealArray = angle(complexArrayA)
        let expected: RealArray = [0.927295218001612, 1.176005207095135]
        #expect(abs(result[0] - expected[0]) < accuracy && abs(result[1] - expected[1]) < accuracy, "angle failed")
    }

    // MARK: conj

    @Test func testConjComplex() throws {
        let complexA: Complex = (3.0, 4.0)
        let result: Complex = conj(complexA)
        let expected: Complex = (3.0, -4.0)
        #expect(abs(result.0 - expected.0) < accuracy && abs(result.1 - expected.1) < accuracy, "conj failed")
    }

    @Test func testConjComplexArray() throws {
        let complexArrayA: ComplexArray = ([3.0, 5.0], [4.0, 12.0])
        let result: ComplexArray = conj(complexArrayA)
        let expected: ComplexArray = ([3.0, 5.0], [-4.0, -12.0])
        #expect(abs(result.0[0] - expected.0[0]) < accuracy && abs(result.0[1] - expected.0[1]) < accuracy && abs(result.1[0] - expected.1[0]) < accuracy && abs(result.1[1] - expected.1[1]) < accuracy, "conj failed")
    }

    // MARK: cplxpair

    // TODO:

    // MARK: imag

    @Test func testImagComplex() throws {
        let complexA: Complex = (3.0, 4.0)
        let result: Real = imag(complexA)
        let expected: Real = 4.0
        #expect(abs(result - expected) < accuracy, "imag failed")
    }

    @Test func testImagComplexArray() throws {
        let complexArrayA: ComplexArray = ([3.0, 5.0], [4.0, 12.0])
        let result: RealArray = imag(complexArrayA)
        let expected: RealArray = [4.0, 12.0]
        #expect(abs(result[0] - expected[0]) < accuracy && abs(result[1] - expected[1]) < accuracy, "imag failed")
    }

    // MARK: real

    @Test func testRealComplex() throws {
        let complexA: Complex = (3.0, 4.0)
        let result: Real = real(complexA)
        let expected: Real = 3.0
        #expect(abs(result - expected) < accuracy, "real failed")
    }

    @Test func testRealComplexArray() throws {
        let complexArrayA: ComplexArray = ([3.0, 5.0], [4.0, 12.0])
        let result: RealArray = real(complexArrayA)
        let expected: RealArray = [3.0, 5.0]
        #expect(abs(result[0] - expected[0]) < accuracy && abs(result[1] - expected[1]) < accuracy, "real failed")
    }

    // MARK: wrap

    @Test func testWrapReal0() throws {
        let realA: Real = 0.0
        let result: Real = wrapToPi(realA)
        let expected: Real = 0.0
        #expect(abs(result - expected) < accuracy, "wrapToPi failed")
    }

    @Test func testWrapRealPi() throws {
        let realA: Real = Real.pi
        let result: Real = wrapToPi(realA)
        let expected: Real = Real.pi
        #expect(abs(result - expected) < accuracy, "wrapToPi failed")
    }

    @Test func testWrapRealMinusPi() throws {
        let realA: Real = -Real.pi
        let result: Real = wrapToPi(realA)
        let expected: Real = -Real.pi
        #expect(abs(result - expected) < accuracy, "wrapToPi failed")
    }

    @Test func testWrapReal2Pi() throws {
        let realA: Real = 2 * Real.pi
        let result: Real = wrapToPi(realA)
        let expected: Real = 0.0
        #expect(abs(result - expected) < accuracy, "wrapToPi failed")
    }

    @Test func testWrapReal3Pi() throws {
        let realA: Real = 3 * Real.pi
        let result: Real = wrapToPi(realA)
        let expected: Real = Real.pi
        #expect(abs(result - expected) < accuracy, "wrapToPi failed")
    }

    // MARK: unwrap

    @Test func testUnwrapArray() throws {
        let realArrayA: RealArray = [3 * Real.pi, -3 * Real.pi]
        let result: RealArray = unwrap(realArrayA)
        let expected: RealArray = [3 * Real.pi, 3 * Real.pi]
        #expect(abs(result[0] - expected[0]) < accuracy && abs(result[1] - expected[1]) < accuracy, "unwrap failed")
    }

}
