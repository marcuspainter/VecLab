//
//  ArrayTests.swift
//
//
//  Created by Marcus Painter on 25/09/2023.
//

import Foundation
import XCTest
import VecLab

class ArrayTests: XCTestCase {
    
    // MARK: vector

    func testVectorCount() throws {
        let count = 10
        let result = vector(count: count)
        XCTAssertEqual(result.count, count, "vector failed")
    }
    
    func testVectorIntArray() throws {
        let intArray = [1, 2 , 3]
        let result = vector(intArray)
        let expected = [1.0, 2.0, 3.0]
        XCTAssertEqual(result, expected, "vector failed")
    }

    func testVectorFloatArray() throws {
        let floatArray: [Float] = [1, 2 , 3]
        let result = vector(floatArray)
        let expected = [1.0, 2.0, 3.0]
        XCTAssertEqual(result, expected, "vector failed")
    }
    
    func testVectorDoubleArray() throws {
        let doubleArray: [Double] = [1, 2 , 3]
        let result = vector(doubleArray)
        let expected = [1.0, 2.0, 3.0]
        XCTAssertEqual(result, expected, "vector failed")
    }
    
    func testVectorIntRange() throws {
        let result = vector(1 ..< 5)
        let expected = [1.0, 2.0, 3.0, 4.0]
        XCTAssertEqual(result, expected, "vector failed")
    }
    
    func testVectorRealRange() throws {
        let result = vector(1.0 ..< 5.0)
        let expected = [1.0, 2.0, 3.0, 4.0]
        XCTAssertEqual(result, expected, "vector failed")
    }
    
    func testVectorIntClosedRange() throws {
        let result = vector(1 ... 5)
        let expected = [1.0, 2.0, 3.0, 4.0, 5.0]
        XCTAssertEqual(result, expected, "vector failed")
    }
    
    func testVectorRealClosedRange() throws {
        let result = vector(1.0 ..< 5.0)
        let expected = [1.0, 2.0, 3.0, 4.0]
        XCTAssertEqual(result, expected, "vector failed")
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
        let result: RealArray  = vector(sized: complexArrayA)
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

    func testCircshiftRealArrayLeft() throws {
        let shift: Int = 2
        let realArrayA: RealArray = [1.0, 2.0, 3.0, 4.0]
        let result: RealArray = circshift(realArrayA, shift)
        let expected: RealArray = [3.0, 4.0, 1.0, 2.0]
        XCTAssertEqual(result, expected, "circshift failed")
    }

    func testCircshiftComplexArrayLeft() throws {
        let shift: Int = 2
        let complexArrayA: ComplexArray = ([1.0, 2.0, 3.0, 4.0], [1.0, 2.0, 3.0, 4.0])
        let result: ComplexArray = circshift(complexArrayA, shift)
        let expected: ComplexArray = ([3.0, 4.0, 1.0, 2.0], [3.0, 4.0, 1.0, 2.0])
        XCTAssertEqual(result, expected, "circshift failed")
    }

    func testCircshiftRealArrayRight() throws {
        let shift: Int = -1
        let realArrayA: RealArray = [1.0, 2.0, 3.0, 4.0]
        let result: RealArray = circshift(realArrayA, shift)
        let expected: RealArray = [2.0, 3.0, 4.0, 1.0]
        XCTAssertEqual(result, expected, "circshift failed")
    }

    func testCircshiftComplexArrayRight() throws {
        let shift: Int = -1
        let complexArrayA: ComplexArray = ([1.0, 2.0, 3.0, 4.0], [1.0, 2.0, 3.0, 4.0])
        let result: ComplexArray = circshift(complexArrayA, shift)
        let expected: ComplexArray = ([2.0, 3.0, 4.0, 1.0], [2.0, 3.0, 4.0, 1.0])
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
        let expected: ComplexArray =  ([2.0, 1.0], [4.0, 3.0])
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
    
    // MARK: ones
    func testOnes() throws {
        let count = 3
        let result = ones(count)
        let expected = [1.0, 1.0, 1.0]
        XCTAssertEqual(result, expected, "ones failed")
    }
    
    // MARK: zeros
    func testZeros() throws {
        let count = 3
        let result = zeros(count)
        let expected = [0.0, 0.0, 0.0]
        XCTAssertEqual(result, expected, "ones failed")
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
        let result: ComplexArray  = paddata(complexArrayA, pad)
        let expected: ComplexArray  = ([1.0, 2.0, 0.0, 0.0], [3.0, 4.0, 0.0, 0.0])
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

    func testSliceComplexArrayOpen() throws {
        let complexArrayA: ComplexArray = ([1.0, 2.0, 3.0, 4.0], [1.0, 2.0, 3.0, 4.0])
        let result: ComplexArray = slice(complexArrayA, 0...2)
        let expected: ComplexArray = ([1.0, 2.0, 3.0], [1.0, 2.0, 3.0])
        XCTAssertEqual(result, expected, "slice failed")
    }

    func testSliceComlexArrayClosed() throws {
        let complexArrayA: ComplexArray = ([1.0, 2.0, 3.0, 4.0], [1.0, 2.0, 3.0, 4.0])
        let result: ComplexArray = slice(complexArrayA, 0..<2)
        let expected: ComplexArray = ([1.0, 2.0], [1.0, 2.0])
        XCTAssertEqual(result, expected, "slice failed")
    }

    func testSliceComplexArrayOpenBy() throws {
        let by: Int = 2
        let complexArrayA: ComplexArray = ([1.0, 2.0, 3.0, 4.0], [1.0, 2.0, 3.0, 4.0])
        let result: ComplexArray = slice(complexArrayA, 0...3, by)
        let expected: ComplexArray = ([1.0, 3.0], [1.0, 3.0])
        XCTAssertEqual(result, expected, "slice failed")
    }

    func testSliceComplexArrayClosedBy() throws {
        let by: Int = 2
        let complexArrayA: ComplexArray = ([1.0, 2.0, 3.0, 4.0], [1.0, 2.0, 3.0, 4.0])
        let result: ComplexArray = slice(complexArrayA, 0..<4, by)
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

}
