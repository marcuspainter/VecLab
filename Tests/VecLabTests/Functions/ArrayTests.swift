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

    func testVectorLikeReal() throws {
        let count: Int = 10
        let realArrayA: RealArray = [Real](repeating: 0, count: count)
        let result: RealArray = vector(like: realArrayA)
        XCTAssertEqual(result.count, count, "vector failed")
    }

    func testVectorLikeComplex() throws {
        let count = 10
        let r = RealArray(repeating: 0, count: count)
        let i = RealArray(repeating: 0, count: count)
        let SplitComplexArrayA: SplitComplexArray = SplitComplexArray(r, i)
        let result: RealArray = vector(like: SplitComplexArrayA)
        XCTAssertEqual(result.count, count, "vector failed")
    }

    func testComplexLikeReal() throws {
        let count: Int = 10
        let realArrayA: RealArray = [Real](repeating: 0, count: count)
        let result: SplitComplexArray = SplitComplexArray(count: realArrayA.count)
        XCTAssertEqual(result.count, count, "complex failed")
        XCTAssertEqual(result.count, count, "complex failed")
    }

    // MARK: cat

    func testCatRealArray() throws {
        let realArrayA: RealArray = [1.0, 2.0, 3.0]
        let realArrayB: RealArray = [4.0, 5.0, 6.0]
        let result: RealArray = cat(realArrayA, realArrayB)
        let expected: RealArray = [1.0, 2.0, 3.0, 4.0, 5.0, 6.0]
        XCTAssertEqual(result, expected, "cat failed")
    }

    func testCatRealArrayArray() throws {
        let realArrayA: RealArray = [1.0, 2.0, 3.0]
        let realArrayB: RealArray = [4.0, 5.0, 6.0]
        let result: RealArray = cat([realArrayA, realArrayB])
        let expected: RealArray = [1.0, 2.0, 3.0, 4.0, 5.0, 6.0]
        XCTAssertEqual(result, expected, "cat failed")
    }

    func testCatSplitComplexArray() throws {
        let realArrayA: RealArray = [1.0, 2.0]
        let realArrayB: RealArray = [3.0, 4.0]
        let SplitComplexArrayC: SplitComplexArray = SplitComplexArray(realArrayA, realArrayB)
        let SplitComplexArrayD: SplitComplexArray = SplitComplexArray(realArrayB, realArrayA)
        let result: SplitComplexArray = cat(SplitComplexArrayC, SplitComplexArrayD)
        let expected: SplitComplexArray = SplitComplexArray([1.0, 2.0, 3.0, 4.0], [3.0, 4.0, 1.0, 2.0])
        XCTAssertEqual(result, expected, "cat failed")
    }

    func testCatSplitComplexArrayArray() throws {
        let realArrayA: RealArray = [1.0, 2.0]
        let realArrayB: RealArray = [3.0, 4.0]
        let SplitComplexArrayC: SplitComplexArray = SplitComplexArray(realArrayA, realArrayB)
        let SplitComplexArrayD: SplitComplexArray = SplitComplexArray(realArrayB, realArrayA)
        let result: SplitComplexArray = cat([SplitComplexArrayC, SplitComplexArrayD])
        let expected: SplitComplexArray = SplitComplexArray([1.0, 2.0, 3.0, 4.0], [3.0, 4.0, 1.0, 2.0])
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
        let SplitComplexArrayA: SplitComplexArray = SplitComplexArray([], [])
        let result: SplitComplexArray = circshift(SplitComplexArrayA, shift)
        let expected: SplitComplexArray = SplitComplexArrayA
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
        let SplitComplexArrayA: SplitComplexArray = SplitComplexArray([1.0, 2.0, 3.0, 4.0, 5.0, 6.0], [1.0, 2.0, 3.0, 4.0, 5.0, 6.0])
        let result: SplitComplexArray = circshift(SplitComplexArrayA, shift)
        let expected: SplitComplexArray = SplitComplexArrayA
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

    func testCircshiftSplitComplexArrayLeftEven() throws {
        let shift: Int = 2
        let SplitComplexArrayA: SplitComplexArray = SplitComplexArray([1.0, 2.0, 3.0, 4.0, 5.0, 6.0], [1.0, 2.0, 3.0, 4.0, 5.0, 6.0])
        let result: SplitComplexArray = circshift(SplitComplexArrayA, shift)
        let expected: SplitComplexArray = SplitComplexArray([5.0, 6.0, 1.0, 2.0, 3.0, 4.0], [5.0, 6.0, 1.0, 2.0, 3.0, 4.0])
        XCTAssertEqual(result, expected, "circshift failed")
    }

    func testCircshiftSplitComplexArrayLeftOdd() throws {
        let shift: Int = 2
        let SplitComplexArrayA: SplitComplexArray = SplitComplexArray([1.0, 2.0, 3.0, 4.0, 5.0], [1.0, 2.0, 3.0, 4.0, 5.0])
        let result: SplitComplexArray = circshift(SplitComplexArrayA, shift)
        let expected: SplitComplexArray = SplitComplexArray([4.0, 5.0, 1.0, 2.0, 3.0], [4.0, 5.0, 1.0, 2.0, 3.0])
        XCTAssertEqual(result, expected, "circshift failed")
    }

    func testCircshiftRealArrayRight() throws {
        let shift: Int = -2
        let realArrayA: RealArray = [1.0, 2.0, 3.0, 4.0]
        let result: RealArray = circshift(realArrayA, shift)
        let expected: RealArray = [3.0, 4.0, 1.0, 2.0]
        XCTAssertEqual(result, expected, "circshift failed")
    }

    func testCircshiftSplitComplexArrayRight() throws {
        let shift: Int = -2
        let SplitComplexArrayA: SplitComplexArray = SplitComplexArray([1.0, 2.0, 3.0, 4.0], [1.0, 2.0, 3.0, 4.0])
        let result: SplitComplexArray = circshift(SplitComplexArrayA, shift)
        let expected: SplitComplexArray = SplitComplexArray([3.0, 4.0, 1.0, 2.0], [3.0, 4.0, 1.0, 2.0])
        XCTAssertEqual(result, expected, "circshift failed")
    }

    // MARK: complex

    func testComplex() throws {
        let result: Complex = Complex()
        let expected: Complex = Complex(0.0, 0.0)
        XCTAssertEqual(result, expected, "complex failed")
    }

    func testComplexRealImag() throws {
        let result: Complex = Complex(1.0, 2.0)
        let expected: Complex = Complex(1.0, 2.0)
        XCTAssertEqual(result, expected, "complex failed")
    }

    func testComplexCount() throws {
        let count: Int = 10
        let result: SplitComplexArray = SplitComplexArray(count: count)
        let expectedCount: Int = 10
        XCTAssertEqual(result.count, expectedCount, "complex failed")
    }

    func testComplexLike() throws {
        let SplitComplexArrayA: SplitComplexArray = SplitComplexArray([1.0, 2.0], [3.0, 4.0])
        let result = SplitComplexArray(count: SplitComplexArrayA.count)
        let expectedCount: Int = 2
        XCTAssertEqual(result.count, expectedCount, "complex failed")
    }

    // MARK: flip

    func testFlipRealArray() throws {
        let realArrayA: RealArray = [1.0, 2.0, 3.0, 4.0]
        let result: RealArray = flip(realArrayA)
        let expected: RealArray = [4.0, 3.0, 2.0, 1.0]
        XCTAssertEqual(result, expected, "complex failed")
    }

    func testFlipSplitComplexArray() throws {
        let SplitComplexArrayA: SplitComplexArray = SplitComplexArray([1.0, 2.0], [3.0, 4.0])
        let result: SplitComplexArray = flip(SplitComplexArrayA)
        let expected: SplitComplexArray = SplitComplexArray([2.0, 1.0], [4.0, 3.0])
        XCTAssertEqual(result, expected, "complex failed")
    }

    // MARK: length

    func testLengthRealArray() throws {
        let realArrayA: RealArray = [1.0, 2.0, 3.0, 4.0]
        let result: Int = length(realArrayA)
        let expected: Int = 4
        XCTAssertEqual(result, expected, "length failed")
    }

    func testLengthSplitComplexArray() throws {
        let SplitComplexArrayA: SplitComplexArray = SplitComplexArray([1.0, 2.0], [3.0, 4.0])
        let result: Int = length(SplitComplexArrayA)
        let expected: Int = 2
        XCTAssertEqual(result, expected, "length failed")
    }

    // MARK: paddata

    func testPaddataRealArray() throws {
        let pad: Int = 6
        let realArrayA: RealArray = [1.0, 2.0, 3.0, 4.0]
        let result: RealArray = paddata(realArrayA, length: pad)
        let expected: RealArray = [1.0, 2.0, 3.0, 4.0, 0.0, 0.0]
        XCTAssertEqual(result, expected, "paddata failed")
    }

    func testPaddataSplitComplexArray() throws {
        let pad: Int = 4
        let SplitComplexArrayA: SplitComplexArray = SplitComplexArray([1.0, 2.0], [3.0, 4.0])
        let result: SplitComplexArray = paddata(SplitComplexArrayA, length: pad)
        let expected: SplitComplexArray = SplitComplexArray([1.0, 2.0, 0.0, 0.0], [3.0, 4.0, 0.0, 0.0])
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
        let complexA: Complex = Complex(9.0, 7.0)
        let result: SplitComplexArray = repelem(complexA, rep)
        let expected: SplitComplexArray = SplitComplexArray([9.0, 9.0, 9.0], [7.0, 7.0, 7.0])
        XCTAssertEqual(result, expected, "repelem failed")
    }

    func testRepelemComplex1() throws {
        let rep: Int = 1
        let complexA: Complex = Complex(9.0, 7.0)
        let result: SplitComplexArray = repelem(complexA, rep)
        let expected: SplitComplexArray = SplitComplexArray([9.0], [7.0])
        XCTAssertEqual(result, expected, "repelem failed")
    }

    func testRepelemSplitComplexArray3() throws {
        let rep: Int = 3
        let SplitComplexArrayA: SplitComplexArray = SplitComplexArray([1.0, 2.0], [3.0, 4.0])
        let result: SplitComplexArray = repelem(SplitComplexArrayA, rep)
        let expected: SplitComplexArray = SplitComplexArray([1.0, 2.0, 1.0, 2.0, 1.0, 2.0], [3.0, 4.0, 3.0, 4.0, 3.0, 4.0])
        XCTAssertEqual(result, expected, "repelem failed")
    }

    func testRepelemSplitComplexArray1() throws {
        let rep: Int = 1
        let SplitComplexArrayA: SplitComplexArray = SplitComplexArray([1.0, 2.0], [3.0, 4.0])
        let result: SplitComplexArray = repelem(SplitComplexArrayA, rep)
        let expected: SplitComplexArray = SplitComplexArray([1.0, 2.0], [3.0, 4.0])
        XCTAssertEqual(result, expected, "repelem failed")
    }

    // MARK: resize

    func testResizeRealArray() throws {
        let size: Int = 2
        let realArrayA: RealArray = [1.0, 2.0, 3.0, 4.0]
        let result: RealArray = resize(realArrayA, length: size)
        let expected: RealArray = [1.0, 2.0]
        XCTAssertEqual(result, expected, "resize failed")
    }

    func testResizeSplitComplexArray() throws {
        let size: Int = 2
        let SplitComplexArrayA: SplitComplexArray = SplitComplexArray([1.0, 2.0, 3.0, 4.0], [1.0, 2.0, 3.0, 4.0])
        let result: SplitComplexArray = resize(SplitComplexArrayA, length: size)
        let expected: SplitComplexArray = SplitComplexArray([1.0, 2.0], [1.0, 2.0])
        XCTAssertEqual(result, expected, "resize failed")
    }

    func testResizeRealArrayIncrease() throws {
        let size: Int = 4
        let realArrayA: RealArray = [1.0, 2.0]
        let result: RealArray = resize(realArrayA, length: size)
        let expected: RealArray = [1.0, 2.0, 0.0, 0.0]
        XCTAssertEqual(result, expected, "resize failed")
    }

    func testResizeSplitComplexArrayIncrease() throws {
        let size: Int = 4
        let SplitComplexArrayA: SplitComplexArray = SplitComplexArray([1.0, 2.0], [1.0, 2.0])
        let result: SplitComplexArray = resize(SplitComplexArrayA, length: size)
        let expected: SplitComplexArray = SplitComplexArray([1.0, 2.0, 0.0, 0.0], [1.0, 2.0, 0.0, 0.0])
        XCTAssertEqual(result, expected, "resize failed")
    }

    // MARK: slice

    func testSliceRealArrayOpen() throws {
        let realArrayA: RealArray = [1.0, 2.0, 3.0, 4.0]
        let result: RealArray = slice(realArrayA, 0...2)
        let expected: RealArray = [1.0, 2.0, 3.0]
        XCTAssertEqual(result, expected, "slice failed")
    }

    func testSliceRealArrayClosed() throws {
        let realArrayA: RealArray = [1.0, 2.0, 3.0, 4.0]
        let result: RealArray = slice(realArrayA, 0..<2)
        let expected: RealArray = [1.0, 2.0]
        XCTAssertEqual(result, expected, "slice failed")
    }

    func testSliceRealArrayOpenBy() throws {
        let by: Int = 2
        let realArrayA: RealArray = [1.0, 2.0, 3.0, 4.0]
        let result: RealArray = slice(realArrayA, 0...3, by)
        let expected: RealArray = [1.0, 3.0]
        XCTAssertEqual(result, expected, "slice failed")
    }

    func testSliceRealArrayClosedBy() throws {
        let by: Int = 2
        let realArrayA: RealArray = [1.0, 2.0, 3.0, 4.0]
        let result: RealArray = slice(realArrayA, 0..<4, by)
        let expected: RealArray = [1.0, 3.0]
        XCTAssertEqual(result, expected, "slice failed")
    }

    func testSliceSplitComplexArrayOpen() throws {
        let SplitComplexArrayA: SplitComplexArray = SplitComplexArray([1.0, 2.0, 3.0, 4.0], [1.0, 2.0, 3.0, 4.0])
        let result: SplitComplexArray = slice(SplitComplexArrayA, 0...2)
        let expected: SplitComplexArray = SplitComplexArray([1.0, 2.0, 3.0], [1.0, 2.0, 3.0])
        XCTAssertEqual(result, expected, "slice failed")
    }

    func testSliceComlexArrayClosed() throws {
        let SplitComplexArrayA: SplitComplexArray = SplitComplexArray([1.0, 2.0, 3.0, 4.0], [1.0, 2.0, 3.0, 4.0])
        let result: SplitComplexArray = slice(SplitComplexArrayA, 0..<2)
        let expected: SplitComplexArray = SplitComplexArray([1.0, 2.0], [1.0, 2.0])
        XCTAssertEqual(result, expected, "slice failed")
    }

    func testSliceSplitComplexArrayOpenBy() throws {
        let by: Int = 2
        let SplitComplexArrayA: SplitComplexArray = SplitComplexArray([1.0, 2.0, 3.0, 4.0], [1.0, 2.0, 3.0, 4.0])
        let result: SplitComplexArray = slice(SplitComplexArrayA, 0...3, by)
        let expected: SplitComplexArray = SplitComplexArray([1.0, 3.0], [1.0, 3.0])
        XCTAssertEqual(result, expected, "slice failed")
    }

    func testSliceSplitComplexArrayClosedBy() throws {
        let by: Int = 2
        let SplitComplexArrayA: SplitComplexArray = SplitComplexArray([1.0, 2.0, 3.0, 4.0], [1.0, 2.0, 3.0, 4.0])
        let result: SplitComplexArray = slice(SplitComplexArrayA, 0..<4, by)
        let expected: SplitComplexArray = SplitComplexArray([1.0, 3.0], [1.0, 3.0])
        XCTAssertEqual(result, expected, "slice failed")
    }

    // MARK: trimdata

    func testTrimdataRealArray() throws {
        let size: Int = 2
        let realArrayA: RealArray = [1.0, 2.0, 3.0, 4.0]
        let result: RealArray = trimdata(realArrayA, length: size)
        let expected: RealArray = [1.0, 2.0]
        XCTAssertEqual(result, expected, "trimdata failed")
    }

    func testTrimdataRealArrayTooLarge() throws {
        let size: Int = 10
        let realArrayA: RealArray = [1.0, 2.0, 3.0, 4.0]
        let result: RealArray = trimdata(realArrayA, length: size)
        let expected: RealArray = [1.0, 2.0, 3.0, 4.0]
        XCTAssertEqual(result, expected, "trimdata failed")
    }

    func testTrimdataSplitComplexArray() throws {
        let size: Int = 2
        let SplitComplexArrayA: SplitComplexArray = SplitComplexArray([1.0, 2.0, 3.0, 4.0], [1.0, 2.0, 3.0, 4.0])
        let result: SplitComplexArray = trimdata(SplitComplexArrayA, length: size)
        let expected: SplitComplexArray = SplitComplexArray([1.0, 2.0], [1.0, 2.0])
        XCTAssertEqual(result, expected, "trimdata failed")
    }

    func testTrimdataSplitComplexArrayTooLarge() throws {
        let size: Int = 10
        let SplitComplexArrayA: SplitComplexArray = SplitComplexArray([1.0, 2.0, 3.0, 4.0], [1.0, 2.0, 3.0, 4.0])
        let result: SplitComplexArray = trimdata(SplitComplexArrayA, length: size)
        let expected: SplitComplexArray = SplitComplexArray([1.0, 2.0, 3.0, 4.0], [1.0, 2.0, 3.0, 4.0])
        XCTAssertEqual(result, expected, "trimdata failed")
    }

    // MARK: flip

    func testFlipReal() throws {
        let realArrayA: RealArray = [1.0, 2.0, 3.0, 4.0]
        let result: RealArray = flip(realArrayA)
        let expected: RealArray = [4.0, 3.0, 2.0, 1.0]
        XCTAssertEqual(result, expected, "flip failed")
    }

    func testFlipComplex() throws {
        let SplitComplexArrayA: SplitComplexArray = SplitComplexArray([1.0, 2.0, 3.0, 4.0], [1.0, 2.0, 3.0, 4.0])
        let result: SplitComplexArray = flip(SplitComplexArrayA)
        let expected: SplitComplexArray = SplitComplexArray([4.0, 3.0, 2.0, 1.0], [4.0, 3.0, 2.0, 1.0])
        XCTAssertEqual(result, expected, "flip failed")
    }

    // MARK: zeros

    func testZeros() throws {
        let n: Int = 4
        let result: RealArray = zeros(n)
        let expected: RealArray = [0.0, 0.0, 0.0, 0.0]
        XCTAssertEqual(result, expected, "zeros failed")
    }

    func testZerosReal() throws {
        let n: Real = 4.0
        let result: RealArray = zeros(n)
        let expected: RealArray = [0.0, 0.0, 0.0, 0.0]
        XCTAssertEqual(result, expected, "zeros failed")
    }

    // MARK: ones

    func testOnes() throws {
        let n: Int = 4
        let result: RealArray = ones(n)
        let expected: RealArray = [1.0, 1.0, 1.0, 1.0]
        XCTAssertEqual(result, expected, "ones failed")
    }

    func testOnesReal() throws {
        let n: Real = 4.0
        let result: RealArray = ones(n)
        let expected: RealArray = [1.0, 1.0, 1.0, 1.0]
        XCTAssertEqual(result, expected, "ones failed")
    }

    // MARK: paddata

    func testPaddataReal() throws {
        let length = 4
        let realArrayA: RealArray = [1.0, 2.0]
        let result: RealArray = paddata(realArrayA, length: length)
        let expected: RealArray = [1.0, 2.0, 0.0, 0.0]
        XCTAssertEqual(result, expected, "paddata failed")
    }

    func testPaddataComplex() throws {
        let length = 4
        let SplitComplexArrayA: SplitComplexArray = SplitComplexArray([1.0, 2.0], [1.0, 2.0])
        let result: SplitComplexArray = paddata(SplitComplexArrayA, length: length)
        let expected: SplitComplexArray = SplitComplexArray([1.0, 2.0, 0.0, 0.0], [1.0, 2.0, 0.0, 0.0])
        XCTAssertEqual(result, expected, "paddata failed")
    }

    func testResizeRealBigger() throws {
        let length = 4
        let realArrayA: RealArray = [1.0, 2.0]
        let result: RealArray = resize(realArrayA, length: length)
        let expected: RealArray = [1.0, 2.0, 0.0, 0.0]
        XCTAssertEqual(result, expected, "resize failed")
    }

    func testResizeComplexBigger() throws {
        let length = 4
        let SplitComplexArrayA: SplitComplexArray = SplitComplexArray([1.0, 2.0], [1.0, 2.0])
        let result: SplitComplexArray = resize(SplitComplexArrayA, length: length)
        let expected: SplitComplexArray = SplitComplexArray([1.0, 2.0, 0.0, 0.0], [1.0, 2.0, 0.0, 0.0])
        XCTAssertEqual(result, expected, "resize failed")
    }

    func testResizeRealSmaller() throws {
        let length = 2
        let realArrayA: RealArray = [1.0, 2.0, 3.0, 4.0]
        let result: RealArray = resize(realArrayA, length: length)
        let expected: RealArray = [1.0, 2.0]
        XCTAssertEqual(result, expected, "resize failed")
    }

    func testResizeComplexSmaller() throws {
        let length = 2
        let SplitComplexArrayA: SplitComplexArray = SplitComplexArray([1.0, 2.0, 3.0, 4.0], [1.0, 2.0, 3.0, 4.0])
        let result: SplitComplexArray = resize(SplitComplexArrayA, length: length)
        let expected: SplitComplexArray = SplitComplexArray([1.0, 2.0], [1.0, 2.0])
        XCTAssertEqual(result, expected, "resize failed")
    }

    func testResizeRealSame() throws {
        let realArrayA: RealArray = [1.0, 2.0, 3.0, 4.0]
        let length = length(realArrayA)
        let result: RealArray = resize(realArrayA, length: length)
        let expected: RealArray = [1.0, 2.0, 3.0, 4.0]
        XCTAssertEqual(result, expected, "resize failed")
    }

    func testResizeComplexSame() throws {
        let SplitComplexArrayA: SplitComplexArray = SplitComplexArray([1.0, 2.0, 3.0, 4.0], [1.0, 2.0, 3.0, 4.0])
        let length = length(SplitComplexArrayA)
        let result: SplitComplexArray = resize(SplitComplexArrayA, length: length)
        let expected: SplitComplexArray = SplitComplexArray([1.0, 2.0, 3.0, 4.0], [1.0, 2.0, 3.0, 4.0])
        XCTAssertEqual(result, expected, "resize failed")
    }

    func testArangeStop() throws {
        let n: Real = 5.0
        let result: RealArray = arange(n)
        let expected: RealArray = [0.0, 1.0, 2.0, 3.0, 4.0]
        XCTAssertEqual(result, expected, "arange failed")
    }

    func testArangeStartStop() throws {
        let n: Real = 5.0
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
        XCTAssertEqual(arange(5, 2), [])  // Start > Stop
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
        let result: RealArray = arange(0.0, 1.0, 0.1)
        XCTAssertEqual(result.count, 10)
        for (i, value) in result.enumerated() {
            XCTAssertEqual(value, Real(i) * 0.1, accuracy: 1e-10)
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
        let intResult: RealArray = arange(0, 5)
        let realResult: RealArray = arange(0.0, 5.0, 1.0)
        XCTAssertEqual(intResult.count, realResult.count)
        for (i, r) in zip(intResult, realResult) {
            XCTAssertEqual(Real(i), r, accuracy: 1e-10)
        }
    }

    func testArrange1() throws {
        let a1 = arange(5)
        let a2 = arange(0, 5)
        let a3 = arange(0, 5, 1)
        let expected = [0.0, 1.0, 2.0, 3.0, 4.0]
        XCTAssertEqual(a1, expected, "arrange failed")
        XCTAssertEqual(a2, expected, "arrange failed")
        XCTAssertEqual(a3, expected, "arrange failed")
    }

}

// Helper enum for error cases
enum ArangeError: Error {
    case invalidStep
}
