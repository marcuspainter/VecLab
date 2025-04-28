//
//  ComplexDoubleEnumeratedTest.swift
//  VecLab
//
//  Created by Marcus Painter on 25/04/2025.
//

import VecLab // Replace with your actual module name
import XCTest

final class ComplexDoubleArrayEnumeratedTests: XCTestCase {
    
    func testEnumerated() throws {
        let a = ComplexDoubleArray([1, 2, 3, 4, 5], [1, 2, 3, 4, 5])
        let b = a.enumerated()
        print(type(of: b))

        let c = b.map { Real($0) + $1 }

        let total = b.count(where: { _ in true })
        print(total)

        for (i, v) in a.enumerated() {
            print("index: \(i) value: \(v)")
        }

    }

    func testReduce() throws {
        let a = ComplexDoubleArray([1, 2, 3, 4, 5], [1, 2, 3, 4, 5])
        let sum = a.reduce(0, +)
        let expected = ComplexDouble(15, 15)

        XCTAssertEqual(sum, expected, "reduce failed")
    }

    func testFilter() throws {
        let a = ComplexDoubleArray([1, 2, 3, 4, 5], [1, 2, 3, 4, 5])
        let expected = ComplexDoubleArray([3, 4, 5], [3, 4, 5])

        let b = a.filter { $0.real > 2 }
        print(b)
        XCTAssertEqual(b, expected, "filter failed")
    }

    func testForEach() throws {
        let a = ComplexDoubleArray([1, 2, 3, 4, 5], [1, 2, 3, 4, 5])
        a.forEach { print($0) }
    }

    func testZipForEach() throws {
        let a = ComplexDoubleArray([1, 2, 3, 4, 5], [1, 2, 3, 4, 5])
        let b = ComplexDoubleArray([6, 7, 8, 9, 10], [6, 7, 8, 9, 10])

        a.zipForEach(b) { print($0, $1) }
    }
}
