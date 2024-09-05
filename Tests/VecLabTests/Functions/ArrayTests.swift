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

    func testVectorSizedReal() throws {
        let count: Int = 10
        let realArrayA: RealDoubleArray = [Double](repeating: 0, count: count)
        let result: RealDoubleArray = vector(sized: realArrayA)
        XCTAssertEqual(result.count, count, "vector failed")
    }

    func testVectorSizedComplex() throws {
        let count = 10
        let r = [Double](repeating: 0, count: count)
        let i = [Double](repeating: 0, count: count)
        let complexArrayA: ComplexDoubleArray = (r, i)
        let result: RealDoubleArray  = vector(sized: complexArrayA)
        XCTAssertEqual(result.count, count, "vector failed")
    }

    func testComplexSizedReal() throws {
        let count: Int = 10
        let realArrayA: RealDoubleArray = [Double](repeating: 0, count: count)
        let result: ComplexDoubleArray = complex(sized: realArrayA)
        XCTAssertEqual(result.0.count, count, "complex failed")
        XCTAssertEqual(result.1.count, count, "complex failed")
    }

    // MARK: cat

    func testCatRealArray() throws {
        let realArrayA: RealDoubleArray = [1.0, 2.0, 3.0]
        let realArrayB: RealDoubleArray = [4.0, 5.0, 6.0]
        let result: RealDoubleArray = cat(realArrayA, realArrayB)
        let expected: RealDoubleArray = [1.0, 2.0, 3.0, 4.0, 5.0, 6.0]
        XCTAssertEqual(result, expected, "cat failed")
    }

    func testCatComplexArray() throws {
        let realArrayA: RealDoubleArray = [1.0, 2.0]
        let realArrayB: RealDoubleArray = [3.0, 4.0]
        let complexArrayC: ComplexDoubleArray = (realArrayA, realArrayB)
        let complexArrayD: ComplexDoubleArray = (realArrayB, realArrayA)
        let result: ComplexDoubleArray = cat(complexArrayC, complexArrayD)
        let expected: ComplexDoubleArray = ([1.0, 2.0, 3.0, 4.0], [3.0, 4.0, 1.0, 2.0])
        XCTAssertEqual(result, expected, "cat failed")
    }

    // MARK: circshift
    
    func testCircshiftRealEmpty() throws {
        let shift: Int = 2
        let realArrayA: RealDoubleArray = []
        let result: RealDoubleArray = circshift(realArrayA, shift)
        let expected: RealDoubleArray = realArrayA
        XCTAssertEqual(result, expected, "circshift failed")
    }
    
    func testCircshiftComplexEmpty() throws {
        let shift: Int = 2
        let complexArrayA: ComplexDoubleArray = ([], [])
        let result: ComplexDoubleArray = circshift(complexArrayA, shift)
        let expected: ComplexDoubleArray = complexArrayA
        XCTAssertEqual(result, expected, "circshift failed")
    }
    
    func testCircshiftRealZero() throws {
        let shift: Int = 0
        let realArrayA: RealDoubleArray = [1.0, 2.0, 3.0, 4.0, 5.0, 6.0]
        let result: RealDoubleArray = circshift(realArrayA, shift)
        let expected: RealDoubleArray = realArrayA
        XCTAssertEqual(result, expected, "circshift failed")
    }
    
    func testCircshiftComplexZero() throws {
        let shift: Int = 0
        let complexArrayA: ComplexDoubleArray = ([1.0, 2.0, 3.0, 4.0, 5.0, 6.0], [1.0, 2.0, 3.0, 4.0, 5.0, 6.0])
        let result: ComplexDoubleArray = circshift(complexArrayA, shift)
        let expected: ComplexDoubleArray = complexArrayA
        XCTAssertEqual(result, expected, "circshift failed")
    }

    func testCircshiftRealArrayLeftEven() throws {
        let shift: Int = 2
        let realArrayA: RealDoubleArray = [1.0, 2.0, 3.0, 4.0, 5.0, 6.0]
        let result: RealDoubleArray = circshift(realArrayA, shift)
        let expected: RealDoubleArray = [5.0, 6.0, 1.0, 2.0, 3.0, 4.0]
        XCTAssertEqual(result, expected, "circshift failed")
    }
    
    func testCircshiftRealArrayLeftOdd() throws {
        let shift: Int = 2
        let realArrayA: RealDoubleArray = [1.0, 2.0, 3.0, 4.0, 5.0]
        let result: RealDoubleArray = circshift(realArrayA, shift)
        let expected: RealDoubleArray = [4.0, 5.0, 1.0, 2.0, 3.0]
        XCTAssertEqual(result, expected, "circshift failed")
    }

    func testCircshiftComplexArrayLeftEven() throws {
        let shift: Int = 2
        let complexArrayA: ComplexDoubleArray = ([1.0, 2.0, 3.0, 4.0, 5.0, 6.0], [1.0, 2.0, 3.0, 4.0, 5.0, 6.0])
        let result: ComplexDoubleArray = circshift(complexArrayA, shift)
        let expected: ComplexDoubleArray = ([5.0, 6.0, 1.0, 2.0, 3.0, 4.0], [5.0, 6.0, 1.0, 2.0, 3.0, 4.0])
        XCTAssertEqual(result, expected, "circshift failed")
    }
    
    func testCircshiftComplexArrayLeftOdd() throws {
        let shift: Int = 2
        let complexArrayA: ComplexDoubleArray = ([1.0, 2.0, 3.0, 4.0, 5.0], [1.0, 2.0, 3.0, 4.0, 5.0])
        let result: ComplexDoubleArray = circshift(complexArrayA, shift)
        let expected: ComplexDoubleArray = ([4.0, 5.0, 1.0, 2.0, 3.0], [4.0, 5.0, 1.0, 2.0, 3.0])
        XCTAssertEqual(result, expected, "circshift failed")
    }

    func testCircshiftRealArrayRight() throws {
        let shift: Int = -2
        let realArrayA: RealDoubleArray = [1.0, 2.0, 3.0, 4.0]
        let result: RealDoubleArray = circshift(realArrayA, shift)
        let expected: RealDoubleArray = [3.0, 4.0, 1.0, 2.0]
        XCTAssertEqual(result, expected, "circshift failed")
    }

    func testCircshiftComplexArrayRight() throws {
        let shift: Int = -2
        let complexArrayA: ComplexDoubleArray = ([1.0, 2.0, 3.0, 4.0], [1.0, 2.0, 3.0, 4.0])
        let result: ComplexDoubleArray = circshift(complexArrayA, shift)
        let expected: ComplexDoubleArray = ([3.0, 4.0, 1.0, 2.0], [3.0, 4.0, 1.0, 2.0])
        XCTAssertEqual(result, expected, "circshift failed")
    }

    // MARK: ComplexDouble

    func testComplex() throws {
        let result: ComplexDouble = complex()
        let expected: ComplexDouble = (0.0, 0.0)
        XCTAssertEqual(result, expected, "complex failed")
    }

    func testComplexRealImag() throws {
        let result: ComplexDouble = complex(1.0, 2.0)
        let expected: ComplexDouble = (1.0, 2.0)
        XCTAssertEqual(result, expected, "complex failed")
    }

    func testComplexCount() throws {
        let count: Int = 10
        let result: ComplexDoubleArray = complex(count: count)
        let expectedCount: Int = 10
        XCTAssertEqual(result.0.count, expectedCount, "complex failed")
    }

    func testComplexSized() throws {
        let complexArrayA: ComplexDoubleArray = ([1.0, 2.0], [3.0, 4.0])
        let result = complex(sized: complexArrayA)
        let expectedCount: Int = 2
        XCTAssertEqual(result.0.count, expectedCount, "complex failed")
    }

    // MARK: flip

    func testFlipRealArray() throws {
        let realArrayA: RealDoubleArray = [1.0, 2.0, 3.0, 4.0]
        let result: RealDoubleArray = flip(realArrayA)
        let expected: RealDoubleArray = [4.0, 3.0, 2.0, 1.0]
        XCTAssertEqual(result, expected, "complex failed")
    }

    func testFlipComplexArray() throws {
        let complexArrayA: ComplexDoubleArray = ([1.0, 2.0], [3.0, 4.0])
        let result: ComplexDoubleArray = flip(complexArrayA)
        let expected: ComplexDoubleArray =  ([2.0, 1.0], [4.0, 3.0])
        XCTAssertEqual(result, expected, "complex failed")
    }

    // MARK: length

    func testLengthRealArray() throws {
        let realArrayA: RealDoubleArray = [1.0, 2.0, 3.0, 4.0]
        let result: Int = length(realArrayA)
        let expected: Int = 4
        XCTAssertEqual(result, expected, "length failed")
    }

    func testLengthComplexArray() throws {
        let complexArrayA: ComplexDoubleArray = ([1.0, 2.0], [3.0, 4.0])
        let result: Int = length(complexArrayA)
        let expected: Int = 2
        XCTAssertEqual(result, expected, "length failed")
    }

    // MARK: paddata

    func testPaddataRealArray() throws {
        let pad: Int = 6
        let realArrayA: RealDoubleArray = [1.0, 2.0, 3.0, 4.0]
        let result: RealDoubleArray = paddata(realArrayA, pad)
        let expected: RealDoubleArray = [1.0, 2.0, 3.0, 4.0, 0.0, 0.0]
        XCTAssertEqual(result, expected, "paddata failed")
    }

    func testPaddataComplexArray() throws {
        let pad: Int = 4
        let complexArrayA: ComplexDoubleArray = ([1.0, 2.0], [3.0, 4.0])
        let result: ComplexDoubleArray  = paddata(complexArrayA, pad)
        let expected: ComplexDoubleArray  = ([1.0, 2.0, 0.0, 0.0], [3.0, 4.0, 0.0, 0.0])
        XCTAssertEqual(result, expected, "paddata failed")
    }

    // MARK: repelem

    func testRepelemReal3() throws {
        let rep: Int = 3
        let realA: RealDouble = 9.0
        let result: RealDoubleArray = repelem(realA, rep)
        let expected: RealDoubleArray = [9.0, 9.0, 9.0]
        XCTAssertEqual(result, expected, "repelem failed")
    }

    func testRepelemReal1() throws {
        let rep: Int = 1
        let realA: RealDouble = 9.0
        let result: RealDoubleArray = repelem(realA, rep)
        let expected: RealDoubleArray = [9.0]
        XCTAssertEqual(result, expected, "repelem failed")
    }

    func testRepelemRealArray3() throws {
        let rep: Int = 3
        let realArrayA: RealDoubleArray = [1.0, 2.0]
        let result: RealDoubleArray = repelem(realArrayA, rep)
        let expected: RealDoubleArray = [1.0, 2.0, 1.0, 2.0, 1.0, 2.0]
        XCTAssertEqual(result, expected, "repelem failed")
    }

    func testRepelemRealArray1() throws {
        let rep: Int = 1
        let realArrayA: RealDoubleArray = [1.0, 2.0]
        let result: RealDoubleArray = repelem(realArrayA, rep)
        let expected: RealDoubleArray = [1.0, 2.0]
        XCTAssertEqual(result, expected, "repelem failed")
    }

    func testRepelemComplex3() throws {
        let rep: Int = 3
        let complexA: ComplexDouble = (9.0, 7.0)
        let result: ComplexDoubleArray = repelem(complexA, rep)
        let expected: ComplexDoubleArray = ([9.0, 9.0, 9.0], [7.0, 7.0, 7.0])
        XCTAssertEqual(result, expected, "repelem failed")
    }

    func testRepelemComplex1() throws {
        let rep: Int = 1
        let complexA: ComplexDouble = (9.0, 7.0)
        let result: ComplexDoubleArray = repelem(complexA, rep)
        let expected: ComplexDoubleArray = ([9.0], [7.0])
        XCTAssertEqual(result, expected, "repelem failed")
    }

    func testRepelemComplexArray3() throws {
        let rep: Int = 3
        let complexArrayA: ComplexDoubleArray = ([1.0, 2.0], [3.0, 4.0])
        let result: ComplexDoubleArray = repelem(complexArrayA, rep)
        let expected: ComplexDoubleArray = ([1.0, 2.0, 1.0, 2.0, 1.0, 2.0], [3.0, 4.0, 3.0, 4.0, 3.0, 4.0])
        XCTAssertEqual(result, expected, "repelem failed")
    }

    func testRepelemComplexArray1() throws {
        let rep: Int = 1
        let complexArrayA: ComplexDoubleArray = ([1.0, 2.0], [3.0, 4.0])
        let result: ComplexDoubleArray = repelem(complexArrayA, rep)
        let expected: ComplexDoubleArray = ([1.0, 2.0], [3.0, 4.0])
        XCTAssertEqual(result, expected, "repelem failed")
    }

    // MARK: resize

    func testResizeRealArray() throws {
        let size: Int = 2
        let realArrayA: RealDoubleArray = [1.0, 2.0, 3.0, 4.0]
        let result: RealDoubleArray = resize(realArrayA, size)
        let expected: RealDoubleArray = [1.0, 2.0]
        XCTAssertEqual(result, expected, "resize failed")
    }

    func testResizeComplexArray() throws {
        let size: Int = 2
        let complexArrayA: ComplexDoubleArray = ([1.0, 2.0, 3.0, 4.0], [1.0, 2.0, 3.0, 4.0])
        let result: ComplexDoubleArray = resize(complexArrayA, size)
        let expected: ComplexDoubleArray = ([1.0, 2.0], [1.0, 2.0])
        XCTAssertEqual(result, expected, "resize failed")
    }

    func testResizeRealArrayIncrease() throws {
        let size: Int = 4
        let realArrayA: RealDoubleArray = [1.0, 2.0]
        let result: RealDoubleArray = resize(realArrayA, size)
        let expected: RealDoubleArray = [1.0, 2.0, 0.0, 0.0]
        XCTAssertEqual(result, expected, "resize failed")
    }

    func testResizeComplexArrayIncrease() throws {
        let size: Int = 4
        let complexArrayA: ComplexDoubleArray = ([1.0, 2.0], [1.0, 2.0])
        let result: ComplexDoubleArray = resize(complexArrayA, size)
        let expected: ComplexDoubleArray = ([1.0, 2.0, 0.0, 0.0], [1.0, 2.0, 0.0, 0.0])
        XCTAssertEqual(result, expected, "resize failed")
    }

    // MARK: slice

    func testSliceRealArrayOpen() throws {
        let realArrayA: RealDoubleArray = [1.0, 2.0, 3.0, 4.0]
        let result: RealDoubleArray = slice(realArrayA, 0...2)
        let expected: RealDoubleArray = [1.0, 2.0, 3.0]
        XCTAssertEqual(result, expected, "slice failed")
    }

    func testSliceRealArrayClosed() throws {
        let realArrayA: RealDoubleArray = [1.0, 2.0, 3.0, 4.0]
        let result: RealDoubleArray = slice(realArrayA, 0..<2)
        let expected: RealDoubleArray = [1.0, 2.0]
        XCTAssertEqual(result, expected, "slice failed")
    }

    func testSliceRealArrayOpenBy() throws {
        let by: Int = 2
        let realArrayA: RealDoubleArray = [1.0, 2.0, 3.0, 4.0]
        let result: RealDoubleArray = slice(realArrayA, 0...3, by)
        let expected: RealDoubleArray = [1.0, 3.0]
        XCTAssertEqual(result, expected, "slice failed")
    }

    func testSliceRealArrayClosedBy() throws {
        let by: Int = 2
        let realArrayA: RealDoubleArray = [1.0, 2.0, 3.0, 4.0]
        let result: RealDoubleArray = slice(realArrayA, 0..<4, by)
        let expected: RealDoubleArray = [1.0, 3.0]
        XCTAssertEqual(result, expected, "slice failed")
    }

    func testSliceComplexArrayOpen() throws {
        let complexArrayA: ComplexDoubleArray = ([1.0, 2.0, 3.0, 4.0], [1.0, 2.0, 3.0, 4.0])
        let result: ComplexDoubleArray = slice(complexArrayA, 0...2)
        let expected: ComplexDoubleArray = ([1.0, 2.0, 3.0], [1.0, 2.0, 3.0])
        XCTAssertEqual(result, expected, "slice failed")
    }

    func testSliceComlexArrayClosed() throws {
        let complexArrayA: ComplexDoubleArray = ([1.0, 2.0, 3.0, 4.0], [1.0, 2.0, 3.0, 4.0])
        let result: ComplexDoubleArray = slice(complexArrayA, 0..<2)
        let expected: ComplexDoubleArray = ([1.0, 2.0], [1.0, 2.0])
        XCTAssertEqual(result, expected, "slice failed")
    }

    func testSliceComplexArrayOpenBy() throws {
        let by: Int = 2
        let complexArrayA: ComplexDoubleArray = ([1.0, 2.0, 3.0, 4.0], [1.0, 2.0, 3.0, 4.0])
        let result: ComplexDoubleArray = slice(complexArrayA, 0...3, by)
        let expected: ComplexDoubleArray = ([1.0, 3.0], [1.0, 3.0])
        XCTAssertEqual(result, expected, "slice failed")
    }

    func testSliceComplexArrayClosedBy() throws {
        let by: Int = 2
        let complexArrayA: ComplexDoubleArray = ([1.0, 2.0, 3.0, 4.0], [1.0, 2.0, 3.0, 4.0])
        let result: ComplexDoubleArray = slice(complexArrayA, 0..<4, by)
        let expected: ComplexDoubleArray = ([1.0, 3.0], [1.0, 3.0])
        XCTAssertEqual(result, expected, "slice failed")
    }

    // MARK: trimdata

    func testTrimdataRealArray() throws {
        let size: Int = 2
        let realArrayA: RealDoubleArray = [1.0, 2.0, 3.0, 4.0]
        let result: RealDoubleArray = trimdata(realArrayA, size)
        let expected: RealDoubleArray = [1.0, 2.0]
        XCTAssertEqual(result, expected, "trimdata failed")
    }

    func testTrimdataRealArrayTooLarge() throws {
        let size: Int = 10
        let realArrayA: RealDoubleArray = [1.0, 2.0, 3.0, 4.0]
        let result: RealDoubleArray = trimdata(realArrayA, size)
        let expected: RealDoubleArray = [1.0, 2.0, 3.0, 4.0]
        XCTAssertEqual(result, expected, "trimdata failed")
    }

    func testTrimdataComplexArray() throws {
        let size: Int = 2
        let complexArrayA: ComplexDoubleArray = ([1.0, 2.0, 3.0, 4.0], [1.0, 2.0, 3.0, 4.0])
        let result: ComplexDoubleArray = trimdata(complexArrayA, size)
        let expected: ComplexDoubleArray = ([1.0, 2.0], [1.0, 2.0])
        XCTAssertEqual(result, expected, "trimdata failed")
    }

    func testTrimdataComplexArrayTooLarge() throws {
        let size: Int = 10
        let complexArrayA: ComplexDoubleArray = ([1.0, 2.0, 3.0, 4.0], [1.0, 2.0, 3.0, 4.0])
        let result: ComplexDoubleArray = trimdata(complexArrayA, size)
        let expected: ComplexDoubleArray = ([1.0, 2.0, 3.0, 4.0], [1.0, 2.0, 3.0, 4.0])
        XCTAssertEqual(result, expected, "trimdata failed")
    }
    
    func testFlipReal() throws {
        let realArrayA: RealDoubleArray = [1.0, 2.0, 3.0, 4.0]
        let result: RealDoubleArray = flip(realArrayA)
        let expected: RealDoubleArray = [4.0, 3.0, 2.0, 1.0]
        XCTAssertEqual(result, expected, "flip failed")
    }
    
    func testFlipComplex() throws {
        let complexArrayA: ComplexDoubleArray = ([1.0, 2.0, 3.0, 4.0], [1.0, 2.0, 3.0, 4.0])
        let result: ComplexDoubleArray = flip(complexArrayA)
        let expected: ComplexDoubleArray = ([4.0, 3.0, 2.0, 1.0], [4.0, 3.0, 2.0, 1.0])
        XCTAssertEqual(result, expected, "flip failed")
    }
    
    func testZeros() throws {
        let n = 4
        let result: RealDoubleArray = zeros(n)
        let expected: RealDoubleArray = [0.0, 0.0, 0.0, 0.0]
        XCTAssertEqual(result, expected, "zeros failed")
    }

    
    func testOnes() throws {
        let n = 4
        let result: RealDoubleArray = ones(n)
        let expected: RealDoubleArray = [1.0, 1.0, 1.0, 1.0]
        XCTAssertEqual(result, expected, "ones failed")
    }
    
    func testPaddataReal() throws {
        let length = 4
        let realArrayA: RealDoubleArray = [1.0, 2.0]
        let result: RealDoubleArray = paddata(realArrayA, length)
        let expected: RealDoubleArray = [1.0, 2.0, 0.0, 0.0]
        XCTAssertEqual(result, expected, "paddata failed")
    }
    
    func testPaddataComplex() throws {
        let length = 4
        let complexArrayA: ComplexDoubleArray = ([1.0, 2.0], [1.0, 2.0])
        let result: ComplexDoubleArray = paddata(complexArrayA, length)
        let expected: ComplexDoubleArray = ([1.0, 2.0, 0.0, 0.0], [1.0, 2.0, 0.0, 0.0])
        XCTAssertEqual(result, expected, "paddata failed")
    }
    
    func testResizeRealBigger() throws {
        let length = 4
        let realArrayA: RealDoubleArray = [1.0, 2.0]
        let result: RealDoubleArray = resize(realArrayA, length)
        let expected: RealDoubleArray = [1.0, 2.0, 0.0, 0.0]
        XCTAssertEqual(result, expected, "resize failed")
    }
    
    func testResizeComplexBigger() throws {
        let length = 4
        let complexArrayA: ComplexDoubleArray = ([1.0, 2.0], [1.0, 2.0])
        let result: ComplexDoubleArray = resize(complexArrayA, length)
        let expected: ComplexDoubleArray = ([1.0, 2.0, 0.0, 0.0], [1.0, 2.0, 0.0, 0.0])
        XCTAssertEqual(result, expected, "resize failed")
    }
    
    func testResizeRealSmaller() throws {
        let length = 2
        let realArrayA: RealDoubleArray = [1.0, 2.0, 3.0, 4.0]
        let result: RealDoubleArray = resize(realArrayA, length)
        let expected: RealDoubleArray = [1.0, 2.0]
        XCTAssertEqual(result, expected, "resize failed")
    }
    
    func testResizeComplexSmaller() throws {
        let length = 2
        let complexArrayA: ComplexDoubleArray = ([1.0, 2.0, 3.0, 4.0], [1.0, 2.0, 3.0, 4.0])
        let result: ComplexDoubleArray = resize(complexArrayA, length)
        let expected: ComplexDoubleArray = ([1.0, 2.0], [1.0, 2.0])
        XCTAssertEqual(result, expected, "resize failed")
    }
    
    func testResizeRealSame() throws {
        let realArrayA: RealDoubleArray = [1.0, 2.0, 3.0, 4.0]
        let length = length(realArrayA)
        let result: RealDoubleArray = resize(realArrayA, length)
        let expected: RealDoubleArray = [1.0, 2.0, 3.0, 4.0]
        XCTAssertEqual(result, expected, "resize failed")
    }
    
    func testResizeComplexSame() throws {
        let complexArrayA: ComplexDoubleArray = ([1.0, 2.0, 3.0, 4.0], [1.0, 2.0, 3.0, 4.0])
        let length = length(complexArrayA)
        let result: ComplexDoubleArray = resize(complexArrayA, length)
        let expected: ComplexDoubleArray = ([1.0, 2.0, 3.0, 4.0], [1.0, 2.0, 3.0, 4.0])
        XCTAssertEqual(result, expected, "resize failed")
    }

}
