//
//  ComplexTests.swift
//  VecLab
//
//  Created by Marcus Painter on 19/04/2025.
//

import Foundation
import VecLab
import XCTest

class ComplexPropertyTests: XCTestCase {

    func testInit() throws {
        let a = Complex()
        XCTAssertEqual(a.real, 0.0, "init failed")

        let _ = a.real
        let _ = a.imag

        let _ = a.description

        let _ = a.hashValue

        let _ = a.isFinite
        let _ = a.isInfinite
        let _ = a.isNaN
        let _ = a.isNormal
        let _ = a.isSignalingNaN
        let _ = a.isSubnormal
        let _ = a.isZero

        let _ = Complex.i
        let _ = Complex.infinity
        let _ = Complex.nan
        let _ = Complex.zero
    }
}
