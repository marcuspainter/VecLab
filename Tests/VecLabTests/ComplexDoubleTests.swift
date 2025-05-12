//
//  ComplexDoubleTests.swift
//  VecLab
//
//  Created by Marcus Painter on 08/05/2025.
//

import XCTest
import VecLab
import Accelerate

final class ComplexDoubleTests: XCTestCase {
    
    func testExample() throws {

        let z1 = ComplexDouble(1, 2)
        let z2 = ComplexDouble(3.0, 4.0)
        
        print(z1)
        print(z2)
    }
}
