//
//  ArrayTests.swift
//
//
//  Created by Marcus Painter on 25/09/2023.
//

import Foundation
import VecLab
import XCTest

class ArrayTests: XCTestCase {
    // MARK: vector

    func testVectorCount() throws {
        let count = 10
        let result = vector(count: count)
        XCTAssertEqual(result.count, count, "vector failed")
    }

    func testVectorSizedReal() throws {
        let count: Int = 10
        let realArrayA: RealArray = [Real](repeating: 0, count: count)
        let result: RealArray = vector(sized: realArrayA)
        XCTAssertEqual(result.count, count, "vector failed")
    }

    func testVectorSizedComplex() throws {
        let count = 10
        let r = RealArray(repeating: 0, count: count)
        let i = RealArray(repeating: 0, count: count)
        let complexArrayA: ComplexArray = (r, i)
        let result: RealArray = vector(sized: complexArrayA)
        XCTAssertEqual(result.count, count, "vector failed")
    }

    func testComplexSizedReal() throws {
        let count: Int = 10
        let realArrayA: RealArray = [Real](repeating: 0, count: count)
        let result: ComplexArray = complex(sized: realArrayA)
        XCTAssertEqual(result.0.count, count, "complex failed")
        XCTAssertEqual(result.1.count, count, "complex failed")
    }

    // MARK: cat

    func testCatRealArray() throws {
        let realArrayA: RealArray = [1.0, 2.0, 3.0]
        let realArrayB: RealArray = [4.0, 5.0, 6.0]
        let result: RealArray = cat(realArrayA, realArrayB)
        let expected: RealArray = [1.0, 2.0, 3.0, 4.0, 5.0, 6.0]
        XCTAssertEqual(result, expected, "cat failed")
    }

    func testCatComplexArray() throws {
        let realArrayA: RealArray = [1.0, 2.0]
        let realArrayB: RealArray = [3.0, 4.0]
        let complexArrayC: ComplexArray = (realArrayA, realArrayB)
        let complexArrayD: ComplexArray = (realArrayB, realArrayA)
        let result: ComplexArray = cat(complexArrayC, complexArrayD)
        let expected: ComplexArray = ([1.0, 2.0, 3.0, 4.0], [3.0, 4.0, 1.0, 2.0])
        XCTAssertEqual(result, expected, "cat failed")
    }

    // MARK: circshift

    func testCircshiftRealEmpty() throws {
        let shift: Int = 2
        let realArrayA: RealArray = []
        let result: RealArray = circshift(realArrayA, shift)
        let expected: RealArray = realArrayA
        XCTAssertEqual(result, expected, "circshift failed")
    }

    func testCircshiftComplexEmpty() throws {
        let shift: Int = 2
        let complexArrayA: ComplexArray = ([], [])
        let result: ComplexArray = circshift(complexArrayA, shift)
        let expected: ComplexArray = complexArrayA
        XCTAssertEqual(result, expected, "circshift failed")
    }

    func testCircshiftRealZero() throws {
        let shift: Int = 0
        let realArrayA: RealArray = [1.0, 2.0, 3.0, 4.0, 5.0, 6.0]
        let result: RealArray = circshift(realArrayA, shift)
        let expected: RealArray = realArrayA
        XCTAssertEqual(result, expected, "circshift failed")
    }

    func testCircshiftComplexZero() throws {
        let shift: Int = 0
        let complexArrayA: ComplexArray = ([1.0, 2.0, 3.0, 4.0, 5.0, 6.0], [1.0, 2.0, 3.0, 4.0, 5.0, 6.0])
        let result: ComplexArray = circshift(complexArrayA, shift)
        let expected: ComplexArray = complexArrayA
        XCTAssertEqual(result, expected, "circshift failed")
    }

    func testCircshiftRealArrayLeftEven() throws {
        let shift: Int = 2
        let realArrayA: RealArray = [1.0, 2.0, 3.0, 4.0, 5.0, 6.0]
        let result: RealArray = circshift(realArrayA, shift)
        let expected: RealArray = [5.0, 6.0, 1.0, 2.0, 3.0, 4.0]
        XCTAssertEqual(result, expected, "circshift failed")
    }

    func testCircshiftRealArrayLeftOdd() throws {
        let shift: Int = 2
        let realArrayA: RealArray = [1.0, 2.0, 3.0, 4.0, 5.0]
        let result: RealArray = circshift(realArrayA, shift)
        let expected: RealArray = [4.0, 5.0, 1.0, 2.0, 3.0]
        XCTAssertEqual(result, expected, "circshift failed")
    }

    func testCircshiftComplexArrayLeftEven() throws {
        let shift: Int = 2
        let complexArrayA: ComplexArray = ([1.0, 2.0, 3.0, 4.0, 5.0, 6.0], [1.0, 2.0, 3.0, 4.0, 5.0, 6.0])
        let result: ComplexArray = circshift(complexArrayA, shift)
        let expected: ComplexArray = ([5.0, 6.0, 1.0, 2.0, 3.0, 4.0], [5.0, 6.0, 1.0, 2.0, 3.0, 4.0])
        XCTAssertEqual(result, expected, "circshift failed")
    }

    func testCircshiftComplexArrayLeftOdd() throws {
        let shift: Int = 2
        let complexArrayA: ComplexArray = ([1.0, 2.0, 3.0, 4.0, 5.0], [1.0, 2.0, 3.0, 4.0, 5.0])
        let result: ComplexArray = circshift(complexArrayA, shift)
        let expected: ComplexArray = ([4.0, 5.0, 1.0, 2.0, 3.0], [4.0, 5.0, 1.0, 2.0, 3.0])
        XCTAssertEqual(result, expected, "circshift failed")
    }

    func testCircshiftRealArrayRight() throws {
        let shift: Int = -2
        let realArrayA: RealArray = [1.0, 2.0, 3.0, 4.0]
        let result: RealArray = circshift(realArrayA, shift)
        let expected: RealArray = [3.0, 4.0, 1.0, 2.0]
        XCTAssertEqual(result, expected, "circshift failed")
    }

    func testCircshiftComplexArrayRight() throws {
        let shift: Int = -2
        let complexArrayA: ComplexArray = ([1.0, 2.0, 3.0, 4.0], [1.0, 2.0, 3.0, 4.0])
        let result: ComplexArray = circshift(complexArrayA, shift)
        let expected: ComplexArray = ([3.0, 4.0, 1.0, 2.0], [3.0, 4.0, 1.0, 2.0])
        XCTAssertEqual(result, expected, "circshift failed")
    }

    // MARK: complex

    func testComplex() throws {
        let result: Complex = complex()
        let expected: Complex = (0.0, 0.0)
        XCTAssertEqual(result, expected, "complex failed")
    }

    func testComplexRealImag() throws {
        let result: Complex = complex(1.0, 2.0)
        let expected: Complex = (1.0, 2.0)
        XCTAssertEqual(result, expected, "complex failed")
    }

    func testComplexCount() throws {
        let count: Int = 10
        let result: ComplexArray = complex(count: count)
        let expectedCount: Int = 10
        XCTAssertEqual(result.0.count, expectedCount, "complex failed")
    }

    func testComplexSized() throws {
        let complexArrayA: ComplexArray = ([1.0, 2.0], [3.0, 4.0])
        let result = complex(sized: complexArrayA)
        let expectedCount: Int = 2
        XCTAssertEqual(result.0.count, expectedCount, "complex failed")
    }

    // MARK: flip

    func testFlipRealArray() throws {
        let realArrayA: RealArray = [1.0, 2.0, 3.0, 4.0]
        let result: RealArray = flip(realArrayA)
        let expected: RealArray = [4.0, 3.0, 2.0, 1.0]
        XCTAssertEqual(result, expected, "complex failed")
    }

    func testFlipComplexArray() throws {
        let complexArrayA: ComplexArray = ([1.0, 2.0], [3.0, 4.0])
        let result: ComplexArray = flip(complexArrayA)
        let expected: ComplexArray = ([2.0, 1.0], [4.0, 3.0])
        XCTAssertEqual(result, expected, "complex failed")
    }

    // MARK: length

    func testLengthRealArray() throws {
        let realArrayA: RealArray = [1.0, 2.0, 3.0, 4.0]
        let result: Int = length(realArrayA)
        let expected: Int = 4
        XCTAssertEqual(result, expected, "length failed")
    }

    func testLengthComplexArray() throws {
        let complexArrayA: ComplexArray = ([1.0, 2.0], [3.0, 4.0])
        let result: Int = length(complexArrayA)
        let expected: Int = 2
        XCTAssertEqual(result, expected, "length failed")
    }

    // MARK: paddata

    func testPaddataRealArray() throws {
        let pad: Int = 6
        let realArrayA: RealArray = [1.0, 2.0, 3.0, 4.0]
        let result: RealArray = paddata(realArrayA, pad)
        let expected: RealArray = [1.0, 2.0, 3.0, 4.0, 0.0, 0.0]
        XCTAssertEqual(result, expected, "paddata failed")
    }

    func testPaddataComplexArray() throws {
        let pad: Int = 4
        let complexArrayA: ComplexArray = ([1.0, 2.0], [3.0, 4.0])
        let result: ComplexArray = paddata(complexArrayA, pad)
        let expected: ComplexArray = ([1.0, 2.0, 0.0, 0.0], [3.0, 4.0, 0.0, 0.0])
        XCTAssertEqual(result, expected, "paddata failed")
    }

    // MARK: repelem

    func testRepelemReal3() throws {
        let rep: Int = 3
        let realA: Real = 9.0
        let result: RealArray = repelem(realA, rep)
        let expected: RealArray = [9.0, 9.0, 9.0]
        XCTAssertEqual(result, expected, "repelem failed")
    }

    func testRepelemReal1() throws {
        let rep: Int = 1
        let realA: Real = 9.0
        let result: RealArray = repelem(realA, rep)
        let expected: RealArray = [9.0]
        XCTAssertEqual(result, expected, "repelem failed")
    }

    func testRepelemRealArray3() throws {
        let rep: Int = 3
        let realArrayA: RealArray = [1.0, 2.0]
        let result: RealArray = repelem(realArrayA, rep)
        let expected: RealArray = [1.0, 2.0, 1.0, 2.0, 1.0, 2.0]
        XCTAssertEqual(result, expected, "repelem failed")
    }

    func testRepelemRealArray1() throws {
        let rep: Int = 1
        let realArrayA: RealArray = [1.0, 2.0]
        let result: RealArray = repelem(realArrayA, rep)
        let expected: RealArray = [1.0, 2.0]
        XCTAssertEqual(result, expected, "repelem failed")
    }

    func testRepelemComplex3() throws {
        let rep: Int = 3
        let complexA: Complex = (9.0, 7.0)
        let result: ComplexArray = repelem(complexA, rep)
        let expected: ComplexArray = ([9.0, 9.0, 9.0], [7.0, 7.0, 7.0])
        XCTAssertEqual(result, expected, "repelem failed")
    }

    func testRepelemComplex1() throws {
        let rep: Int = 1
        let complexA: Complex = (9.0, 7.0)
        let result: ComplexArray = repelem(complexA, rep)
        let expected: ComplexArray = ([9.0], [7.0])
        XCTAssertEqual(result, expected, "repelem failed")
    }

    func testRepelemComplexArray3() throws {
        let rep: Int = 3
        let complexArrayA: ComplexArray = ([1.0, 2.0], [3.0, 4.0])
        let result: ComplexArray = repelem(complexArrayA, rep)
        let expected: ComplexArray = ([1.0, 2.0, 1.0, 2.0, 1.0, 2.0], [3.0, 4.0, 3.0, 4.0, 3.0, 4.0])
        XCTAssertEqual(result, expected, "repelem failed")
    }

    func testRepelemComplexArray1() throws {
        let rep: Int = 1
        let complexArrayA: ComplexArray = ([1.0, 2.0], [3.0, 4.0])
        let result: ComplexArray = repelem(complexArrayA, rep)
        let expected: ComplexArray = ([1.0, 2.0], [3.0, 4.0])
        XCTAssertEqual(result, expected, "repelem failed")
    }

    // MARK: resize

    func testResizeRealArray() throws {
        let size: Int = 2
        let realArrayA: RealArray = [1.0, 2.0, 3.0, 4.0]
        let result: RealArray = resize(realArrayA, size)
        let expected: RealArray = [1.0, 2.0]
        XCTAssertEqual(result, expected, "resize failed")
    }

    func testResizeComplexArray() throws {
        let size: Int = 2
        let complexArrayA: ComplexArray = ([1.0, 2.0, 3.0, 4.0], [1.0, 2.0, 3.0, 4.0])
        let result: ComplexArray = resize(complexArrayA, size)
        let expected: ComplexArray = ([1.0, 2.0], [1.0, 2.0])
        XCTAssertEqual(result, expected, "resize failed")
    }

    func testResizeRealArrayIncrease() throws {
        let size: Int = 4
        let realArrayA: RealArray = [1.0, 2.0]
        let result: RealArray = resize(realArrayA, size)
        let expected: RealArray = [1.0, 2.0, 0.0, 0.0]
        XCTAssertEqual(result, expected, "resize failed")
    }

    func testResizeComplexArrayIncrease() throws {
        let size: Int = 4
        let complexArrayA: ComplexArray = ([1.0, 2.0], [1.0, 2.0])
        let result: ComplexArray = resize(complexArrayA, size)
        let expected: ComplexArray = ([1.0, 2.0, 0.0, 0.0], [1.0, 2.0, 0.0, 0.0])
        XCTAssertEqual(result, expected, "resize failed")
    }

    // MARK: slice

    func testSliceRealArrayOpen() throws {
        let realArrayA: RealArray = [1.0, 2.0, 3.0, 4.0]
        let result: RealArray = slice(realArrayA, 0 ... 2)
        let expected: RealArray = [1.0, 2.0, 3.0]
        XCTAssertEqual(result, expected, "slice failed")
    }

    func testSliceRealArrayClosed() throws {
        let realArrayA: RealArray = [1.0, 2.0, 3.0, 4.0]
        let result: RealArray = slice(realArrayA, 0 ..< 2)
        let expected: RealArray = [1.0, 2.0]
        XCTAssertEqual(result, expected, "slice failed")
    }

    func testSliceRealArrayOpenBy() throws {
        let by: Int = 2
        let realArrayA: RealArray = [1.0, 2.0, 3.0, 4.0]
        let result: RealArray = slice(realArrayA, 0 ... 3, by)
        let expected: RealArray = [1.0, 3.0]
        XCTAssertEqual(result, expected, "slice failed")
    }

    func testSliceRealArrayClosedBy() throws {
        let by: Int = 2
        let realArrayA: RealArray = [1.0, 2.0, 3.0, 4.0]
        let result: RealArray = slice(realArrayA, 0 ..< 4, by)
        let expected: RealArray = [1.0, 3.0]
        XCTAssertEqual(result, expected, "slice failed")
    }

    func testSliceComplexArrayOpen() throws {
        let complexArrayA: ComplexArray = ([1.0, 2.0, 3.0, 4.0], [1.0, 2.0, 3.0, 4.0])
        let result: ComplexArray = slice(complexArrayA, 0 ... 2)
        let expected: ComplexArray = ([1.0, 2.0, 3.0], [1.0, 2.0, 3.0])
        XCTAssertEqual(result, expected, "slice failed")
    }

    func testSliceComlexArrayClosed() throws {
        let complexArrayA: ComplexArray = ([1.0, 2.0, 3.0, 4.0], [1.0, 2.0, 3.0, 4.0])
        let result: ComplexArray = slice(complexArrayA, 0 ..< 2)
        let expected: ComplexArray = ([1.0, 2.0], [1.0, 2.0])
        XCTAssertEqual(result, expected, "slice failed")
    }

    func testSliceComplexArrayOpenBy() throws {
        let by: Int = 2
        let complexArrayA: ComplexArray = ([1.0, 2.0, 3.0, 4.0], [1.0, 2.0, 3.0, 4.0])
        let result: ComplexArray = slice(complexArrayA, 0 ... 3, by)
        let expected: ComplexArray = ([1.0, 3.0], [1.0, 3.0])
        XCTAssertEqual(result, expected, "slice failed")
    }

    func testSliceComplexArrayClosedBy() throws {
        let by: Int = 2
        let complexArrayA: ComplexArray = ([1.0, 2.0, 3.0, 4.0], [1.0, 2.0, 3.0, 4.0])
        let result: ComplexArray = slice(complexArrayA, 0 ..< 4, by)
        let expected: ComplexArray = ([1.0, 3.0], [1.0, 3.0])
        XCTAssertEqual(result, expected, "slice failed")
    }

    // MARK: trimdata

    func testTrimdataRealArray() throws {
        let size: Int = 2
        let realArrayA: RealArray = [1.0, 2.0, 3.0, 4.0]
        let result: RealArray = trimdata(realArrayA, size)
        let expected: RealArray = [1.0, 2.0]
        XCTAssertEqual(result, expected, "trimdata failed")
    }

    func testTrimdataRealArrayTooLarge() throws {
        let size: Int = 10
        let realArrayA: RealArray = [1.0, 2.0, 3.0, 4.0]
        let result: RealArray = trimdata(realArrayA, size)
        let expected: RealArray = [1.0, 2.0, 3.0, 4.0]
        XCTAssertEqual(result, expected, "trimdata failed")
    }

    func testTrimdataComplexArray() throws {
        let size: Int = 2
        let complexArrayA: ComplexArray = ([1.0, 2.0, 3.0, 4.0], [1.0, 2.0, 3.0, 4.0])
        let result: ComplexArray = trimdata(complexArrayA, size)
        let expected: ComplexArray = ([1.0, 2.0], [1.0, 2.0])
        XCTAssertEqual(result, expected, "trimdata failed")
    }

    func testTrimdataComplexArrayTooLarge() throws {
        let size: Int = 10
        let complexArrayA: ComplexArray = ([1.0, 2.0, 3.0, 4.0], [1.0, 2.0, 3.0, 4.0])
        let result: ComplexArray = trimdata(complexArrayA, size)
        let expected: ComplexArray = ([1.0, 2.0, 3.0, 4.0], [1.0, 2.0, 3.0, 4.0])
        XCTAssertEqual(result, expected, "trimdata failed")
    }

    func testFlipReal() throws {
        let realArrayA: RealArray = [1.0, 2.0, 3.0, 4.0]
        let result: RealArray = flip(realArrayA)
        let expected: RealArray = [4.0, 3.0, 2.0, 1.0]
        XCTAssertEqual(result, expected, "flip failed")
    }

    func testFlipComplex() throws {
        let complexArrayA: ComplexArray = ([1.0, 2.0, 3.0, 4.0], [1.0, 2.0, 3.0, 4.0])
        let result: ComplexArray = flip(complexArrayA)
        let expected: ComplexArray = ([4.0, 3.0, 2.0, 1.0], [4.0, 3.0, 2.0, 1.0])
        XCTAssertEqual(result, expected, "flip failed")
    }

    func testZeros() throws {
        let n = 4
        let result: RealArray = zeros(n)
        let expected: RealArray = [0.0, 0.0, 0.0, 0.0]
        XCTAssertEqual(result, expected, "zeros failed")
    }

    func testOnes() throws {
        let n = 4
        let result: RealArray = ones(n)
        let expected: RealArray = [1.0, 1.0, 1.0, 1.0]
        XCTAssertEqual(result, expected, "ones failed")
    }

    func testPaddataReal() throws {
        let length = 4
        let realArrayA: RealArray = [1.0, 2.0]
        let result: RealArray = paddata(realArrayA, length)
        let expected: RealArray = [1.0, 2.0, 0.0, 0.0]
        XCTAssertEqual(result, expected, "paddata failed")
    }

    func testPaddataComplex() throws {
        let length = 4
        let complexArrayA: ComplexArray = ([1.0, 2.0], [1.0, 2.0])
        let result: ComplexArray = paddata(complexArrayA, length)
        let expected: ComplexArray = ([1.0, 2.0, 0.0, 0.0], [1.0, 2.0, 0.0, 0.0])
        XCTAssertEqual(result, expected, "paddata failed")
    }

    func testResizeRealBigger() throws {
        let length = 4
        let realArrayA: RealArray = [1.0, 2.0]
        let result: RealArray = resize(realArrayA, length)
        let expected: RealArray = [1.0, 2.0, 0.0, 0.0]
        XCTAssertEqual(result, expected, "resize failed")
    }

    func testResizeComplexBigger() throws {
        let length = 4
        let complexArrayA: ComplexArray = ([1.0, 2.0], [1.0, 2.0])
        let result: ComplexArray = resize(complexArrayA, length)
        let expected: ComplexArray = ([1.0, 2.0, 0.0, 0.0], [1.0, 2.0, 0.0, 0.0])
        XCTAssertEqual(result, expected, "resize failed")
    }

    func testResizeRealSmaller() throws {
        let length = 2
        let realArrayA: RealArray = [1.0, 2.0, 3.0, 4.0]
        let result: RealArray = resize(realArrayA, length)
        let expected: RealArray = [1.0, 2.0]
        XCTAssertEqual(result, expected, "resize failed")
    }

    func testResizeComplexSmaller() throws {
        let length = 2
        let complexArrayA: ComplexArray = ([1.0, 2.0, 3.0, 4.0], [1.0, 2.0, 3.0, 4.0])
        let result: ComplexArray = resize(complexArrayA, length)
        let expected: ComplexArray = ([1.0, 2.0], [1.0, 2.0])
        XCTAssertEqual(result, expected, "resize failed")
    }

    func testResizeRealSame() throws {
        let realArrayA: RealArray = [1.0, 2.0, 3.0, 4.0]
        let length = length(realArrayA)
        let result: RealArray = resize(realArrayA, length)
        let expected: RealArray = [1.0, 2.0, 3.0, 4.0]
        XCTAssertEqual(result, expected, "resize failed")
    }

    func testResizeComplexSame() throws {
        let complexArrayA: ComplexArray = ([1.0, 2.0, 3.0, 4.0], [1.0, 2.0, 3.0, 4.0])
        let length = length(complexArrayA)
        let result: ComplexArray = resize(complexArrayA, length)
        let expected: ComplexArray = ([1.0, 2.0, 3.0, 4.0], [1.0, 2.0, 3.0, 4.0])
        XCTAssertEqual(result, expected, "resize failed")
    }

    func testArangeStop() throws {
        let n = 5.0
        let result: RealArray = arange(n)
        let expected: RealArray = [0.0, 1.0, 2.0, 3.0, 4.0]
        XCTAssertEqual(result, expected, "arange failed")
    }

    func testArangeStartStop() throws {
        let n = 5.0
        let result: RealArray = arange(1.0, n)
        let expected: RealArray = [1.0, 2.0, 3.0, 4.0]
        XCTAssertEqual(result, expected, "arange failed")
    }

    func testArangeStartStopStep() throws {
        let result: RealArray = arange(0.0, 5.0, 2.0)
        let expected: RealArray = [0.0, 2.0, 4.0]
        XCTAssertEqual(result, expected, "arange failed")
    }

    // MARK: - Basic Functionality Tests

    func testBasicIntegerRange() {
        XCTAssertEqual(arange(5), [0, 1, 2, 3, 4])
        XCTAssertEqual(arange(0, 5), [0, 1, 2, 3, 4])
        XCTAssertEqual(arange(2, 5), [2, 3, 4])
    }

    func testBasicRealRange() {
        let result = arange(0.0, 5.0, 1.0)
        let expected: [Real] = [0.0, 1.0, 2.0, 3.0, 4.0]
        XCTAssertEqual(result.count, expected.count)
        for (r, e) in zip(result, expected) {
            XCTAssertEqual(r, e, accuracy: 1e-10)
        }
    }

    // MARK: - Step Size Tests

    func testCustomStepSize() {
        XCTAssertEqual(arange(0, 10, 2), [0, 2, 4, 6, 8])
        XCTAssertEqual(arange(0, 10, 3), [0, 3, 6, 9])
    }

    func testFractionalStepSize() {
        let result = arange(0.0, 2.0, 0.5)
        let expected: [Real] = [0.0, 0.5, 1.0, 1.5]
        XCTAssertEqual(result.count, expected.count)
        for (r, e) in zip(result, expected) {
            XCTAssertEqual(r, e, accuracy: 1e-10)
        }
    }

    // MARK: - Edge Cases

    func testEmptyRange() {
        XCTAssertEqual(arange(0, 0), [])
        XCTAssertEqual(arange(5, 2), []) // Start > Stop
    }

    func testNegativeRange() {
        XCTAssertEqual(arange(-5, 0), [-5, -4, -3, -2, -1])
        XCTAssertEqual(arange(0, -5, -1), [0, -1, -2, -3, -4])
    }

    func testSingleElementRange() {
        XCTAssertEqual(arange(0, 1), [0])
        let result = arange(0.0, 1.0, 2.0)
        XCTAssertEqual(result[0], 0.0)
    }

    // MARK: - Precision Tests

    func testFloatingPointPrecision() {
        let result = arange(0.0, 1.0, 0.1)
        XCTAssertEqual(result.count, 10)
        for (i, value) in result.enumerated() {
            XCTAssertEqual(value, Double(i) * 0.1, accuracy: 1e-10)
        }
    }

    func testEdgeCaseWithFractionalStop() {
        let result = arange(0.0, 5.6, 2.0)
        let expected: [Real] = [0.0, 2.0, 4.0]
        XCTAssertEqual(result.count, expected.count)
    }

    // MARK: - Error Cases

    /*
     func testZeroStep() {
         XCTAssertThrowsError(try arange(0, 5, 0)) { error in
             XCTAssertEqual(error as? ArangeError, .invalidStep)
         }
     }
     */

    // MARK: - Type Conversion Tests

    func testIntToRealConversion() {
        let intResult = arange(0, 5)
        let realResult = arange(0.0, 5.0, 1.0)
        XCTAssertEqual(intResult.count, realResult.count)
        for (i, r) in zip(intResult, realResult) {
            XCTAssertEqual(Double(i), r, accuracy: 1e-10)
        }
    }
}

// Helper enum for error cases
enum ArangeError: Error {
    case invalidStep
}
