//
//  ArrayTestsNew.swift
//
//
//  Created by Marcus Painter on 25/09/2023.
//

import Foundation
import Testing
import VecLab


struct ArrayTestsNew {
    
    // MARK: vector

    @Test func testVectorCount() throws {
        let count = 10
        let result = vector(count: count)
        #expect(result.count == count, "vector failed")
    }

    @Test func testVectorSizedReal() throws {
        let count: Int = 10
        let realArrayA: RealArray = [Real](repeating: 0, count: count)
        let result: RealArray = vector(sized: realArrayA)
        #expect(result.count == count, "vector failed")
    }

    @Test func testVectorSizedComplex() throws {
        let count = 10
        let r = RealArray(repeating: 0, count: count)
        let i = RealArray(repeating: 0, count: count)
        let complexArrayA: ComplexArray = (r, i)
        let result: RealArray  = vector(sized: complexArrayA)
        #expect(result.count == count, "vector failed")
    }

    @Test func testComplexSizedReal() throws {
        let count: Int = 10
        let realArrayA: RealArray = [Real](repeating: 0, count: count)
        let result: ComplexArray = complex(sized: realArrayA)
        #expect(result.0.count == count && result.1.count == count, "complex failed")
    }

    // MARK: cat

    @Test func testCatRealArray() throws {
        let realArrayA: RealArray = [1.0, 2.0, 3.0]
        let realArrayB: RealArray = [4.0, 5.0, 6.0]
        let result: RealArray = cat(realArrayA, realArrayB)
        let expected: RealArray = [1.0, 2.0, 3.0, 4.0, 5.0, 6.0]
        #expect(result == expected, "cat failed")
    }

    @Test func testCatComplexArray() throws {
        let realArrayA: RealArray = [1.0, 2.0]
        let realArrayB: RealArray = [3.0, 4.0]
        let complexArrayC: ComplexArray = (realArrayA, realArrayB)
        let complexArrayD: ComplexArray = (realArrayB, realArrayA)
        let result: ComplexArray = cat(complexArrayC, complexArrayD)
        let expected: ComplexArray = ([1.0, 2.0, 3.0, 4.0], [3.0, 4.0, 1.0, 2.0])
        #expect(result == expected, "cat failed")
    }

    // MARK: circshift

    @Test func testCircshiftRealArrayLeft() throws {
        let shift: Int = 2
        let realArrayA: RealArray = [1.0, 2.0, 3.0, 4.0]
        let result: RealArray = circshift(realArrayA, shift)
        let expected: RealArray = [3.0, 4.0, 1.0, 2.0]
        #expect(result == expected, "circshift failed")
    }

    @Test func testCircshiftComplexArrayLeft() throws {
        let shift: Int = 2
        let complexArrayA: ComplexArray = ([1.0, 2.0, 3.0, 4.0], [1.0, 2.0, 3.0, 4.0])
        let result: ComplexArray = circshift(complexArrayA, shift)
        let expected: ComplexArray = ([3.0, 4.0, 1.0, 2.0], [3.0, 4.0, 1.0, 2.0])
        #expect(result == expected, "circshift failed")
    }

    @Test func testCircshiftRealArrayRight() throws {
        let shift: Int = -1
        let realArrayA: RealArray = [1.0, 2.0, 3.0, 4.0]
        let result: RealArray = circshift(realArrayA, shift)
        let expected: RealArray = [2.0, 3.0, 4.0, 1.0]
        #expect(result == expected, "circshift failed")
    }

    @Test func testCircshiftComplexArrayRight() throws {
        let shift: Int = -1
        let complexArrayA: ComplexArray = ([1.0, 2.0, 3.0, 4.0], [1.0, 2.0, 3.0, 4.0])
        let result: ComplexArray = circshift(complexArrayA, shift)
        let expected: ComplexArray = ([2.0, 3.0, 4.0, 1.0], [2.0, 3.0, 4.0, 1.0])
        #expect(result == expected, "circshift failed")
    }

    // MARK: complex

    @Test func testComplex() throws {
        let result: Complex = complex()
        let expected: Complex = (0.0, 0.0)
        #expect(result == expected, "complex failed")
    }

    @Test func testComplexRealImag() throws {
        let result: Complex = complex(1.0, 2.0)
        let expected: Complex = (1.0, 2.0)
        #expect(result == expected, "complex failed")
    }

    @Test func testComplexCount() throws {
        let count: Int = 10
        let result: ComplexArray = complex(count: count)
        let expectedCount: Int = 10
        #expect(result.0.count == expectedCount, "complex failed")
    }

    @Test func testComplexSized() throws {
        let complexArrayA: ComplexArray = ([1.0, 2.0], [3.0, 4.0])
        let result = complex(sized: complexArrayA)
        let expectedCount: Int = 2
        #expect(result.0.count == expectedCount, "complex failed")
    }

    // MARK: flip

    @Test func testFlipRealArray() throws {
        let realArrayA: RealArray = [1.0, 2.0, 3.0, 4.0]
        let result: RealArray = flip(realArrayA)
        let expected: RealArray = [4.0, 3.0, 2.0, 1.0]
        #expect(result == expected, "flip failed")
    }

    @Test func testFlipComplexArray() throws {
        let complexArrayA: ComplexArray = ([1.0, 2.0], [3.0, 4.0])
        let result: ComplexArray = flip(complexArrayA)
        let expected: ComplexArray =  ([2.0, 1.0], [4.0, 3.0])
        #expect(result == expected, "flip failed")
    }

    // MARK: length

    @Test func testLengthRealArray() throws {
        let realArrayA: RealArray = [1.0, 2.0, 3.0, 4.0]
        let result: Int = length(realArrayA)
        let expected: Int = 4
        #expect(result == expected, "length failed")
    }

    @Test func testLengthComplexArray() throws {
        let complexArrayA: ComplexArray = ([1.0, 2.0], [3.0, 4.0])
        let result: Int = length(complexArrayA)
        let expected: Int = 2
        #expect(result == expected, "length failed")
    }

    // MARK: paddata

    @Test func testPaddataRealArray() throws {
        let pad: Int = 6
        let realArrayA: RealArray = [1.0, 2.0, 3.0, 4.0]
        let result: RealArray = paddata(realArrayA, pad)
        let expected: RealArray = [1.0, 2.0, 3.0, 4.0, 0.0, 0.0]
        #expect(result == expected, "paddata failed")
    }

    @Test func testPaddataComplexArray() throws {
        let pad: Int = 4
        let complexArrayA: ComplexArray = ([1.0, 2.0], [3.0, 4.0])
        let result: ComplexArray  = paddata(complexArrayA, pad)
        let expected: ComplexArray  = ([1.0, 2.0, 0.0, 0.0], [3.0, 4.0, 0.0, 0.0])
        #expect(result == expected, "paddata failed")
    }

    // MARK: repelem

    @Test func testRepelemReal3() throws {
        let rep: Int = 3
        let realA: Real = 9.0
        let result: RealArray = repelem(realA, rep)
        let expected: RealArray = [9.0, 9.0, 9.0]
        #expect(result == expected, "repelem failed")
    }

    @Test func testRepelemReal1() throws {
        let rep: Int = 1
        let realA: Real = 9.0
        let result: RealArray = repelem(realA, rep)
        let expected: RealArray = [9.0]
        #expect(result == expected, "repelem failed")
    }

    @Test func testRepelemRealArray3() throws {
        let rep: Int = 3
        let realArrayA: RealArray = [1.0, 2.0]
        let result: RealArray = repelem(realArrayA, rep)
        let expected: RealArray = [1.0, 2.0, 1.0, 2.0, 1.0, 2.0]
        #expect(result == expected, "repelem failed")
    }

    @Test func testRepelemRealArray1() throws {
        let rep: Int = 1
        let realArrayA: RealArray = [1.0, 2.0]
        let result: RealArray = repelem(realArrayA, rep)
        let expected: RealArray = [1.0, 2.0]
        #expect(result == expected, "repelem failed")
    }

    @Test func testRepelemComplex3() throws {
        let rep: Int = 3
        let complexA: Complex = (9.0, 7.0)
        let result: ComplexArray = repelem(complexA, rep)
        let expected: ComplexArray = ([9.0, 9.0, 9.0], [7.0, 7.0, 7.0])
        #expect(result == expected, "repelem failed")
    }

    @Test func testRepelemComplex1() throws {
        let rep: Int = 1
        let complexA: Complex = (9.0, 7.0)
        let result: ComplexArray = repelem(complexA, rep)
        let expected: ComplexArray = ([9.0], [7.0])
        #expect(result == expected, "repelem failed")
    }

    @Test func testRepelemComplexArray3() throws {
        let rep: Int = 3
        let complexArrayA: ComplexArray = ([1.0, 2.0], [3.0, 4.0])
        let result: ComplexArray = repelem(complexArrayA, rep)
        let expected: ComplexArray = ([1.0, 2.0, 1.0, 2.0, 1.0, 2.0], [3.0, 4.0, 3.0, 4.0, 3.0, 4.0])
        #expect(result == expected, "repelem failed")
    }

    @Test func testRepelemComplexArray1() throws {
        let rep: Int = 1
        let complexArrayA: ComplexArray = ([1.0, 2.0], [3.0, 4.0])
        let result: ComplexArray = repelem(complexArrayA, rep)
        let expected: ComplexArray = ([1.0, 2.0], [3.0, 4.0])
        #expect(result == expected, "repelem failed")
    }

    // MARK: resize

    @Test func testResizeRealArray() throws {
        let size: Int = 2
        let realArrayA: RealArray = [1.0, 2.0, 3.0, 4.0]
        let result: RealArray = resize(realArrayA, size)
        let expected: RealArray = [1.0, 2.0]
        #expect(result == expected, "resize failed")
    }

    @Test func testResizeComplexArray() throws {
        let size: Int = 2
        let complexArrayA: ComplexArray = ([1.0, 2.0, 3.0, 4.0], [1.0, 2.0, 3.0, 4.0])
        let result: ComplexArray = resize(complexArrayA, size)
        let expected: ComplexArray = ([1.0, 2.0], [1.0, 2.0])
        #expect(result == expected, "resize failed")
    }

    @Test func testResizeRealArrayIncrease() throws {
        let size: Int = 4
        let realArrayA: RealArray = [1.0, 2.0]
        let result: RealArray = resize(realArrayA, size)
        let expected: RealArray = [1.0, 2.0, 0.0, 0.0]
        #expect(result == expected, "resize failed")
    }

    @Test func testResizeComplexArrayIncrease() throws {
        let size: Int = 4
        let complexArrayA: ComplexArray = ([1.0, 2.0], [1.0, 2.0])
        let result: ComplexArray = resize(complexArrayA, size)
        let expected: ComplexArray = ([1.0, 2.0, 0.0, 0.0], [1.0, 2.0, 0.0, 0.0])
        #expect(result == expected, "resize failed")
    }

    // MARK: slice

    @Test func testSliceRealArrayOpen() throws {
        let realArrayA: RealArray = [1.0, 2.0, 3.0, 4.0]
        let result: RealArray = slice(realArrayA, 0...2)
        let expected: RealArray = [1.0, 2.0, 3.0]
        #expect(result == expected, "slice failed")
    }

    @Test func testSliceRealArrayClosed() throws {
        let realArrayA: RealArray = [1.0, 2.0, 3.0, 4.0]
        let result: RealArray = slice(realArrayA, 0..<2)
        let expected: RealArray = [1.0, 2.0]
        #expect(result == expected, "slice failed")
    }

    @Test func testSliceRealArrayOpenBy() throws {
        let by: Int = 2
        let realArrayA: RealArray = [1.0, 2.0, 3.0, 4.0]
        let result: RealArray = slice(realArrayA, 0...3, by)
        let expected: RealArray = [1.0, 3.0]
        #expect(result == expected, "slice failed")
    }

    @Test func testSliceRealArrayClosedBy() throws {
        let by: Int = 2
        let realArrayA: RealArray = [1.0, 2.0, 3.0, 4.0]
        let result: RealArray = slice(realArrayA, 0..<4, by)
        let expected: RealArray = [1.0, 3.0]
        #expect(result == expected, "slice failed")
    }

    @Test func testSliceComplexArrayOpen() throws {
        let complexArrayA: ComplexArray = ([1.0, 2.0, 3.0, 4.0], [1.0, 2.0, 3.0, 4.0])
        let result: ComplexArray = slice(complexArrayA, 0...2)
        let expected: ComplexArray = ([1.0, 2.0, 3.0], [1.0, 2.0, 3.0])
        #expect(result == expected, "slice failed")
    }

    @Test func testSliceComlexArrayClosed() throws {
        let complexArrayA: ComplexArray = ([1.0, 2.0, 3.0, 4.0], [1.0, 2.0, 3.0, 4.0])
        let result: ComplexArray = slice(complexArrayA, 0..<2)
        let expected: ComplexArray = ([1.0, 2.0], [1.0, 2.0])
        #expect(result == expected, "slice failed")
    }

    @Test func testSliceComplexArrayOpenBy() throws {
        let by: Int = 2
        let complexArrayA: ComplexArray = ([1.0, 2.0, 3.0, 4.0], [1.0, 2.0, 3.0, 4.0])
        let result: ComplexArray = slice(complexArrayA, 0...3, by)
        let expected: ComplexArray = ([1.0, 3.0], [1.0, 3.0])
        #expect(result == expected, "slice failed")
    }

    @Test func testSliceComplexArrayClosedBy() throws {
        let by: Int = 2
        let complexArrayA: ComplexArray = ([1.0, 2.0, 3.0, 4.0], [1.0, 2.0, 3.0, 4.0])
        let result: ComplexArray = slice(complexArrayA, 0..<4, by)
        let expected: ComplexArray = ([1.0, 3.0], [1.0, 3.0])
        #expect(result == expected, "slice failed")
    }

    // MARK: trimdata

    @Test func testTrimdataRealArray() throws {
        let size: Int = 2
        let realArrayA: RealArray = [1.0, 2.0, 3.0, 4.0]
        let result: RealArray = trimdata(realArrayA, size)
        let expected: RealArray = [1.0, 2.0]
        #expect(result == expected, "trimdata failed")
    }

    @Test func testTrimdataRealArrayTooLarge() throws {
        let size: Int = 10
        let realArrayA: RealArray = [1.0, 2.0, 3.0, 4.0]
        let result: RealArray = trimdata(realArrayA, size)
        let expected: RealArray = [1.0, 2.0, 3.0, 4.0]
        #expect(result == expected, "trimdata failed")
    }

    @Test func testTrimdataComplexArray() throws {
        let size: Int = 2
        let complexArrayA: ComplexArray = ([1.0, 2.0, 3.0, 4.0], [1.0, 2.0, 3.0, 4.0])
        let result: ComplexArray = trimdata(complexArrayA, size)
        let expected: ComplexArray = ([1.0, 2.0], [1.0, 2.0])
        #expect(result == expected, "trimdata failed")
    }

    @Test func testTrimdataComplexArrayTooLarge() throws {
        let size: Int = 10
        let complexArrayA: ComplexArray = ([1.0, 2.0, 3.0, 4.0], [1.0, 2.0, 3.0, 4.0])
        let result: ComplexArray = trimdata(complexArrayA, size)
        let expected: ComplexArray = ([1.0, 2.0, 3.0, 4.0], [1.0, 2.0, 3.0, 4.0])
        #expect(result == expected, "trimdata failed")
    }
}
