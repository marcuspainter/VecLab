//
//  CSTTests.swift
//  VecLab
//
//  Created by Marcus Painter on 30/04/2025.
//

import XCTest
@testable import VecLab
import Accelerate

final class CZTTests: XCTestCase {
    
    func testExample() throws {
        let x: [Double] = [1,2,3,4,5,6,7,8]
        let z = ComplexArray(realOnly: x)
        let g = czt(z)
        let xx = iczt(g)
        disp(g)
        disp(xx)
    }
}
