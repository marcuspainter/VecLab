//
//  ComplexDoubleArrayTests.swift
//  VecLab
//
//  Created by Marcus Painter on 16/04/2025.
//

import VecLab  // Replace with your actual module name
import XCTest

final class ComplexDoubleArrayInitTests: XCTestCase {

    func testInit() throws {
        let a = ComplexDoubleArray()

        XCTAssertEqual(a.real, [])
        XCTAssertEqual(a.imag, [])
    }

    func testInitRealImag() throws {
        let real = [1.0]
        let imag = [-2.0]

        let a = ComplexDoubleArray(real, imag)

        XCTAssertEqual(a.real, real)
        XCTAssertEqual(a.imag, imag)
    }

    func testInitRealOnly() throws {
        let real = [1.0]

        let a = ComplexDoubleArray(realOnly: real)

        XCTAssertEqual(a.real, real)
        XCTAssert(a.imag.allSatisfy { $0 == 0.0 })
    }

    func testInitRepeating() throws {
        let complex = ComplexDouble(1.0, -2.0)

        let a = ComplexDoubleArray(repeating: complex, count: 10)

        XCTAssertEqual(a.count, 10)
        XCTAssert(a.real.allSatisfy { $0 == complex.real })
        XCTAssert(a.imag.allSatisfy { $0 == complex.imag })
    }

    func testInitCount() throws {

        let a = ComplexDoubleArray(count: 10)

        XCTAssertEqual(a.count, 10)
        XCTAssert(a.real.allSatisfy { $0 == 0.0 })
        XCTAssert(a.imag.allSatisfy { $0 == 0.0 })
    }

    func testInitArray() throws {
        let complex1 = ComplexDouble(1.0, -2.0)
        let complex2 = ComplexDouble(2.0, -3.0)
        let array: [ComplexDouble] = [complex1, complex2]

        let a = ComplexDoubleArray(array: array)

        XCTAssertEqual(a.count, 2)
        XCTAssertEqual(a.real, [1.0, 2.0])
        XCTAssertEqual(a.imag, [-2.0, -3.0])
    }

    func testInitSized() throws {
        let b = [Double](repeating: 1.0, count: 10)

        let a = ComplexDoubleArray(sized: b)

        XCTAssertEqual(a.count, b.count)
        XCTAssert(a.real.allSatisfy { $0 == 0.0 })
        XCTAssert(a.imag.allSatisfy { $0 == 0.0 })
    }

}
