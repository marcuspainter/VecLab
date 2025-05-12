//
//  SomeTests.swift
//  VecLab
//
//  Created by Marcus Painter on 10/05/2025.
//

import Accelerate
import VecLab
import XCTest

final class SomeTests: XCTestCase {
    func testExample() throws {
        var z = ComplexArray([4, 2, 3, 4], [4, 2, 3, 4])

        z = -z

        print(z)
    }
}
