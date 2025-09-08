//
//  ComplexArrayTests.swift
//  VecLab
//
//  Created by Marcus Painter on 16/04/2025.
//

import VecLab  // Replace with your actual module name
import XCTest

final class ComplexArrayInitTests: XCTestCase {

    func testInit() throws {
        let a = ComplexArray()

        XCTAssertEqual(a.real, [])
        XCTAssertEqual(a.imag, [])
    }

    func testInitRealImag() throws {
        let real = [1.0]
        let imag = [-2.0]

        let a = ComplexArray(real, imag)

        XCTAssertEqual(a.real, real)
        XCTAssertEqual(a.imag, imag)
    }

    func testInitRealOnly() throws {
        let real = [1.0]

        let a = ComplexArray(realOnly: real)

        XCTAssertEqual(a.real, real)
        XCTAssert(a.imag.allSatisfy { $0 == 0.0 })
    }

    func testInitRepeating() throws {
        let complex = Complex(1.0, -2.0)

        let a = ComplexArray(repeating: complex, count: 10)

        XCTAssertEqual(a.count, 10)
        XCTAssert(a.real.allSatisfy { $0 == complex.real })
        XCTAssert(a.imag.allSatisfy { $0 == complex.imag })
    }

    func testInitCount() throws {

        let a = ComplexArray(count: 10)

        XCTAssertEqual(a.count, 10)
        XCTAssert(a.real.allSatisfy { $0 == 0.0 })
        XCTAssert(a.imag.allSatisfy { $0 == 0.0 })
    }

    func testInitArray() throws {
        let complex1 = Complex(1.0, -2.0)
        let complex2 = Complex(2.0, -3.0)
        let array: [Complex] = [complex1, complex2]

        let a = ComplexArray(array: array)

        XCTAssertEqual(a.count, 2)
        XCTAssertEqual(a.real, [1.0, 2.0])
        XCTAssertEqual(a.imag, [-2.0, -3.0])
    }

    func testInitSized() throws {
        let b = [Double](repeating: 1.0, count: 10)

        let a = ComplexArray(sized: b)

        XCTAssertEqual(a.count, b.count)
        XCTAssert(a.real.allSatisfy { $0 == 0.0 })
        XCTAssert(a.imag.allSatisfy { $0 == 0.0 })
    }

}
