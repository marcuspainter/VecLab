//
//  ArraySubscriptsTestsTests.swift
//  VecLab
//
//  Created by Marcus Painter on 17/04/2025.
//

import VecLab  // Replace with your actual module name
import XCTest

final class ArraySubscriptsTests: XCTestCase {
    var m: Int = 1
    var n: Int = 3
    var a: [Double] = [0, 0, 0, 0, 0]
    var b: [Double] = [1, 1, 1, 1, 1]

    override func setUp() {
    }

    override func tearDown() {
    }

    func testRange() {
        a[m..<n] = b[m..<n]
        let expected: [Double] = [0, 1, 1, 0, 0]
        XCTAssertEqual(a, expected, "Failed to assign range")
    }

    func testRange2() {
        a = b[1..<3]
        let expected: [Double] = [1, 1]
        XCTAssertEqual(a, expected, "Failed to assign range")
        print(a)
    }

    func testRange3() {
        a[1..<3] = [7, 7]
        let expected: [Double] = [0, 7, 7, 0, 0]
        XCTAssertEqual(a, expected, "Failed to assign range")
        print(a)
    }

    func testClosedRange() {
        a[m...n] = b[m...n]
        let expected: [Double] = [0, 1, 1, 1, 0]
        XCTAssertEqual(a, expected, "Failed to assign closed range")
    }

    func testPartialRangeUpTo() {
        a[..<n] = b[..<n]
        let expected: [Double] = [1, 1, 1, 0, 0]
        XCTAssertEqual(a, expected, "Failed to assign partial range upto")
    }

    func testPartialRangeThrough() {
        a[...n] = b[...n]
        let expected: [Double] = [1, 1, 1, 1, 0]
        XCTAssertEqual(a, expected, "Failed to assign partial range through")
    }

    func testPartialRangeFrom() {
        a[m...] = b[m...]
        let expected: [Double] = [0, 1, 1, 1, 1]
        XCTAssertEqual(a, expected, "Failed to assign partial range from")
    }

    func testPartialRangeFrom2() {
        a[...] = b[...]
        let expected: [Double] = [1, 1, 1, 1, 1]
        XCTAssertEqual(a, expected, "Failed to assign partial range from")
    }

    func testRangeStep() {
        a[0..<3] = b[0..., 2]
        let expected: [Double] = [1, 1, 1, 0, 0]
        XCTAssertEqual(a, expected, "Failed to assign range")
    }

    func testRangeStep2() {
        b = [1, 2, 3, 4, 5]
        a = b[0..<4, 2]
        let expected: [Double] = [1, 3]
        XCTAssertEqual(a, expected, "Failed to assign range")
        print(a)
    }

    func testClosedRangeStep() {
        a[1...2] = b[1...3, 2]
        let expected: [Double] = [0, 1, 1, 0, 0]
        XCTAssertEqual(a, expected, "Failed to assign closed range")
    }

    func testPartialRangeUpToStep() {
        b = [1, 2, 3, 4, 5]
        a[..<3, 2] = b[..<3, 2]
        print(a)
        let expected: [Double] = [1, 0, 3, 0, 0]
        XCTAssertEqual(a, expected, "Failed to assign partial range upto")
    }

    func testPartialRangeThroughStep() {
        b = [1, 2, 3, 4, 5]
        a[...n, 2] = b[...n, 2]
        let expected: [Double] = [1, 0, 3, 0, 0]
        XCTAssertEqual(a, expected, "Failed to assign partial range through")
    }

    func testPartialRangeFromStep() {
        b = [1, 2, 3, 4, 5]
        a[m..., 2] = b[m..., 2]
        let expected: [Double] = [0, 2, 0, 4, 0]
        XCTAssertEqual(a, expected, "Failed to assign partial range from")
    }

    func testPartialRangeFromStep2() {
        b = [1, 2, 3, 4, 5]
        a[0..., 2] = b[0..., 2]
        let expected: [Double] = [1, 0, 3, 0, 5]
        XCTAssertEqual(a, expected, "Failed to assign partial range from")
    }

}

/*

 |`a[i]`|`subscript(index: Int)`|Access a single element|
 |`a[m..<n]`|`subscript(bounds: Range<Int>`)|Half-open range|
 |`a[m...n]`|`subscript(bounds: ClosedRange<Int>)`|Closed range|
 |`a[..<n]`|`subscript(bounds: PartialRangeUpTo<Int>)`|From start up to (excl. `n`)|
 |`a[...n]`|`subscript(bounds: PartialRangeThrough<Int>)`|From start through `n`|
 |`a[m...]`|`subscript(bounds: PartialRangeFrom<Int>)`|From `m` through end|
 |`a[...]`|`subscript(bounds: PartialRangeFrom<Int>)`|With `m = startIndex`|

 */
